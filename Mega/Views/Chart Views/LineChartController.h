//
//  LineChartController.h
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADVTabSegmentControl.h"
#import "ANDLineChartView.h"
#import "DataPointCollection.h"
#import "ADVAnimatedButton.h"
@interface LineChartController : UITableViewController <ANDLineChartViewDataSource, ANDLineChartViewDelegate>
{
    IBOutlet ADVTabSegmentControl* tabSegmentControl;
    
    IBOutlet UIView* chartContainer;
    ANDLineChartView* lineChartView;
    
    DataPointCollection* chartData;
    
    DataPointCollection* weeklyData;
    DataPointCollection* yearlyData;
    DataPointCollection* monthlyData;
    
    NSArray* gridIntervals;
    
    IBOutlet UILabel* webLabel;
    IBOutlet UILabel* webValue;
    
    IBOutlet UILabel* bankLabel;
    IBOutlet UILabel* bankValue;
    
    IBOutlet UILabel* rentLabel;
    IBOutlet UILabel* rentValue;
    
    IBOutlet UILabel* revenueLabel;
    IBOutlet UILabel* revenueValue;
    
    IBOutlet ADVAnimatedButton* refreshButton;
    
    NSTimer* timer;
    
}

@end
