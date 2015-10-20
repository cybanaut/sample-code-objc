//
//  NavigationFullController.h
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationFullController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UIImageView* bgImageView;
    IBOutlet UITableView* tableViewMenu;
    IBOutlet UIView* dimmerView;
    
}
@end
