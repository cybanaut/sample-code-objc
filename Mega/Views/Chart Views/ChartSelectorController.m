//
//  ChartSelectorController.m
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "ChartSelectorController.h"
#import "ViewInfo.h"
#import "MetaCell.h"

@interface ChartSelectorController ()
{
    NSMutableArray* viewLinks;
}
@end

@implementation ChartSelectorController

- (void)viewDidLoad {
    [super viewDidLoad];

    viewLinks = [[NSMutableArray alloc] init];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Bar Chart View" Segue:@"barchart" Description:@"Display a Bar chart with a gradient fill"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Progress Chart View" Segue:@"progresschart" Description:@"Display a Pie chart with a gradient fill"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Map View" Segue:@"map" Description:@"Great for displaying events etc."]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Line Chart" Segue:@"linechart" Description:@"Display a data series"]];
    
    
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
