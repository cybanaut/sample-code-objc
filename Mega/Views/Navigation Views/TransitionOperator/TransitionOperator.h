//
//  TransitionOperator.h
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TransitionOperator : NSObject <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>
{
    BOOL isPresenting;
    
    
    UIView* snapshot ;
    
    CGAffineTransform offSetTransform;
    
}

@property(nonatomic, strong) NSString* transitionStyle;

@end
