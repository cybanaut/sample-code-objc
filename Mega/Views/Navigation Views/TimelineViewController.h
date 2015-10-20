//
//  TimelineViewController.h
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView* tableViewTimeLine;
    
    IBOutlet UIBarButtonItem* menuItem;
    
    IBOutlet UIToolbar* toolbar;
}

@property(nonatomic, strong) NSString* nagivationStyleToPresent;


-(IBAction)presentNavigation:(id)sender;

-(IBAction)dismiss:(id)sender;

-(IBAction)unwindToViewController:(id)sender;

@end
