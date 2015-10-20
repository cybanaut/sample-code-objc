//
//  BarChartController.h
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADVSegmentedControl.h"
#import "ADVTabSegmentControl.h"
#import "JBBarChartView.h"
@interface BarChartController : UITableViewController
{
    IBOutlet UILabel* titleLabel;
    IBOutlet UIButton* backButton;
    IBOutlet UIImageView* topImageView;
    IBOutlet UILabel* salesLabel;
    IBOutlet UILabel* salesValue;
    
    IBOutlet ADVSegmentedControl* segmentControl;
    
    IBOutlet ADVTabSegmentControl* tabSegmentControl;
    
    IBOutlet UIView* chartContentView;
    
    NSArray* chartData;
    NSArray* monthlySymbols;
    
    
    CGFloat chartHeight ;
    CGFloat chartFontSize ;
    
    
}
@property(nonatomic, strong) JBBarChartView* barChartView;

@end

@interface BarView: UIView

@property(nonatomic, strong) CAGradientLayer* gradientLayer;

@end
