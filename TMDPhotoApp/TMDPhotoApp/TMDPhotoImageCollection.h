//
//  TMDPhotoImageCollection.h
//  TMDPhotoApp
//
//  Created by Tom Daggett on 2014-08-07.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDPhotoImage.h"

@interface TMDPhotoImageCollection : NSObject


- (instancetype)initWithPhotoImageFileNames:(NSArray *)arrayOfPhotoImageFileNames;

- (NSUInteger)numberOfPhotosToDisplay;
- (NSUInteger)numberOfSectionsToDisplay;

- (UIImage *)imageAtIndex:(NSUInteger)index;

- (NSUInteger)numberOfPhotosInSection:(NSUInteger)groupNumber;

- (UIImage *)imageAtIndex:(NSUInteger)index forGroupNumber:(NSUInteger)groupNumber;

@end
