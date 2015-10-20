//
//  ProgressChartController.h
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADVTabSegmentControl.h"
#import "ADVProgressControl.h"
@interface ProgressChartController : UITableViewController<UICollectionViewDelegate, UICollectionViewDataSource>
{
    
    IBOutlet ADVTabSegmentControl* tabSegmenControl;
    
    IBOutlet UICollectionViewFlowLayout* collectionLayout;
    
    IBOutlet ADVProgressControl* yearControl1;
    IBOutlet ADVProgressControl* yearControl2;
    IBOutlet ADVProgressControl* yearControl3;
    IBOutlet ADVProgressControl* yearControl4;
    
    IBOutlet UIView* warmColorIndicator;
    IBOutlet UILabel* warmColorLabel;
    
    IBOutlet UIView* coldColorIndicator;
    IBOutlet UILabel* coldColorLabel;
    
    IBOutlet UIButton* gradientButton;
    
    NSArray* coldColorsStart;
    NSArray* coldColorsEnd;
    NSArray* warmColorsStart;
    NSArray* warmColorsEnd;
    
    NSArray* yearControls;
    
    NSArray* revenueModel;
    
    CGFloat progressSize;
}

@property(nonatomic, strong) IBOutlet UICollectionView* collectionView;


@end
