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
#import "SignUpResponse.h"
#import "SignUpRequest.h"
#import "UserServiceRepository.h"

@interface UserManager : NSObject
{
    void(^successCallback)(SignUpResponse *response,NSError *error);
}

@property (nonatomic,strong) UserDBRepository *repository;
@property (nonatomic,strong) UserServiceRepository *userServiceRepository;

- (User*)getCurrentUser;
- (BOOL)saveUser:(User*)user;
-(void) signupUser : (SignUpRequest *) signupRequest withCallback:(void(^)(SignUpResponse *response,NSError *error))callback;

@end
