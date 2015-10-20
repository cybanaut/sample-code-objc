//
//  Person.h
//  Mega
//
//  Created by Sergey on 2/2/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* profilePicUrl;
@property(nonatomic, strong) NSString* backgroundPicUrl;
@property(nonatomic, strong) NSString* location;
@property(nonatomic, strong) NSString* commentCount;


-(instancetype)initWithName:(NSString*)name profilePicUrl:(NSString*)profilePicUrl backgroundPicUrl:(NSString*)backgroundPicUrl location:(NSString*)location commentCount:(NSString*)commentCount;

@end
