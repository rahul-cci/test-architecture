//
//  User.m
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 04/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize firstName,lastName,age,joiningDate,isSalaried,currentCompany,anniversaries;

- (id) init{
    if (!self) {
        self = [super init];
    }
    self.anniversaries = [NSMutableArray array];
    return self;
}

@end
