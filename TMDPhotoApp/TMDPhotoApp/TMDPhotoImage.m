//
//  TMDPhotoImage.m
//  TMDPhotoApp
//
//  Created by Tom Daggett on 2014-08-07.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDPhotoImage.h"

@implementation TMDPhotoImage

- (instancetype)init
{
    return [self initWithFileName:nil];
}

- (instancetype)initWithFileName:(NSString *)fileName
{
    self = [super init];
    if (self) {
        _fileName = fileName;
        _uiImage = [UIImage imageNamed:_fileName];
    }
    return self;
}

@end
