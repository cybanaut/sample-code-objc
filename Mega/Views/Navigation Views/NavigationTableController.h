//
//  NavigationTableController.h
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationTableController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UIImageView* bgImageView;
    IBOutlet UITableView* tableViewMenu;
    IBOutlet UIView* dimmerView;
    IBOutlet UIView* bottomFillView;
    
    IBOutlet UILabel* nameLabel;
    IBOutlet UILabel* locationLabel;
    IBOutlet UIImageView* locationImageView;
    IBOutlet UIImageView* profileImageView;
    IBOutlet UIButton* logoutButton;
    
}
@end
