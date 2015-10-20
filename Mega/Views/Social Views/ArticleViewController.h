//
//  ArticleViewController.h
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UITableViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    IBOutlet UILabel* titleLabel;
    IBOutlet UILabel* dateLabel;
    IBOutlet UIImageView* topImageView;
    IBOutlet UIImageView* dateImageView;
    
    IBOutlet UIButton* backbutton;
    
    IBOutlet UIImageView* profileImageView;
    IBOutlet UILabel* nameLabel;
    
    IBOutlet UILabel* articleLabel;
    IBOutlet UIButton* likeButton;
    
    IBOutlet UICollectionView* photosCollectionView;
    IBOutlet UILabel* photosLabel;
    IBOutlet UICollectionViewFlowLayout* photosLayout;
    IBOutlet UIView* photosContainer;
    
    NSArray* photos;
    
}
@end
