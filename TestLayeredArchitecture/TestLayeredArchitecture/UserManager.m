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
    self.userServiceRepository = [[UserServiceRepository alloc]init];

    
    return self;
}

- (User*)getCurrentUser{
    
    //get user id from user defaults
    User *user = [[User alloc]init];
    int userid = [[[NSUserDefaults standardUserDefaults]valueForKey:@"user_id"]intValue];
    user = [self.repository getUserById:userid];
    return user;
}

- (BOOL)saveUser:(User*)user{
    BOOL isSaved = [self.repository saveUser:user];
    [[NSUserDefaults standardUserDefaults]setObject:[NSNumber numberWithInt:user.identifier] forKey:@"user_id"];
    return isSaved;
}

-(void) signupUser : (SignUpRequest *) signupRequest withCallback:(void (^)(SignUpResponse *, NSError *))callback {
    successCallback = callback;
    
    [self.userServiceRepository signupUser:signupRequest withCallback:^(SignUpResponse *response, NSError *error) {
        successCallback(response,nil);
    }];
    
}




@end
