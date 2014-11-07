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
#import "SignUp.h"
#import "SignUp.h"
#import "UserServiceRepository.h"

@interface UserManager : NSObject
{
    void(^successCallback)(SignUp *response,NSError *error);
}

@property (nonatomic,strong) UserDBRepository *repository;
@property (nonatomic,strong) UserServiceRepository *userServiceRepository;

- (User*)getCurrentUser;
- (BOOL)saveUser:(User*)user;
-(void) signupUser : (SignUp *) signupRequest withCallback:(void(^)(SignUp *response,NSError *error))callback;

@end
