//
//  ProductScrollViewController.m
//  Mega
//
//  Created by Sergey on 1/31/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "ProductScrollViewController.h"
#import "MegaTheme.h"
#import "Product.h"
#import "ProductCell.h"
#import "ProductImageCell.h"

@interface ProductScrollViewController ()
{
    CGFloat productImageHeight;
    
    NSArray* relatedProducts;
}
@end

@implementation ProductScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    productImageHeight = 300;
    
    productCollectionView.dataSource = self;
    productCollectionView.delegate = self;
    productCollectionView.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1.0];
    
    productCollectionLayout.minimumLineSpacing = 10;
    productCollectionLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    productCollectionLayout.itemSize = CGSizeMake(productImageHeight - 15, productImageHeight - 15);
    
    titleLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:15];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"Armani Jeans Shirt";
    
    stockLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:11];
    stockLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
    stockLabel.text = @"Availability: In Stock";
    
    saleLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:11];
    saleLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
    
    NSMutableAttributedString* salePrice = [[NSMutableAttributedString alloc] initWithString:@"$177"];
    [salePrice addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, salePrice.length)];
    saleLabel.attributedText = salePrice;
    
    priceLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:15];
    priceLabel.textColor = [UIColor blueColor];
    priceLabel.text = @"$144";
    
    colorContainerView.backgroundColor = [UIColor whiteColor];
    sizeContainerView.backgroundColor = [UIColor whiteColor];
    spacerView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
    
    colorLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:13];
    
    colorLabel.textColor = [UIColor blackColor];
    
    colorLabel.text = @"Color";
    
    sizeLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:13];
    sizeLabel.textColor = [UIColor blackColor];
    sizeLabel.text = @"Size";
    
    sizeValueLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:13];
    sizeValueLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
    sizeValueLabel.text = @"M";
    
    colorValueLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:13];
    colorValueLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
    colorValueLabel.text = @"Blue";
    
    descriptionLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:13];

    descriptionLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    descriptionLabel.text = @"Long sleeve striped Armani Shirt in Dark Colors. Blue sky from the Armani Jeans Collection Line. 100% Cotton and High grade Polyester. Order today to get free shipping";
    
    orderButton.titleLabel.font = [UIFont fontWithName:[MegaTheme boldFontName] size:18];
    [orderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [orderButton setTitle:@"ADD TO CART" forState:UIControlStateNormal];
    orderButton.backgroundColor = [UIColor colorWithRed:0.14 green:0.71 blue:0.32 alpha:1.0];
    orderButton.layer.cornerRadius = 20;
    orderButton.layer.borderWidth = 0;
    orderButton.clipsToBounds = true;
    
    otherItemsCollectionView.delegate = self;
    otherItemsCollectionView.dataSource = self;
    otherItemsCollectionView.backgroundColor = [UIColor clearColor];
    
    otherItemsCollectionLayout.minimumInteritemSpacing = 0;
    otherItemsCollectionLayout.minimumLineSpacing = 0;
    
    CGFloat cellWidth =  [self calcCellWidth:self.view.frame.size];
    
    otherItemsCollectionLayout.itemSize = CGSizeMake(cellWidth, cellWidth);
    
    Product* product1 = [[Product alloc] initWithTitle:@"Espirit Shirt" Price:@"$45" Image:@"product-1"];
    
    Product* product2 = [[Product alloc] initWithTitle:@"Chaplin Memo Shirt" Price:@"$45" Image:@"product-2"];
    
    Product* product3 = [[Product alloc] initWithTitle:@"London/ NY Shirt" Price:@"$35" Image:@"product-3"];
    
    Product* product4 = [[Product alloc] initWithTitle:@"Retro Grey" Price:@"$65" Image:@"product-4"];
 
    relatedProducts = @[product1, product2, product3, product4];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        
        return productImageHeight;
        
    } else if (indexPath.row == 3) {
        
        return 120;
        
    }else if (indexPath.row == 4) {
        
        return 70;
        
    }else if (indexPath.row == 5) {
        
        return 400;
        
    }else{
        
        return 45;
        
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
 {
    
     cell.separatorInset = UIEdgeInsetsZero;
     cell.layoutMargins = UIEdgeInsetsZero;
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)viewDidLayoutSubviews
{
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView == productCollectionView) {
        
        ProductImageCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductImageCell" forIndexPath:indexPath];
        
        cell.productImageView.image = [UIImage imageNamed:@"product-1"];
        
        return cell;
        
    }else{
        
        ProductCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductCell" forIndexPath:indexPath];
        
        int index = (int)indexPath.row % relatedProducts.count;
        Product* product = relatedProducts[index];
        
        cell.imageView.image =  [UIImage imageNamed:product.image];
        cell.titleLabel.text = product.title;
        cell.priceLabel.text = product.price;
        
        return cell;
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == productCollectionView) {
        
        return 3;
        
    }else{
        
        return relatedProducts.count;
        
    }
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
