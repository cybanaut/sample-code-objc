//
//  ProgressChartController.m
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "ProgressChartController.h"
#import "RevenueModel.h"
#import "MegaTheme.h"

@interface ProgressChartController ()

@end

@implementation ProgressChartController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Revenue Targets";
    progressSize = 200;
    
    self.tableView.separatorColor = [UIColor colorWithWhite:0.77 alpha: 1.0];

    tabSegmenControl.items = @[@"WEEKLY", @"MONTHLY", @"YEARLY"];
    [tabSegmenControl addTarget:self action:@selector(tabSegmentValueChanged:) forControlEvents:UIControlEventValueChanged];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = UIColor.clearColor;
    self.collectionView.showsHorizontalScrollIndicator = NO;

    collectionLayout.minimumLineSpacing = 100;
    collectionLayout.minimumInteritemSpacing = 100;
    collectionLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    collectionLayout.itemSize = CGSizeMake(progressSize, progressSize);
    collectionLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    yearControl1.labelFont = [UIFont fontWithName:MegaTheme.fontName size: 11];
    yearControl2.labelFont = [UIFont fontWithName:MegaTheme.fontName size: 11];
    yearControl3.labelFont = [UIFont fontWithName:MegaTheme.fontName size: 11];
    yearControl4.labelFont = [UIFont fontWithName:MegaTheme.fontName size: 11];
    yearControls = @[yearControl1, yearControl2, yearControl3, yearControl4];

    [self createColdColors];
    [self createWarmColors];
    
    [self showColorsStartColors:warmColorsStart endColors:warmColorsEnd];

    warmColorIndicator.layer.cornerRadius = 10;
    warmColorIndicator.layer.borderWidth = 3;
    warmColorIndicator.layer.borderColor = [UIColor colorWithRed:1.0 green: 0.35 blue: 0.49 alpha: 1.0].CGColor;

    warmColorLabel.text = @"SHOW COLD COLORS";
    warmColorLabel.font = [UIFont fontWithName:MegaTheme.fontName size: 16];

    coldColorIndicator.layer.cornerRadius = 10;
    coldColorIndicator.layer.borderWidth = 3;
    coldColorIndicator.layer.borderColor = [UIColor colorWithRed:0.48 green: 0.43 blue: 0.78 alpha: 1.0].CGColor;

    coldColorLabel.text = @"SHOW WARM COLORS";
    coldColorLabel.font = [UIFont fontWithName:MegaTheme.fontName size: 16];

    revenueModel = [self yearlyRevenueModel];

    [gradientButton setTitle:@"GRADIENT COLOR BUTTON" forState:UIControlStateNormal];
    gradientButton.titleLabel.font = [UIFont fontWithName:MegaTheme.boldFontName size: 18];
    [gradientButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return revenueModel.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    ADVProgressControl* progressControl = (ADVProgressControl*)[cell viewWithTag:1];

    RevenueModel* model = revenueModel[indexPath.row];

    progressControl.progress = model.percent;
    progressControl.gradientStart = model.startColor;
    progressControl.gradientEnd = model.endColor;

    progressControl.labelText = model.title;
    progressControl.labelFont = [UIFont fontWithName:MegaTheme.boldFontName size: 45];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        
        return 54;
        
    }else if (indexPath.row == 1) {
        
        return progressSize * 1.5;
        
    }else if (indexPath.row == 2){
        
        return 80;
        
    }else{
        
        return 55;
        
    }
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (indexPath.row == 3) {
        [self showColorsStartColors:coldColorsStart endColors:coldColorsEnd];
    }else if (indexPath.row == 4){
        [self showColorsStartColors:warmColorsStart endColors:warmColorsEnd];
    }
    
}

-(void)tabSegmentValueChanged:(id)sender
{
    
    if (tabSegmenControl.selectedIndex == 0) {
        revenueModel = [self weeklyRevenueModel];
    }else if (tabSegmenControl.selectedIndex == 1) {
        revenueModel = [self monthlyRevenueModel];
    }else{
        revenueModel = [self yearlyRevenueModel];
    }
    
    [self.collectionView reloadData];
}

