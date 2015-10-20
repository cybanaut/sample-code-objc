//
//  NavigationFullController.m
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "NavigationFullController.h"
#import "NavigationModel.h"
#import "NavigationFullCell.h"
@interface NavigationFullController ()
{
    NSArray* items;
}
@end

@implementation NavigationFullController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableViewMenu.delegate = self;
    tableViewMenu.dataSource = self;
    tableViewMenu.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableViewMenu.backgroundColor = [UIColor clearColor];
    
    bgImageView.image = [UIImage imageNamed: @"nav-bg"];
    dimmerView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    
    NavigationModel* item1 = [[NavigationModel alloc] initWithTitle: @"MY ACCOUNT" icon: @"icon-home"];
    NavigationModel* item2 = [[NavigationModel alloc] initWithTitle: @"COMMENTS" icon: @"icon-chat" count: @"3"];
    NavigationModel* item3 = [[NavigationModel alloc] initWithTitle: @"FAVORITES" icon: @"icon-star"];
    NavigationModel* item4 = [[NavigationModel alloc] initWithTitle: @"SETTINGS" icon: @"icon-filter"];
    NavigationModel* item5 = [[NavigationModel alloc] initWithTitle: @"ABOUT" icon: @"icon-info"];
    
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
    
    NavigationFullCell* cell = [tableView dequeueReusableCellWithIdentifier:@"NavigationFullCell"];
    NavigationModel* item = items[indexPath.row];
    
    cell.titleLabel.text = item.title;
    cell.countLabel.text = item.count;
    cell.iconImageView.image = [UIImage imageNamed: item.icon];
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
