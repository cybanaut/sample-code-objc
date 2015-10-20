//
//  Track.h
//  Mega
//
//  Created by Sergey on 11/03/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* duration;
@property(nonatomic, strong) NSString* filename;

- (instancetype)initWithTitle:(NSString *)name duration:(NSString *)duration filename:(NSString *)filename;

@end