-(void) createColdColors
{
    
    UIColor* c11 = [UIColor colorWithRed: 0.13 green: 0.79 blue: 0.98 alpha: 1.0];
    UIColor* c12 = [UIColor colorWithRed: 0.09 green: 0.30 blue: 0.92 alpha: 1.0];
    
    UIColor* c21 = [UIColor colorWithRed: 0.07 green: 0.33 blue: 0.85 alpha: 1.0];
    UIColor* c22 = [UIColor colorWithRed: 0.85 green: 0.62 blue: 0.92 alpha: 1.0];
    
    UIColor* c31 = [UIColor colorWithRed: 0.22 green: 0.64 blue: 0.89 alpha: 1.0];
    UIColor* c32 = [UIColor colorWithRed: 0.25 green: 0.83 blue: 0.73 alpha: 1.0];
    
    UIColor* c41 = [UIColor colorWithRed: 0.48 green: 0.43 blue: 0.78 alpha: 1.0];
    UIColor* c42 = [UIColor colorWithRed: 0.16 green: 0.79 blue: 0.97 alpha: 1.0];
    
    coldColorsStart = @[c11, c21, c31, c41];
    coldColorsEnd = @[c12, c22, c32, c42];
}

-(void) createWarmColors
{
    
    UIColor* c11 = [UIColor colorWithRed:0.99 green: 0.31 blue: 0.51 alpha: 1.0];
    UIColor* c12 = [UIColor colorWithRed:0.99 green: 0.55 blue: 0.38 alpha: 1.0];
    
    UIColor* c21 = [UIColor colorWithRed:0.88 green: 0.17 blue: 0.64 alpha: 1.0];
    UIColor* c22 = [UIColor colorWithRed:0.98 green: 0.76 blue: 0.04 alpha: 1.0];
    
    UIColor* c31 = [UIColor colorWithRed:1.0 green: 0.83 blue: 0.23 alpha: 1.0];
    UIColor* c32 = [UIColor colorWithRed:1.0 green: 0.51 blue: 0.03 alpha: 1.0];
    
    UIColor* c41 = [UIColor colorWithRed:0.84 green: 0.60 blue: 0.91 alpha: 1.0];
    UIColor* c42 = [UIColor colorWithRed:1.0 green: 0.17 blue: 0.43 alpha: 1.0];
    
    warmColorsStart = @[c11, c21, c31, c41];
    warmColorsEnd = @[c12, c22, c32, c42];
}

-(void)showColorsStartColors:(NSArray*)startColors endColors:(NSArray*)endColors
{
    
    for (int index = 0; index < yearControls.count; index++) {
        
        ADVProgressControl* control = yearControls[index];
        
        control.gradientStart = startColors[index];
        control.gradientEnd = endColors[index];
        
    }
}

-(NSArray*) weeklyRevenueModel
{
    
    RevenueModel* model1 = [[RevenueModel alloc] initWithTitle:@"Q1" percent: 0.71 startColor: coldColorsStart[0] endColor: coldColorsEnd[0]];
    
    RevenueModel* model2 = [[RevenueModel alloc] initWithTitle:@"Q2" percent: 0.9 startColor: warmColorsStart[0] endColor: warmColorsEnd[0]];
    
    RevenueModel* model3 = [[RevenueModel alloc] initWithTitle:@"Q3" percent: 0.6 startColor: coldColorsStart[1] endColor: coldColorsEnd[1]];
    
    RevenueModel* model4 = [[RevenueModel alloc] initWithTitle:@"Q4" percent: 0.9 startColor: warmColorsStart[1] endColor: warmColorsEnd[1]];
    
    return @[model1, model2, model3, model4];
}

-(NSArray*) monthlyRevenueModel
{
    
    RevenueModel* model1 = [[RevenueModel alloc] initWithTitle:@"FEB 2015" percent: 0.9 startColor: warmColorsStart[1] endColor: warmColorsEnd[1]];
    
    RevenueModel* model2 = [[RevenueModel alloc] initWithTitle:@"MAR 2015" percent: 0.4 startColor: coldColorsStart[2] endColor: coldColorsEnd[2]];
    
    RevenueModel* model3 = [[RevenueModel alloc] initWithTitle:@"APR 2015" percent: 1.0 startColor: warmColorsStart[3] endColor: warmColorsEnd[3]];
    
    return @[model1, model2, model3];
}

-(NSArray*) yearlyRevenueModel
{
    
    RevenueModel* model1 = [[RevenueModel alloc] initWithTitle:@"2013" percent: 0.75 startColor: coldColorsStart[3] endColor: coldColorsEnd[3]];
    
    RevenueModel* model2 = [[RevenueModel alloc] initWithTitle:@"2014" percent: 0.8 startColor: warmColorsStart[1] endColor: warmColorsEnd[1]];
    
    RevenueModel* model3 = [[RevenueModel alloc] initWithTitle:@"2015" percent: 0.5 startColor: coldColorsStart[2] endColor: coldColorsEnd[2]];
    
    return @[model1, model2, model3];
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
}
-(void)viewDidLayoutSubviews
{
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.layoutMargins = UIEdgeInsetsZero;
}
@end
