//
//  SocialSelectorController.m
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "SocialSelectorController.h"
#import "ViewInfo.h"
#import "MetaCell.h"
@interface SocialSelectorController ()
{
    NSMutableArray* viewLinks;
}
@end

@implementation SocialSelectorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    viewLinks = [[NSMutableArray alloc] init];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Profile View" Segue:@"profile" Description:@"Show Social Stats for the User, Photos and More"]];
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"User Account View" Segue:@"account" Description:@"Show Account Info and Login details"]];
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"User Timeline View" Segue:@"timeline" Description:@"Good to show News Feed and Image updates"]];
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Article/Blog Post View" Segue:@"article" Description:@"With Featured images and Author details"]];
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Sign In/Log In  View" Segue:@"signin" Description:@"Perfect for getting users signed into your app"]];
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Picture Table View" Segue:@"picture" Description:@"Image-Centric Table View. Good for displaying Contacts/Friends etc"]];
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Social Accounts/ Icons" Segue:@"social" Description:@"Icons for Social Networks/Connections"]];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"DONE" style:UIBarButtonItemStylePlain target:self action:@selector(doneTapped:)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
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
    ViewInfo* info = viewLinks[indexPath.row];
    [self performSegueWithIdentifier:info.segue sender:self];
}

-(void)doneTapped:(id)sender
{

    [self dismissViewControllerAnimated:YES completion:nil];
    
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
