//
//  CartViewController.h
//  Mega
//
//  Created by Sergey on 1/30/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    
    IBOutlet UILabel* totalLabel;

    IBOutlet UILabel* totalTitle;

    IBOutlet UIButton* orderButton;
    
}


@end
