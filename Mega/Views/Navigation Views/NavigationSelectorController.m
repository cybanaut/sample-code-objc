//
//  NavigationSelectorController.m
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "NavigationSelectorController.h"
#import "MetaCell.h"
#import "ViewInfo.h"
#import "TimelineViewController.h"
@interface NavigationSelectorController ()
{
    NSMutableArray* viewLinks;
}
@end

@implementation NavigationSelectorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    viewLinks = [[NSMutableArray alloc] init];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Side Navigation" Segue:@"presentSideNavigation" Description:@"Mini Slide Animation. Icons only"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Full Navigation" Segue:@"presentFullNavigation" Description:@"Full Pop-out Animation"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Table Navigation" Segue:@"presentTableNavigation" Description:@"Traditional Slide-Out Animation"]];
    
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"DONE" style:UIBarButtonItemStylePlain target:self action:@selector(doneTapped:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return viewLinks.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    MetaCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MetaCell"];
    
    ViewInfo* info = viewLinks[indexPath.row];
    
    cell.titleLabel.text = info.title;
    
    cell.subtitleLabel.text = info.view_description;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"timelineNav" sender:self];
    
}


-(void)doneTapped: (id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    TimelineViewController* controller = segue.destinationViewController;
    
    NSIndexPath* indexPath = [tableViewSelector indexPathForSelectedRow];
    ViewInfo* info = viewLinks[indexPath.row];
    controller.nagivationStyleToPresent = info.segue;


}


@end
