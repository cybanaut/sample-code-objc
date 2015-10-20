//
//  LineChartController.m
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "LineChartController.h"
#import "MegaTheme.h"
@interface LineChartController ()

@end

@implementation LineChartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tabSegmentControl.items = @[@"WEEKLY", @"MONTHLY", @"YEARLY"];
    tabSegmentControl.font = [UIFont fontWithName:MegaTheme.boldFontName size: 12];
    tabSegmentControl.selectedIndex = 0;
    [tabSegmentControl addTarget:self action:@selector(tabSelectionChanged:) forControlEvents:UIControlEventValueChanged];
    
    lineChartView = [[ANDLineChartView alloc] initWithFrame:CGRectZero];
    [lineChartView setTranslatesAutoresizingMaskIntoConstraints:NO];
    lineChartView.chartBackgroundColor = UIColor.whiteColor;
    lineChartView.gridIntervalLinesColor = [UIColor colorWithWhite:0.83 alpha: 1.0];
    
    lineChartView.lineColor = [UIColor colorWithRed: 0.14 green: 0.71 blue: 0.69 alpha: 1.0];
    lineChartView.elementStrokeColor = [UIColor colorWithRed: 0.14 green: 0.71 blue: 0.69 alpha:1.0];
     lineChartView.gradientStartColor = [UIColor colorWithRed: 0.14 green: 0.71 blue: 0.69 alpha: 0.7];
    lineChartView.gradientEndColor = [UIColor colorWithRed: 0.14 green: 0.71 blue: 0.69 alpha: 0.1];
    lineChartView.elementFillColor = UIColor.whiteColor;
    lineChartView.gridIntervalFont = [UIFont fontWithName:MegaTheme.semiBoldFontName size: 13];
    lineChartView.gridIntervalFontColor = [UIColor colorWithWhite:0.47 alpha: 1.0];
    lineChartView.delegate = self;
    lineChartView.dataSource = self;
    
    [chartContainer addSubview:lineChartView];
    [self addConstraintsToFillSubView:lineChartView mainView: chartContainer];
    
    weeklyData = [[DataPointCollection alloc] init];
    weeklyData.values = @[@11, @15, @14, @26, @18, @24, @24];
    weeklyData.labels = @[@"MON", @"TUE", @"WED", @"THU", @"FRI", @"SAT", @"SUN"];
    
    monthlyData = [[DataPointCollection alloc] init];
    monthlyData.values = @[@11, @15, @14, @26, @18, @24, @24, @15, @14, @26, @26, @7];
    monthlyData.labels = @[@"JAN", @"FEB", @"MAR", @"APR", @"MAY", @"JUN", @"JUL", @"AUG", @"SEP", @"OCT", @"NOV", @"DEC"];
    
    yearlyData = [[DataPointCollection alloc] init];
    yearlyData.values = @[@9, @12, @22, @18, @18];
    yearlyData.labels = @[@"2011", @"2012", @"2013", @"2014", @"2015"];
    
    chartData = weeklyData;
    gridIntervals = @[@0, @5, @10, @15, @20, @25, @30, @35];
    
    webLabel.text = @"WEB APPS";
    webLabel.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size: 16];
    webLabel.textColor = [UIColor colorWithWhite: 0.48 alpha: 1.0];
    
    webValue.text = @"$20,443";
    webValue.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size: 30];
    webValue.textColor = UIColor.blackColor;
    
    bankLabel.text = @"BANK FEES";
    bankLabel.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size: 16];
    bankLabel.textColor = [UIColor colorWithWhite:0.48 alpha: 1.0];
    
    bankValue.text = @"$14,211";
    bankValue.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size: 30];
    bankValue.textColor = UIColor.blackColor;
    
    rentLabel.text = @"RENT";
    rentLabel.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size: 16];
    rentLabel.textColor = [UIColor colorWithWhite:0.48 alpha: 1.0];
    
    rentValue.text = @"40%";
    rentValue.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size: 30];
    rentValue.textColor = UIColor.blackColor;
    
    revenueLabel.text = @"REVENUE";
    revenueLabel.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size: 16];
    revenueLabel.textColor = [UIColor colorWithWhite:0.48 alpha: 1.0];
    
    revenueValue.text = @"+150%";
    revenueValue.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size: 30];
    revenueValue.textColor = UIColor.blackColor;
    
    [refreshButton setTitle:@"REFRESH" forState:UIControlStateNormal];
    [refreshButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    refreshButton.backgroundColor = [UIColor colorWithRed:0.52 green: 0.39 blue: 0.76 alpha: 1.0];
    refreshButton.titleLabel.font = [UIFont fontWithName:MegaTheme.boldFontName size: 25];
    [refreshButton addTarget:self action:@selector(refreshButtonTapped:) forControlEvents: UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        return 300;
    }else if (indexPath.row == 2 || indexPath.row == 3){
        return 100;
    }else if (indexPath.row == 4) {
        return 60;
    }
    return 44;
}

