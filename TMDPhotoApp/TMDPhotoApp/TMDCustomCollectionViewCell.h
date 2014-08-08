//
//  TMDCustomCollectionViewCell.h
//  TMDPhotoApp
//
//  Created by Tom Daggett on 2014-08-07.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TMDPhotoImage;

@interface TMDCustomCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) TMDPhotoImage *photo;

@end
