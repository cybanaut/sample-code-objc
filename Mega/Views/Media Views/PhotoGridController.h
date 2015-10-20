//
//  PhotoGridController.h
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoGridController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSArray* photos;
}

@property(nonatomic, strong) IBOutlet UICollectionView* collectionView;
@property(nonatomic, strong) IBOutlet UICollectionViewFlowLayout* layout;


@end
