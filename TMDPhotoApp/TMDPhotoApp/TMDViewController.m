//
//  TMDViewController.m
//  TMDPhotoApp
//
//  Created by Tom Daggett on 2014-08-07.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDViewController.h"

@interface TMDViewController ()

@property (strong, nonatomic) TMDPhotoImageCollection *photoImageCollection;

@end

@implementation TMDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.photoImageCollection = [[TMDPhotoImageCollection alloc] init];
    
    //
    //hard-coding images for now
    NSMutableArray *imageFileNames = [[NSMutableArray alloc] init];
    
    NSArray *arrayOfImageFilePaths = [[NSBundle mainBundle] pathsForResourcesOfType:@"jpg" inDirectory:nil];
    
    for (NSString *pathString in arrayOfImageFilePaths) {
        [imageFileNames addObject:[pathString lastPathComponent]];
    }
    
    self.photoImageCollection = [[TMDPhotoImageCollection alloc] initWithPhotoImageFileNames:imageFileNames];
    // ends hard-coding for getting images into the system
    //
    
    
    
    self.myCollectionView.collectionViewLayout = [[TMDCustomCollectionViewFlowLayout alloc] init];
    
    TMDCustomCollectionViewFlowLayout *myCustomLayout = (TMDCustomCollectionViewFlowLayout *)self.myCollectionView.collectionViewLayout;
    
    myCustomLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    myCustomLayout.itemSize = CGSizeMake(300.0, 160.0);
    
    
    
    [self.myCollectionView registerClass:[TMDCustomCollectionViewCell class] forCellWithReuseIdentifier:@"PhotoImageCell"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    //[self.myCollectionView reloadData];
}


#pragma mark - UICollectionViewDataSource methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.photoImageCollection numberOfSectionsToDisplay];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photoImageCollection numberOfPhotosInSection:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    TMDCustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoImageCell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.imageView.image = [self.photoImageCollection imageAtIndex:indexPath.row];
        
        cell.backgroundColor = [UIColor whiteColor];
    } else {
        
        cell.imageView.image = [self.photoImageCollection imageAtIndex:indexPath.row forGroupNumber:indexPath.section];
        cell.backgroundColor = [UIColor greenColor];
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlow methods

-(CGSize)collectionView:(UICollectionView *)collectionView
                 layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(200, 200);
}



@end
