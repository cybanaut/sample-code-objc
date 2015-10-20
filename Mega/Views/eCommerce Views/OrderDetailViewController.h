//
//  OrderDetailViewController.h
//  Mega
//
//  Created by Sergey on 1/31/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailViewController : UITableViewController <UITextFieldDelegate>
{
    
    IBOutlet UILabel* nameLabel;
    IBOutlet UITextField* nameTextField;
    IBOutlet UILabel* lastnameLabel;
    IBOutlet UITextField* lastnameTextField;
    
    IBOutlet UILabel* cardLabel;
    IBOutlet UITextField* cardTextField;
    IBOutlet UILabel* cvvLabel;
    IBOutlet UITextField* cvvTextField;
    
    IBOutlet UILabel* expirationLabel;
    IBOutlet UITextField* expirationTextfieldMonth;
    IBOutlet UITextField* expirationTextfieldYear;
    
    IBOutlet UILabel* cityLabel;
    IBOutlet UITextField* cityTextField;
    IBOutlet UILabel* stateLabel;
    IBOutlet UITextField* stateTextField;
    IBOutlet UILabel* zipCodeLabel;
    IBOutlet UITextField* zipCodeTextField;
    IBOutlet UILabel* countryLabel;
    IBOutlet UITextField* countryTextField;
    
    IBOutlet UILabel* commentLabel;
    IBOutlet UITextView* commentTextView;

    IBOutlet UIButton* orderButton;
    
    
}
@end
