//
//  PictureListViewController.m
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "PictureListViewController.h"
#import "Person.h"
#import "PictureCell.h"
@interface PictureListViewController ()

@end

@implementation PictureListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"People";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tabSegmentControl.items = @[@"People", @"Friends", @"Requests"];
    
    
    Person* person1 = [[Person alloc] initWithName:@"Linda Cristofssen" profilePicUrl:@"people-profile-1" backgroundPicUrl: @"people-pic-1" location:@"London, UK" commentCount:@"3"];
    
    Person* person2 = [[Person alloc] initWithName:@"Christopher Bale" profilePicUrl:@"people-profile-2" backgroundPicUrl: @"people-pic-2" location:@"Sacramento, CA" commentCount:@"20"];
    
    Person* person3 = [[Person alloc] initWithName:@"Angelina Jolie" profilePicUrl:@"people-profile-3" backgroundPicUrl: @"people-pic-3" location:@"Los Angeles, CA" commentCount:@"21"];
    
    Person* person4 = [[Person alloc] initWithName:@"Tom Cruise" profilePicUrl:@"people-profile-4" backgroundPicUrl:@"people-pic-4" location:@"Seattle, WA" commentCount:@"46"];
    
    Person* person5 = [[Person alloc] initWithName:@"Adam Sandler" profilePicUrl:@"people-profile-5" backgroundPicUrl: @"people-pic-5" location:@"New York, NY" commentCount:@"31"];
    
    people = @[person1, person2, person3, person4, person5];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return people.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PictureCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PictureCell"];

    Person* person = people[indexPath.row];
    
    cell.nameLabel.text = person.name;
    cell.profileImageView.image = [UIImage imageNamed:person.profilePicUrl];
    cell.bgImageView.image = [UIImage imageNamed:person.backgroundPicUrl];
    cell.locationLabel.text = person.location;
    cell.commentsLabel.text = @"\(person.commentCount) Comments";
    
    return cell;
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
