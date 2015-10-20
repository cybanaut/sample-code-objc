//
//  OrderDetailViewController.m
//  Mega
//
//  Created by Sergey on 1/31/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "MegaTheme.h"
@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    themeLabelWithText(nameLabel, text: "FIRST NAME")
    [self themeLabelWithText:nameLabel text:@"FIRST NAME"];
    [self themeTextFieldWithText:nameTextField text: @"John"];
    [self themeLabelWithText:lastnameLabel text: @"LAST NAME"];
    [self themeTextFieldWithText:lastnameTextField text: @"Harrison"];
    
    [self themeLabelWithText:cardLabel text: @"CARD NUMBER"];
    [self themeTextFieldWithText:cardTextField text: @"2222111133339999"];
    
    [self themeLabelWithText:cvvLabel text: @"CVV"];
    [self themeTextFieldWithText:cvvTextField text: @"4567"];
    
    [self themeLabelWithText:expirationLabel text: @"EXPIRATION"];
    [self themeTextFieldWithText:expirationTextfieldMonth text: @"4"];
    [self themeTextFieldWithText:expirationTextfieldYear text: @"2016"];
    
    [self themeLabelWithText:cityLabel text: @"CITY"];
    [self themeTextFieldWithText:cityTextField text: @"Houston"];
    
    [self themeLabelWithText:stateLabel text: @"STATE"];
    [self themeTextFieldWithText:stateTextField text: @"Texas"];
    
    [self themeLabelWithText:zipCodeLabel text: @"ZIP CODE"];
    [self themeTextFieldWithText:zipCodeTextField text: @"22112"];
    
    [self themeLabelWithText:countryLabel text: @"COUNTRY"];
    [self themeTextFieldWithText:countryTextField text: @"United States"];
    
    [self themeLabelWithText:commentLabel text: @"COMMENT"];
    
    commentTextView.font = [UIFont fontWithName: MegaTheme.fontName size: 10];
    commentTextView.textColor = MegaTheme.darkColor;
    commentTextView.text = @"Please leave a comment here";
    
    orderButton.titleLabel.font = [UIFont fontWithName: MegaTheme.boldFontName size: 18];
    [orderButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [orderButton setTitle:@"PLACE ORDER" forState: UIControlStateNormal];
    orderButton.backgroundColor = [UIColor colorWithRed:0.14 green:0.71 blue:0.69 alpha:1.0];
    orderButton.layer.cornerRadius = 20;
    orderButton.layer.borderWidth = 0;
    orderButton.clipsToBounds = true;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) themeTextFieldWithText:(UITextField*)textField text:(NSString*)text
{
    CGFloat largeFontSize = 17;
    textField.font = [UIFont fontWithName: MegaTheme.fontName size: largeFontSize];
    textField.textColor = MegaTheme.darkColor;
    textField.text = text;
    textField.delegate = self;
}

-(void) themeLabelWithText:(UILabel*)label text:(NSString*)text
{
    
    CGFloat fontSize = 10;
    label.font = [UIFont fontWithName: MegaTheme.fontName size: fontSize];
    label.textColor = MegaTheme.lightColor;
    label.text = text;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self registerForKeyboardNotifications];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self deregisterFromKeyboardNotifications];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 5) {
        
        return 120;
        
    }else if (indexPath.row == 6) {
        
        return 80;
        
    }
    
    return 60;
}

-(void)registerForKeyboardNotifications
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void) deregisterFromKeyboardNotifications
{
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    
    [center removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    
    [center removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)keyboardWasShown:(NSNotification*)notification{
    
    NSDictionary* info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets insets = UIEdgeInsetsMake(self.tableView.contentInset.top, 0, keyboardSize.height, 0);
    
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, self.tableView.contentOffset.y + keyboardSize.height);
}

-(void) keyboardWillBeHidden : (NSNotification*)notification{
    
    NSDictionary* info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets insets = UIEdgeInsetsMake(self.tableView.contentInset.top, 0, keyboardSize.height, 0);
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
