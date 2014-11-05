//
//  UserManager.m
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 04/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager
@synthesize repository;

- (id)init{
    if (!self) {
        self = [super init];
    }
    self.repository = [[UserDBRepository alloc]init];
    
    return self;
}

- (User*)getCurrentInUser{
    
    //get user id from user defaults
    User *user = [[User alloc]init];
    user = [self.repository getUserById:1];
    return user;
}

- (BOOL*)saveUser:(User*)user{
    return [self.repository saveUser:user];
}

@end
