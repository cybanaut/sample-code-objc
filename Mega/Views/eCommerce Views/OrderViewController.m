//
//  OrderViewController.m
//  Mega
//
//  Created by Sergey on 1/31/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "OrderViewController.h"
#import "MegaTheme.h"
@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    productImageView.image = [UIImage imageNamed:@"product-1"];
    productImageView.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
    productImageView.layer.borderWidth = 0.4;
    
    titleLabel.font = [UIFont fontWithName:[MegaTheme fontName] size:17];
    titleLabel.textColor = MegaTheme.darkColor;
    titleLabel.text = @"Armani Jeans Shirt";
    
    detailsLabel.font = [UIFont fontWithName:MegaTheme.fontName size:12];
    detailsLabel.textColor = MegaTheme.lightColor;
    detailsLabel.text = @"Size M, Color Blue";
    
    priceLabel.font = [UIFont fontWithName:MegaTheme.fontName size:15];
    priceLabel.textColor = [UIColor blueColor];
    priceLabel.text = @"$144";
    
    salePriceLabel.font = [UIFont fontWithName:MegaTheme.fontName size:12];
    salePriceLabel.textColor = MegaTheme.lightColor;
    NSMutableAttributedString* salePrice =   [[NSMutableAttributedString alloc] initWithString:@"$177"];
    [salePrice addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, salePrice.length)];
    salePriceLabel.attributedText = salePrice;
    
    CGFloat fontSize = 12;
    
    deliveryLabel.font =   [UIFont fontWithName:MegaTheme.boldFontName size:fontSize];
    deliveryLabel.textColor = MegaTheme.darkColor;
    deliveryLabel.text = @"DELIVERY METHOD";
    
    deliveryValue.font =  [UIFont fontWithName:MegaTheme.fontName size:fontSize];
    deliveryValue.textColor = MegaTheme.lightColor;
    deliveryValue.text = @"USPS EXPRESS";
    
    paymentLabel.font = [UIFont fontWithName: MegaTheme.boldFontName size: fontSize];
    paymentLabel.textColor = MegaTheme.darkColor;
    paymentLabel.text = @"PAYMENT METHOD";
    
    paymentValue.font = [UIFont fontWithName: MegaTheme.fontName size: fontSize];
    paymentValue.textColor = MegaTheme.lightColor;
    paymentValue.text = @"AMEX";
    
    paymentValue2.font = [UIFont fontWithName: MegaTheme.fontName size: fontSize];
    paymentValue2.textColor = MegaTheme.lightColor;
    paymentValue2.text = @"**** *******3476";
    
    addressLabel.font = [UIFont fontWithName: MegaTheme.boldFontName size: fontSize];
    addressLabel.textColor = MegaTheme.darkColor;
    addressLabel.text = @"ADDRESS";
    
    addressValue.font = [UIFont fontWithName: MegaTheme.fontName size: fontSize];
    addressValue.textColor = MegaTheme.lightColor;
    addressValue.text = @"145 Spindle Avenue \nHollywood, California \nCA-32320, United States";
    
    summaryLabel.font = [UIFont fontWithName: MegaTheme.boldFontName size: fontSize];
    summaryLabel.textColor = MegaTheme.darkColor;
    summaryLabel.text = @"SUMMARY";
    
    subtotalLabel.font = [UIFont fontWithName: MegaTheme.fontName size: fontSize];
    subtotalLabel.textColor = MegaTheme.lightColor;
    subtotalLabel.text = @"SUBTOTAL";
    
    subtotalValue.font = [UIFont fontWithName: MegaTheme.fontName size: fontSize];
    subtotalValue.textColor = MegaTheme.lightColor;
    subtotalValue.text = @"$144.99";
    
    shippingLabel.font = [UIFont fontWithName: MegaTheme.fontName size: fontSize];
    shippingLabel.textColor = MegaTheme.lightColor;
    shippingLabel.text = @"SHIPPING";
    
    shippingValue.font = [UIFont fontWithName: MegaTheme.fontName size: fontSize];
    shippingValue.textColor = MegaTheme.lightColor;
    shippingValue.text = @"$4.00";
    
    totalLabel.font = [UIFont fontWithName: MegaTheme.boldFontName size: 13];
    totalLabel.textColor = MegaTheme.darkColor;
    totalLabel.text = @"TOTAL";
    
    totalValue.font = [UIFont fontWithName: MegaTheme.boldFontName size: 13];
    totalValue.textColor = MegaTheme.lightColor;
    totalValue.text = @"$148.99";
    
    orderButton.titleLabel.font = [UIFont fontWithName: MegaTheme.boldFontName size: 18];
    [orderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [orderButton setTitle:@"PLACE ORDER" forState:UIControlStateNormal];
    orderButton.backgroundColor = [UIColor colorWithRed:0.14 green:0.71 blue:0.69 alpha:1.0];
    orderButton.layer.cornerRadius = 20;
    orderButton.layer.borderWidth = 0;
    orderButton.clipsToBounds = true;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        
        return 100;
        
    }else if (indexPath.row == 3) {
        
        return 100;
        
    }else if (indexPath.row == 4) {
        
        return 180;
        
    }else{
        
        return 60;
        
    }
    
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
