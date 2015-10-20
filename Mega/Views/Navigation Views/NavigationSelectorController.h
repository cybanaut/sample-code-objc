//
//  NavigationSelectorController.h
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationSelectorController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView* tableViewSelector;
}
@end
