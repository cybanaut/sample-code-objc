//
//  NavigationSlideController.m
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "NavigationSlideController.h"
#import "NavigationSideCell.h"
@interface NavigationSlideController ()
{
    NSArray* icons;
}
@end

@implementation NavigationSlideController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableViewMenu.delegate = self;
    tableViewMenu.dataSource = self;
    tableViewMenu.separatorStyle =  UITableViewCellSeparatorStyleNone;
    tableViewMenu.backgroundColor = [UIColor clearColor];
    
    bgImageView.image = [UIImage imageNamed: @"nav-bg"];
    dimmerView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
    
    icons = @[@"icon-home", @"icon-chat", @"icon-star", @"icon-filter", @"icon-info"];
    
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
    
    NavigationSideCell* cell = [tableView dequeueReusableCellWithIdentifier:@"NavigationSideCell"];
    NSString* icon = icons[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed: icon];
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