-(void)tabSelectionChanged:(id)sender
{
    if (tabSegmentControl.selectedIndex == 0){
        chartData = weeklyData;
    }else if (tabSegmentControl.selectedIndex == 1){
        chartData = monthlyData;
    }else{
        chartData = yearlyData;
    }
    
    [lineChartView reloadData];
}

// Line Chart Datasource

-(NSUInteger)numberOfElementsInChartView:(ANDLineChartView *)chartView
{
    return chartData.labels.count;
}

-(CGFloat)chartView:(ANDLineChartView *)chartView valueForElementAtRow:(NSUInteger)row
{
    return [chartData.values[row] floatValue];
}

-(NSString *)chartView:(ANDLineChartView *)chartView labelForElementAtRow:(NSUInteger)row
{
    return chartData.labels[row];
}
-(CGFloat)maxValueForGridIntervalInChartView:(ANDLineChartView *)chartView
{
    return [gridIntervals[gridIntervals.count - 1] floatValue];
}
-(CGFloat)minValueForGridIntervalInChartView:(ANDLineChartView *)chartView
{
    return [gridIntervals[0] floatValue];
}
-(NSUInteger)numberOfGridIntervalsInChartView:(ANDLineChartView *)chartView
{
    return gridIntervals.count;
}
-(NSString *)chartView:(ANDLineChartView *)chartView descriptionForGridIntervalValue:(CGFloat)interval
{
    return [NSString stringWithFormat:@"%.0f",interval];
}

// Line Chart Delegate
-(CGFloat)chartView:(ANDLineChartView *)chartView spacingForElementAtRow:(NSUInteger)row
{

    return 30.0;

}

-(void)addConstraintsToFillSubView:(UIView*)subView mainView:(UIView*)mainView
{
    
    
    //    NSLayoutConstraint* bottomConstraint = [NSLayoutConstraint constraintWithItem:barView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:label attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];

    NSLayoutConstraint* topConstraint = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: mainView attribute:NSLayoutAttributeTop multiplier: 1.0 constant: 20.0];
    
    NSLayoutConstraint* bottomConstraint = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeBottom multiplier:1.0 constant: -20.0];
    
    NSLayoutConstraint* leftConstraint = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeLeft multiplier:1.0 constant: 0.0];
    
    NSLayoutConstraint* rightConstraint = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:mainView attribute:NSLayoutAttributeRight multiplier: 1.0 constant: 0.0];
    
    [mainView addConstraints:@[topConstraint, rightConstraint, leftConstraint, bottomConstraint]];
}

-(void)refreshButtonTapped:(id)sender
{
    
    [refreshButton startAnimating];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target: self selector: @selector(stopAnimation:) userInfo: nil repeats: NO];
}


-(void)stopAnimation:(id)sender
{
    [refreshButton stopAnimating];
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
