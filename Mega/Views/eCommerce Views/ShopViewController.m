//
//  ShopViewController.m
//  Mega
//
//  Created by Sergey on 1/30/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "ShopViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "MegaTheme.h"

@interface ShopViewController ()
{
    NSArray* products;
    CGFloat cellHeight;
}
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cellHeight = 200;
    
    layout.minimumInteritemSpacing = 0;
    
    layout.minimumLineSpacing = 0;
    
    CGFloat cellWidth =  [self calcCellWidth:self.view.frame.size];
    
    layout.itemSize = CGSizeMake(cellWidth, cellHeight);
    
    UIBarButtonItem* rightBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cart"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    self.title = @"T-Shirts";
    
    Product* product1 = [[Product alloc] initWithTitle:@"Espirit Shirt" Price:@"$45" Image:@"product-1"];
    
    Product* product2 = [[Product alloc] initWithTitle:@"Chaplin Memo Shirt" Price:@"$45" Image:@"product-2"];
    
    Product* product3 = [[Product alloc] initWithTitle:@"London/ NY Shirt" Price:@"$35" Image:@"product-3"];
    
    Product* product4 = [[Product alloc] initWithTitle:@"Retro Grey" Price:@"$65" Image:@"product-4"];

    Product* product5 = [[Product alloc] initWithTitle:@"Hadncrafted Tee" Price:@"$25" Image:@"product-5"];
    
    Product* product6 = [[Product alloc] initWithTitle:@"Denim Rollup Shirt" Price:@"$55" Image:@"product-6"];

    
    products = @[product1, product2, product3, product4, product5, product6];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UICollectionView DataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ProductCell* cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductCell" forIndexPath:indexPath];
    
    int index = (int)(indexPath.row % products.count);
    
    Product* product =(Product*) products[index];
    
    cell.imageView.image = [UIImage imageNamed:product.image];
    
    cell.titleLabel.text = product.title;
    
    cell.priceLabel.text = product.price;

    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 10;
    
}

-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ProductCell* cell = (ProductCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    [cell setCellSelected:YES];
    
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ProductCell* cell = (ProductCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    [cell setCellSelected:NO];
    
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
    
    
    float cellWidth = size.width / 2;
    
    if (transitionToWide) {
        
        cellWidth = size.width / 3;
        
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
