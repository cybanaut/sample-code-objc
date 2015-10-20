//
//  ViewController.m
//  Mega
//
//  Created by Sergey on 1/30/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "ViewController.h"

#import "ViewInfo.h"

#import "MetaCell.h"

@interface ViewController ()
{
    
    NSMutableArray* viewLinks;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    viewLinks = [[NSMutableArray alloc] init];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"eCommerce Views" Segue:@"eCommerce" Description:@"for Shopping Carts, Product Images, Grids and Tables"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Navigation Views" Segue:@"Navigation" Description:@"Navigation using Animated Transitions"]];
    
    [viewLinks addObject: [[ViewInfo alloc] initWithTitle:@"Social Views" Segue:@"Social" Description:@"Timelines, User Profiles and more"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Graphs/Charts Views" Segue:@"Charts" Description:@"Bar/Pie/Line Charts, Animated and Beautiful:-)"]];
    
    [viewLinks addObject:[[ViewInfo alloc] initWithTitle:@"Media (Music Player Controls)" Segue:@"Media" Description:@"Albums Grids, Music Player Controls and more..."]];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
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
    
    ViewInfo* info =(ViewInfo*)[viewLinks objectAtIndex:indexPath.row];
    
    if(![info.segue isEqualToString:@"none"]){
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:info.segue bundle:nil];
        
        UIViewController* controller = storyboard.instantiateInitialViewController;
        
        [self showViewController:controller sender:self];
        
    }
    
}

@end
