//
//  TMDPhotoImage.h
//  TMDPhotoApp
//
//  Created by Tom Daggett on 2014-08-07.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDPhotoImage : NSObject

@property (strong, nonatomic) NSString *fileName;
@property (strong, nonatomic) UIImage *uiImage;
@property (strong, nonatomic) NSString *imageTitle;
@property (strong, nonatomic) NSString *commentText;
@property (strong, nonatomic) NSString *locationDescription;
@property (strong, nonatomic) NSString *subjectMatterDescription;

- (instancetype)initWithFileName:(NSString *)fileName;

@end
