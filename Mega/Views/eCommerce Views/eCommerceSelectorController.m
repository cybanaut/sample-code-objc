//
//  eCommerceSelectorController.m
//  Mega
//
//  Created by Sergey on 1/30/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "eCommerceSelectorController.h"

#import "ViewInfo.h"

#import "MetaCell.h"

@interface eCommerceSelectorController ()
{
    
    NSMutableArray* viewLinks;
    
}
@end

@implementation eCommerceSelectorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    viewLinks = [[NSMutableArray alloc] init];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Shop" Segue:@"shop" Description:@"Grid of product images. With a Blur Effect"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Categories" Segue:@"category" Description:@"Rows of images. With a Transparent Effect"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Cart" Segue:@"cart" Description:@"Rows of shopping cart items with product details"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Product Detail" Segue:@"productdetail" Description:@"Product details. Large image with description and info"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Product Scroll Detail" Segue:@"productscroll" Description:@"Product details with Scrollable images."]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Order Info" Segue:@"order" Description:@"Configurable Table of Order details"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Shipping Detail" Segue:@"orderdetail" Description:@"Credit Card, CCV and Shipping Info"]];
    
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"DONE" style:UIBarButtonItemStylePlain target:self action:@selector(doneTapped:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return viewLinks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MetaCell* cell = (MetaCell*)[tableView dequeueReusableCellWithIdentifier:@"MetaCell"];
    
    ViewInfo* info =(ViewInfo*)[viewLinks objectAtIndex:indexPath.row];
    
    [cell.titleLabel setText:info.title];
    
    [cell.subtitleLabel setText:info.view_description];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ViewInfo* info = (ViewInfo*)[viewLinks objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:info.segue sender:self];
    
}



-(void)doneTapped : (id)sender
{

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}
@end
