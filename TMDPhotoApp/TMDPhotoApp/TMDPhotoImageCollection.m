//
//  TMDPhotoImageCollection.m
//  TMDPhotoApp
//
//  Created by Tom Daggett on 2014-08-07.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDPhotoImageCollection.h"

@interface TMDPhotoImageCollection ()

@property (strong, nonatomic) NSMutableOrderedSet *photoSet;
@property (strong, nonatomic) NSMutableDictionary *groupedPhotos;

@end

@implementation TMDPhotoImageCollection

- (instancetype)init
{
    return [self initWithPhotoImageFileNames:nil];
}

- (instancetype)initWithPhotoImageFileNames:(NSArray *)arrayOfPhotoImageFileNames{
    self = [super init];
    if (self) {
        _photoSet = [[NSMutableOrderedSet alloc] init];
        _groupedPhotos = [[NSMutableDictionary alloc] init];
        
        
        // hard-coding of loading photos
        if (arrayOfPhotoImageFileNames) {
            
            for (NSString *photoImageFileName in arrayOfPhotoImageFileNames) {
                
                [_photoSet addObject:[[TMDPhotoImage alloc] initWithFileName:photoImageFileName]];
                
            }
            
            
            self.groupedPhotos[@"eyes"] = [[NSMutableOrderedSet alloc] init];
            self.groupedPhotos[@"mouth"] = [[NSMutableOrderedSet alloc] init];
            self.groupedPhotos[@"nose"] = [[NSMutableOrderedSet alloc] init];
            
            for (TMDPhotoImage *photoImage in _photoSet) {
                
                NSRange range = [photoImage.fileName rangeOfString:@"eyes"];
                if (range.location != NSNotFound) {
                    [self.groupedPhotos[@"eyes"] addObject:photoImage];
                }
                
                range = [photoImage.fileName rangeOfString:@"mouth"];
                if (range.location != NSNotFound) {
                    [self.groupedPhotos[@"mouth"] addObject:photoImage];
                }
                
                range = [photoImage.fileName rangeOfString:@"nose"];
                if (range.location != NSNotFound) {
                    [self.groupedPhotos[@"nose"] addObject:photoImage];
                }
            }
        }
    }
    return self;
}


- (NSUInteger)numberOfPhotosToDisplay
{
    return [self.photoSet count];
}

- (NSUInteger)numberOfSectionsToDisplay
{
    return [self.groupedPhotos.allKeys count] + 1;
}

- (NSUInteger)numberOfPhotosInSection:(NSUInteger)groupNumber
{
    if (groupNumber == 0) {
        
        return [self numberOfPhotosToDisplay];
        
    } else {
        
        NSString *groupName = [self.groupedPhotos.allKeys objectAtIndex:(groupNumber - 1)];
        
        return [self numberOfPhotosInGroup:groupName];
    }
}

- (NSUInteger)numberOfPhotosInGroup:(NSString *)groupName
{
    if(self.groupedPhotos[groupName] == nil) {
        return 0;
    } else {
        return [self.groupedPhotos[groupName] count];
    }
}

- (UIImage *)imageAtIndex:(NSUInteger)index
{
    NSLog(@"photoSet has %d items", [self.photoSet count]);
    
    if (index >= [self.photoSet count]) {
        
        return nil;
        
    } else {
    
        return ((TMDPhotoImage *)[self.photoSet objectAtIndex:index]).uiImage;
    }
}

- (UIImage *)imageAtIndex:(NSUInteger)index forGroupNumber:(NSUInteger)groupNumber
{
    if (groupNumber == 0 || groupNumber > [self.groupedPhotos.allKeys count]) {
        
        return nil;
        
    } else {
        
        NSString *groupName = [self.groupedPhotos.allKeys objectAtIndex:(groupNumber - 1)];
        
        if (index > ([self.groupedPhotos[groupName] count] - 1) ) {
            
            return nil;
            
        }
        
        return ((TMDPhotoImage *)[self.groupedPhotos[groupName] objectAtIndex:index]).uiImage;
    }
}






@end
