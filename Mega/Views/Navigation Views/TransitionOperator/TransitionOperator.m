//
//  TransitionOperator.m
//  Mega
//
//  Created by Sergey on 2/1/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "TransitionOperator.h"

@implementation TransitionOperator


-(instancetype)init
{
    self = [super init];
    
    if (self) {
        
        isPresenting = YES;
        self.transitionStyle = @"presentSideNav";
        
    }
    return self;
    
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    if(isPresenting){
        
        [self showNavigation:transitionContext];
        
    }else{
        
        [self dismissNavigation:transitionContext];
        
    }
}


-(void)dismissNavigation:(id<UIViewControllerContextTransitioning>)transitionContext
{

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveLinear animations:^{
        
        snapshot.transform = CGAffineTransformIdentity;

    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];

    }];
    
    
}

-(void) showNavigation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    UIView* container = transitionContext.containerView;
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView* fromView = fromViewController.view;
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView* toView = toViewController.view;
    
    offSetTransform = [self createTransformForTransitionStyle:self.transitionStyle];
    
    snapshot = [fromView snapshotViewAfterScreenUpdates:YES];
    
    [container addSubview:toView];
    [container addSubview:snapshot];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];

    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveLinear animations:^{
        
        snapshot.transform = offSetTransform;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
    
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{

    isPresenting = YES;
    
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    isPresenting = NO;
    return self;
}

-(CGAffineTransform) createTransformForTransitionStyle:(NSString*) style
{
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    if ([style isEqualToString:@"presentSideNavigation"]){
        
        return CGAffineTransformMakeTranslation(60, 0);
        
    }else if ([style isEqualToString:@"presentFullNavigation"]) {
        
        CGAffineTransform transform = CGAffineTransformMakeTranslation(size.width - 120, 0);
        return CGAffineTransformScale(transform, 0.6, 0.6);
        
    }else if ([style isEqualToString:@"presentTableNavigation"]) {
        
        return CGAffineTransformMakeTranslation(size.width - 50, 0);
        
    }else{
        
        return CGAffineTransformMakeTranslation(80, 0);
        
    }
}



@end
