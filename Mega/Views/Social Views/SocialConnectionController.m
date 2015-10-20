//
//  SocialConnectionController.m
//  Mega
//
//  Created by Sergey on 2/2/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "SocialConnectionController.h"
#import "ConnectionCell.h"
@interface SocialConnectionController ()
{
    NSArray* connections;
}
@end

@implementation SocialConnectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Connections";
    
    self.tableView.rowHeight = 44;
    
    NSDictionary* connection1 = @{@"name" : @"Facebook", @"icon" : @"social-facebook"};
    NSDictionary* connection2 = @{@"name" : @"Twitter", @"icon" : @"social-twitter"};
    NSDictionary* connection3 = @{@"name" : @"Instagram", @"icon" : @"social-instagram"};
    NSDictionary* connection4 = @{@"name" : @"Google+", @"icon" : @"social-google"};
    NSDictionary* connection5 = @{@"name" : @"LinkedIn", @"icon" : @"social-linkedin"};
    
    connections = @[connection1, connection2, connection3, connection4, connection5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConnectionCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ConnectionCell"];
    
    NSDictionary* connection = connections[indexPath.row];
    
    cell.iconImageView.image = [UIImage imageNamed:connection[@"icon"]];
    cell.titleLabel.text = connection[@"name"];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return connections.count;
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
