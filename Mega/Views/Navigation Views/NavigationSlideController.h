//
//  NavigationSlideController.h
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationSlideController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UIImageView* bgImageView;
    
    IBOutlet UIView* dimmerView;
    
    IBOutlet UITableView* tableViewMenu;

    
}
@end
