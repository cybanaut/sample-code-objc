//
//  ProductDetailViewController.m
//  Mega
//
//  Created by Sergey on 1/30/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "MegaTheme.h"
@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    productImageView.image = [UIImage imageNamed:@"product-1"];
    
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
    
    sizeContainerView.backgroundColor =  [UIColor whiteColor];

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

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews
{
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    self.tableView.layoutMargins = UIEdgeInsetsZero;
    
}


#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(indexPath.row == 0) {
        
        return 300;
        
    } else if (indexPath.row == 3) {
        
        return 120;
        
    }else if (indexPath.row == 4) {
        
        return 70;
        
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
