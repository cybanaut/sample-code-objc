//
//  BarChartController.m
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "BarChartController.h"
#import "MegaTheme.h"
#import "JBBarChartView.h"

@interface BarChartController () <JBBarChartViewDataSource, JBBarChartViewDelegate>

@end

@implementation BarChartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    chartHeight = 200;
    chartFontSize = 11;

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    titleLabel.font = [UIFont fontWithName:MegaTheme.fontName size: 21];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @"Statistics";
    
    salesLabel.font = [UIFont fontWithName:MegaTheme.boldFontName size: 16];
    salesLabel.textColor = [UIColor colorWithRed: 0.27 green: 0.80 blue: 0.34 alpha: 1.0];
    salesLabel.text = @"SALES";
    
    salesValue.font = [UIFont fontWithName:MegaTheme.boldFontName size: 30];
    salesValue.textColor = [UIColor whiteColor];
    salesValue.text = @"$81,694";
    
    topImageView.image = [UIImage imageNamed:@"stats-bg"];
    topImageView.clipsToBounds = YES;
    topImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UIImage* backImage = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [backButton setImage:backImage forState:UIControlStateNormal];
    backButton.tintColor = [UIColor whiteColor];
    [backButton addTarget:self action:@selector(backTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    
    segmentControl.items = @[@"WEEKLY", @"MONTHLY", @"YEARLY"];
    segmentControl.font = [UIFont fontWithName:MegaTheme.boldFontName size: 12];
    segmentControl.borderColor = [UIColor colorWithWhite:1.0 alpha: 0.3];
    segmentControl.selectedIndex = 1;
    [segmentControl addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    tabSegmentControl.items = @[@"WEEKLY", @"MONTHLY", @"YEARLY"];
    tabSegmentControl.font = [UIFont fontWithName:MegaTheme.boldFontName size: 12];
    tabSegmentControl.selectedIndex = 2;
    [tabSegmentControl addTarget:self action:@selector(tabSegmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    chartData = @[@18, @35, @30, @67, @60,@60, @128, @70, @50, @40, @44, @20, @60, @128, @70, @50, @40, @44, @20];
    
    monthlySymbols = [[NSDateFormatter alloc] init].shortMonthSymbols;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setupBarChart];
}

-(void)setupBarChart
{
    
    float width = self.view.frame.size.width;
    
    self.barChartView = [[JBBarChartView alloc] init];
    
    self.barChartView.frame = CGRectMake(0, 0, width, width);
    
    self.barChartView.delegate = self;
    self.barChartView.dataSource = self;
    self.barChartView.headerPadding = 10.0;
    self.barChartView.minimumValue = 0.0;
    self.barChartView.inverted = NO;
    self.barChartView.backgroundColor = [UIColor whiteColor];
    
    [chartContentView addSubview:self.barChartView];
    
    CGFloat angle = M_PI * 0.5;
    
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(angle);
    
    self.barChartView.transform = transform;
    
    [self.barChartView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 1) {
        return 50;
    }else if (indexPath.row == 2) {
        return chartHeight + 50;
    }else{
        return 200;
    }
    
}

 #pragma mark - JBBarChartViewDelegate
-(CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtIndex:(NSUInteger)index
{
    
    CGFloat data = [chartData[index] floatValue];
    return data;
}

-(UIView *)barChartView:(JBBarChartView *)barChartView barViewAtIndex:(NSUInteger)index
{
    return [self createViewForBarChartAtIndex:(int)index];
}

-(UIColor *)barSelectionColorForBarChartView:(JBBarChartView *)barChartView
{
    return [UIColor whiteColor];
}

-(CGFloat)barPaddingForBarChartView:(JBBarChartView *)barChartView
{
    return 1.0;
}
#pragma mark - JBBarChartViewDataSource

-(NSUInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView
{
    return chartData.count;
}

#pragma mark - JBChartViewDataSource
-(BOOL)shouldExtendSelectionViewIntoHeaderPaddingForChartView:(JBChartView *)chartView
{
    return YES;
}
-(BOOL)shouldExtendSelectionViewIntoFooterPaddingForChartView:(JBChartView *)chartView
{
    return NO;
}

-(void)backTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(UIView*)createViewForBarChartAtIndex:(int)index
{
    
    BarView* barView = [[BarView alloc] initWithFrame:CGRectMake(0, 0, 20, 100)];
    
    CGColorRef startColor = [UIColor colorWithRed:0.35 green: 0.86 blue: 0.75 alpha: 1.0].CGColor;
    CGColorRef endColor = [UIColor colorWithRed: 0.31 green: 0.67 blue: 0.90 alpha: 1.0].CGColor;
    barView.gradientLayer = [CAGradientLayer layer];
    barView.gradientLayer.frame = barView.bounds;
    barView.gradientLayer.colors = @[(__bridge id)startColor,(__bridge id)endColor];
    barView.gradientLayer.locations = @[@0.0, @0.5];
    
    [barView.layer insertSublayer:barView.gradientLayer atIndex:0];

    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 20, 20)];
    
    label.font = [UIFont fontWithName:MegaTheme.boldFontName size: chartFontSize];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    int textToDisplay = [chartData[index] intValue];
    label.text =  [NSString stringWithFormat:@"%d",textToDisplay];
    
    CGFloat angle = M_PI * -0.5;
    label.transform = CGAffineTransformMakeRotation(angle);
    
    [barView addSubview:label];
    
    

    NSLayoutConstraint* topConstraint = [NSLayoutConstraint constraintWithItem:barView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:label attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
//    NSLayoutConstraint* bottomConstraint = [NSLayoutConstraint constraintWithItem:barView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:label attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    NSLayoutConstraint* rightConstraint = [NSLayoutConstraint constraintWithItem:barView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:label attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint* leftConstraint = [NSLayoutConstraint constraintWithItem:barView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem: label attribute:NSLayoutAttributeLeft multiplier:1.0 constant: 0];
    
    NSLayoutConstraint* heightConstraint = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem: nil attribute:NSLayoutAttributeNotAnAttribute multiplier: 1.0 constant: 50];
    
    [barView addConstraints:@[topConstraint, leftConstraint, rightConstraint]];
    [label addConstraint:heightConstraint];
    
    return barView;
}

-(void)segmentValueChanged:(id)sender
{
    
    if (segmentControl.selectedIndex == 0 ){
        salesValue.text = @"$23,399";
    }else if (segmentControl.selectedIndex == 1){
        salesValue.text = @"$81,295";
    }else{
        salesValue.text = @"$199,392";
    }
    
}

-(void)tabSegmentValueChanged:(id)sender
{
    
    if (tabSegmentControl.selectedIndex == 0) {
        chartData = @[@70,@50, @20, @60, @128, @70, @50, @40, @4, @20, @60, @128, @70, @50, @40, @44, @20];
    }else if (tabSegmentControl.selectedIndex == 1){
        chartData = @[@18, @35, @30, @67, @60, @60, @128, @70, @50, @40, @44, @20, @60, @128, @70, @50, @40, @44, @20];
    }else{
        chartData = @[@128, @70, @50, @70, @50, @20, @60, @128, @70, @50, @70, @50, @20, @60, @128, @70, @50];
    }
    
    [self.barChartView reloadData];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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

@implementation BarView

-(void)layoutSubviews
{
    
    [super layoutSubviews];
    
    self.gradientLayer.frame = self.bounds;
}

@end

