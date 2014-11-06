//
//  UserManager.h
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 04/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "UserDBRepository.h"

@interface UserManager : NSObject

@property (nonatomic,strong) UserDBRepository *repository;

- (User*)getCurrentUser;
- (BOOL)saveUser:(User*)user;

@end
