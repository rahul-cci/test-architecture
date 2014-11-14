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
#import "SignUpRequest.h"
#import "SignUpResponse.h"
#import "SignupService.h"

@interface UserManager : NSObject
@property (nonatomic,strong) UserDBRepository *repository;
@property (nonatomic,strong) SignupService *signupService;

- (User*)getCurrentUser;
- (BOOL)saveUser:(User*)user;
-(void) signupUser : (SignUpRequest *) signupRequest withCallback:(void(^)(BOOL))callback;

@end
