//
//  NavigationTableController.m
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "NavigationTableController.h"
#import "MegaTheme.h"
#import "NavigationModel.h"
#import "NavigationTableCell.h"
@interface NavigationTableController ()
{
    NSArray* items;
}
@end

@implementation NavigationTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableViewMenu.delegate = self;
    tableViewMenu.dataSource = self;
    tableViewMenu.separatorColor = [UIColor colorWithWhite:0.20 alpha:1.0];
    
    UIColor* backgroundColor = [UIColor colorWithWhite:0.15 alpha:1.0];
    tableViewMenu.backgroundColor = backgroundColor;
    bottomFillView.backgroundColor = backgroundColor;
    
    bgImageView.image = [UIImage imageNamed: @"nav-bg"];
    dimmerView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    
    nameLabel.font = [UIFont fontWithName: MegaTheme.fontName size: 19];
    nameLabel.textColor =  [UIColor whiteColor];
    nameLabel.text = @"Linda Hoylett";
    
    locationLabel.font = [UIFont fontWithName: MegaTheme.fontName size: 13];
    locationLabel.textColor = [UIColor whiteColor];
    locationLabel.text = @"London, UK";
    
    profileImageView.image = [UIImage imageNamed: @"profile-pic-1"];
    profileImageView.layer.cornerRadius = 50;
    
    locationImageView.image = [UIImage imageNamed: @"location"];
    
    logoutButton.titleLabel.font = [UIFont fontWithName: MegaTheme.boldFontName size: 18];
    [logoutButton setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
    [logoutButton setTitle:@"LOGOUT" forState: UIControlStateNormal];
    logoutButton.backgroundColor =  [UIColor colorWithRed:0.83 green:0.18 blue:0.21 alpha:1.0];
    logoutButton.clipsToBounds = true;
    
    NavigationModel* item1 = [[NavigationModel alloc] initWithTitle : @"MY ACCOUNT" icon: @"icon-home"];
    NavigationModel* item2 = [[NavigationModel alloc] initWithTitle : @"COMMENTS" icon: @"icon-chat" count: @"3"];
    NavigationModel* item3 = [[NavigationModel alloc] initWithTitle : @"FAVORITES" icon: @"icon-star"];
    NavigationModel* item4 = [[NavigationModel alloc] initWithTitle : @"SETTINGS" icon: @"icon-filter"];
    NavigationModel* item5 = [[NavigationModel alloc] initWithTitle : @"ABOUT" icon: @"icon-info"];
    
    items = @[item1, item2, item3, item4, item5];
    
    // Do any additional setup after loading the view.
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
    
    NavigationTableCell* cell = [tableView dequeueReusableCellWithIdentifier:@"NavigationTableCell"];
    
    NavigationModel* item = items[indexPath.row];
    
    cell.titleLabel.text = item.title;
    cell.countLabel.text = item.count;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
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
