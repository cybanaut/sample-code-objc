//
//  OrderViewController.h
//  Mega
//
//  Created by Sergey on 1/31/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UITableViewController
{
    
    IBOutlet UIImageView* productImageView;
    IBOutlet UILabel* titleLabel;
    IBOutlet UILabel* detailsLabel;
    IBOutlet UILabel* priceLabel;
    IBOutlet UILabel* salePriceLabel;
   
    IBOutlet UILabel* deliveryLabel;
    IBOutlet UILabel* deliveryValue;
    
    IBOutlet UILabel* paymentLabel;
    IBOutlet UILabel* paymentValue;
    IBOutlet UILabel* paymentValue2;
    
    IBOutlet UILabel* addressLabel;
    IBOutlet UILabel* addressValue;
    
    IBOutlet UILabel* summaryLabel;
    IBOutlet UILabel* subtotalLabel;
    IBOutlet UILabel* subtotalValue;
    IBOutlet UILabel* shippingLabel;
    IBOutlet UILabel* shippingValue;
    
    IBOutlet UILabel* totalLabel;
    IBOutlet UILabel* totalValue;
    
    IBOutlet UIButton* orderButton;
    
    
}
@end
