//
//  ProductScrollViewController.h
//  Mega
//
//  Created by Sergey on 1/31/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductScrollViewController : UITableViewController <UICollectionViewDataSource, UICollectionViewDelegate>

{
    IBOutlet UILabel* titleLabel;
    
    IBOutlet UILabel* stockLabel;
    
    IBOutlet UILabel* priceLabel;
    
    IBOutlet UILabel* saleLabel;
    
    IBOutlet UIView* colorContainerView;
    
    IBOutlet UIView* sizeContainerView;
    
    IBOutlet UIView* spacerView;
    
    IBOutlet UILabel* sizeLabel;
    
    IBOutlet UILabel* colorLabel;
    
    IBOutlet UILabel* sizeValueLabel;
    
    IBOutlet UILabel* colorValueLabel;
    
    IBOutlet UILabel* descriptionLabel;
    
    IBOutlet UIButton* orderButton;
    
    IBOutlet UICollectionView* productCollectionView;
    
    IBOutlet UICollectionViewFlowLayout* productCollectionLayout;
    
    IBOutlet UICollectionView* otherItemsCollectionView;
    
    IBOutlet UICollectionViewFlowLayout* otherItemsCollectionLayout;
    
}

@end
