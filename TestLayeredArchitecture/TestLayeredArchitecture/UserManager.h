//
//  UserManager.h
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 04/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "UserRepository.h"

@interface UserManager : NSObject

@property (nonatomic,strong) UserRepository *repository;

- (User*)getCurrentInUser;
- (BOOL*)saveUser:(User*)user;

@end
