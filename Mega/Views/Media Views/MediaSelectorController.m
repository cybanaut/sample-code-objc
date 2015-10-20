//
//  MediaSelectorController.m
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "MediaSelectorController.h"
#import "ViewInfo.h"
#import "MetaCell.h"

@interface MediaSelectorController ()
{
    NSMutableArray* viewLinks;
}
@end

@implementation MediaSelectorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    viewLinks = [[NSMutableArray alloc] init];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Album View" Segue:@"album" Description:@"A Grid of Album Covers and Metadata"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Player View" Segue:@"player" Description:@"Audio player with controls"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Photo View" Segue:@"photo" Description:@"A Grid of pictures and metadata"]];
    
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
