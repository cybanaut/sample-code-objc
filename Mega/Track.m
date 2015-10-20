//
//  Track.m
//  Mega
//
//  Created by Sergey on 11/03/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "Track.h"

@implementation Track

- (instancetype)initWithTitle:(NSString *)name duration:(NSString *)duration filename:(NSString *)filename
{
    self = [super init];
    if (self) {
        self.name = name;
        self.duration = duration;
        self.filename = filename;
    }
    
    return self;
}

@end
