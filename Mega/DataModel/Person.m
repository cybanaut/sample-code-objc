//
//  Person.m
//  Mega
//
//  Created by Sergey on 2/2/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithName:(NSString *)name profilePicUrl:(NSString *)profilePicUrl backgroundPicUrl:(NSString *)backgroundPicUrl location:(NSString *)location commentCount:(NSString *)commentCount
{
    self = [super init];
    
    if (self) {
        
        self.name = name;
        self.profilePicUrl = profilePicUrl;
        self.backgroundPicUrl = backgroundPicUrl;
        self.location = location;
        self.commentCount = commentCount;
        
    }
    
    return self;
    
}

@end
