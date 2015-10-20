//
//  PhotoGridController.m
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "PhotoGridController.h"
#import "PhotoCell.h"

@interface PhotoGridController ()

@end

@implementation PhotoGridController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Photos";
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = UIColor.clearColor;
    
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    
    CGFloat cellWidth =[self calcCellWidth:self.view.frame.size];
    self.layout.itemSize = CGSizeMake(cellWidth, cellWidth);
    
    NSDictionary* photo1 = @{@"photoUrl" : @"grid-photo-1", @"count" : @"23"};
    NSDictionary* photo2 = @{@"photoUrl" : @"grid-photo-2", @"count" : @"13"};
    NSDictionary* photo3 = @{@"photoUrl" : @"grid-photo-3", @"count" : @"82"};
    NSDictionary* photo4 = @{@"photoUrl" : @"grid-photo-4", @"count" : @"45"};
    NSDictionary* photo5 = @{@"photoUrl" : @"grid-photo-5", @"count" : @"10"};
    NSDictionary* photo6 = @{@"photoUrl" : @"grid-photo-6", @"count" : @"39"};
    NSDictionary* photo7 = @{@"photoUrl" : @"grid-photo-7", @"count" : @"56"};
    NSDictionary* photo8 = @{@"photoUrl" : @"grid-photo-8", @"count" : @"18"};
    NSDictionary* photo9 = @{@"photoUrl" : @"grid-photo-9", @"count" : @"39"};
    
    photos = @[photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    PhotoCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    NSDictionary* photo = photos[indexPath.row];
    
    cell.coverImageView.image = [UIImage imageNamed: photo[@"photoUrl"]];
    cell.countLabel.text = photo[@"count"];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return photos.count;
}
-(CGFloat) calcCellWidth:(CGSize)size
{
    float cellWidth = size.width / 3;
    return cellWidth;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
