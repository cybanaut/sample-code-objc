//
//  CategoryViewController.m
//  Mega
//
//  Created by Sergey on 1/30/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "CategoryViewController.h"

#import "ProductCategory.h"

#import "CategoryCell.h"

#import "MegaTheme.h"

@interface CategoryViewController ()
{
    
    NSArray* categories;
    
    CGFloat cellHeight;

}
@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    cellHeight = 150;

    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    CGFloat cellWidth =  [self calcCellWidth:self.view.frame.size];
    
    layout.itemSize = CGSizeMake(cellWidth, cellHeight);
    
    ProductCategory* category1 = [[ProductCategory alloc] initWithTitle:@"T - Shirts" Count:@"33" Image:@"category-1"];
    
    ProductCategory* category2 = [[ProductCategory alloc] initWithTitle:@"Dresses" Count:@"25" Image:@"category-2"];
    
    ProductCategory* category3 = [[ProductCategory alloc] initWithTitle:@"Denim" Count:@"18" Image:@"category-3"];
    
    ProductCategory* category4 = [[ProductCategory alloc] initWithTitle:@"Accessories" Count:@"20" Image:@"category-4"];
    
    categories = @[category1, category2, category3, category4];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UICollectionView DataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CategoryCell* cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCell" forIndexPath:indexPath];
    
    int index = (int)indexPath.row % categories.count;
    
    ProductCategory* category =(ProductCategory*) categories[index];
    
    cell.imageView.image = [UIImage imageNamed:category.image];
    
    cell.titleLabel.text = category.title;
    
    cell.countLabel.text = [NSString stringWithFormat:@"(%@)",category.count];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 10;
    
}

-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CategoryCell* cell = (CategoryCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    [cell setSelected:YES];
    
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CategoryCell* cell = (CategoryCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    [cell setSelected:NO];
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView* headerView ;
    
    
    if( [kind isEqualToString:@"UICollectionElementKindSectionHeader"]){
        
        headerView = (UICollectionReusableView*)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ShopHeaderView" forIndexPath:indexPath];
        
        UILabel* headerTitleLabel = (UILabel*)[headerView viewWithTag:1];
        
        headerTitleLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:14];
        
        headerTitleLabel.textColor = [UIColor colorWithWhite:0.4 alpha:1.0];
        
        headerTitleLabel.text = @"NEW ARRIVALS";
        
    }
    
    return headerView;
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    
    CGFloat cellWidth = [self calcCellWidth:size];
    
    layout.itemSize = CGSizeMake(cellWidth, 200);
    
}

-(CGFloat) calcCellWidth :(CGSize) size {
    
    BOOL transitionToWide = size.width > size.height;
    
    float cellWidth = size.width;
    
    if (transitionToWide) {
        
        cellWidth = size.width / 2;
        
    }
    
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
