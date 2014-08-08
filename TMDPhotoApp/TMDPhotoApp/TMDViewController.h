//
//  TMDViewController.h
//  TMDPhotoApp
//
//  Created by Tom Daggett on 2014-08-07.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMDPhotoImageCollection.h"
#import "TMDPhotoImage.h"
#import "TMDCustomCollectionViewCell.h"
#import "TMDCustomCollectionViewFlowLayout.h"

@interface TMDViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayoutForMyCollectionView;

@end
