//
//  ArticleViewController.m
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "ArticleViewController.h"
#import "MegaTheme.h"
@interface ArticleViewController ()

@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    titleLabel.font = [UIFont fontWithName:MegaTheme.fontName size: 21];
    titleLabel.textColor =  [UIColor whiteColor];
    titleLabel.text = @"21 Days in Indonesia";
    
    dateLabel.font = [UIFont fontWithName:MegaTheme.fontName size: 10];
    dateLabel.textColor = [UIColor whiteColor];
    dateLabel.text = @"12 mins ago";
    
    dateImageView.image = [[UIImage imageNamed:@"clock"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    dateImageView.tintColor = [UIColor whiteColor];
    
    topImageView.image = [UIImage imageNamed:@"indonesia"];
    
    nameLabel.font = [UIFont fontWithName:MegaTheme.fontName size: 18];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.text = @"by Rachel Cristofsson";
    
    profileImageView.image = [UIImage imageNamed:@"profile-pic-2"];
    profileImageView.layer.cornerRadius = 18;
    profileImageView.clipsToBounds = YES;
    
    UIImage* backImage = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [backbutton setImage:backImage forState: UIControlStateNormal];
    backbutton.tintColor = [UIColor whiteColor];
    [backbutton addTarget:self action:@selector(backTapped:) forControlEvents: UIControlEventTouchUpInside];
    
    articleLabel.font = [UIFont fontWithName:MegaTheme.fontName size: 12];
    articleLabel.textColor =  [UIColor colorWithWhite:0.45 alpha:1.0];
    
    NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:@"While technically more of a condiment, the chili-based sauce known as sambal is a staple at all Indonesian tables. Dishes are not complete unless they have a hearty dollop of the stuff, a combination of chilies, sharp fermented shrimp paste, tangy lime juice, sugar and salt all pounded up with mortar and pestle. \n\n\n\n\nSo beloved is sambal, some restaurants have made it their main attraction, with options that include young mango, mushroom and durian.\nIndonesia remains a popular destination with travelers to Asia. Agoda.com understands that traveler want to get the best deal. That's why we offer you the best online rates at 4011 hotels nationwide. We have every main region covered, including West Java, Central Java, East Java, with lots of promotions such as early bird offers and last minute deals. Oh and whatever you do, Bali, Jakarta, Bandung are great cities to visit. With our best price guarantee, we are determined to offer you the best hotels at the best prices."];
    
    NSTextAttachment* textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:@"hotel-1"];
    
    NSAttributedString* stringwithAttachment = [NSAttributedString attributedStringWithAttachment:textAttachment];
    
    [attributedString replaceCharactersInRange:NSMakeRange(316, 1) withAttributedString: stringwithAttachment];
    
    
    articleLabel.attributedText = attributedString;
    
    UIImage* likeImage = [[UIImage imageNamed:@"like"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [likeButton setImage:likeImage forState: UIControlStateNormal];
    
    photosLabel.font = [UIFont fontWithName:MegaTheme.boldFontName size: 16];
    photosLabel.textColor =  [UIColor blackColor];
    photosLabel.text = @"PHOTOS";
    
    photosContainer.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1.0];
    
    photosCollectionView.delegate = self;
    photosCollectionView.dataSource = self;
    photosCollectionView.backgroundColor =  [UIColor clearColor];
    
    photosLayout.itemSize = CGSizeMake(90, 90);
    photosLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    photosLayout.minimumInteritemSpacing = 2;
    photosLayout.minimumLineSpacing = 10;
    
    photos = @[@"photos-1", @"photos-2", @"photos-3"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0){
        return 200;
    }else if (indexPath.row == 2){
        return 530;
    }else if (indexPath.row == 3){
        return 200;
    }else{
        return 50;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath: indexPath];
    
    UIImageView* imageView = (UIImageView*)[cell viewWithTag:1];
    NSString* photo = photos[indexPath.row];
    imageView.image = [UIImage imageNamed:photo];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return photos.count;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)viewDidLayoutSubviews
{
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
}

-(void)backTapped:(id)sender
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
