//
//  TimelineViewController.m
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "TimelineViewController.h"
#import "TimelineCell.h"
#import "TransitionOperator.h"
@interface TimelineViewController ()
{
    TransitionOperator* transitionOperator;
}
@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableViewTimeLine.delegate = self;
    tableViewTimeLine.dataSource = self;
    tableViewTimeLine.estimatedRowHeight = 100.0;
    tableViewTimeLine.rowHeight = UITableViewAutomaticDimension;
    tableViewTimeLine.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    transitionOperator = [[TransitionOperator alloc] init];
    
    menuItem.image = [UIImage imageNamed:@"menu"];
    
    toolbar.tintColor = [UIColor blackColor];
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [tableViewTimeLine reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row % 2 == 0) {
        
        TimelineCell* cell = [tableView dequeueReusableCellWithIdentifier:@"TimelineCell"];
        
        cell.typeImageView.image = [UIImage imageNamed: @"timeline-chat"];
        cell.profileImageView.image = [UIImage imageNamed: @"profile-pic-1"];
        cell.nameLabel.text = @"John Hoylett";
        cell.postLabel.text = @"Checking out of the hotel today. It was really fun to see everyone and catch up. We should have more conferences like this so we can share ideas.";
        cell.dateLabel.text = @"2 mins ago";
        return cell;
        
    }else{
        
        TimelineCell* cell = [tableView dequeueReusableCellWithIdentifier:@"TimelineCellPhoto"];

        cell.typeImageView.image = [UIImage imageNamed: @"timeline-photo"];
        cell.profileImageView.image = [UIImage imageNamed: @"profile-pic-2"];
        cell.nameLabel.text = @"Linda Hoylett";
        cell.photoImageView.image = [UIImage imageNamed: @"dish"];
        cell.dateLabel.text = @"2 mins ago";
        return cell;
    }
}

-(void)presentNavigation:(id)sender
{
    
    if (self.nagivationStyleToPresent != nil) {
        
        transitionOperator.transitionStyle = self.nagivationStyleToPresent;
        [self performSegueWithIdentifier:self.nagivationStyleToPresent sender:self];
    }
}

-(void)dismiss:(id)sender
{

    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)unwindToViewController:(id)sender
{
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UIViewController* toViewController = segue.destinationViewController;
    self.modalPresentationStyle = UIModalPresentationCustom;
    toViewController.transitioningDelegate = transitionOperator;

}


@end
