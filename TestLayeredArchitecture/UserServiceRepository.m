//
//  UserServiceRepository.m
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "UserServiceRepository.h"
#import "RestKitImplementation.h"

@implementation UserServiceRepository
- (id)init{
    if (!self) {
        self = [super init];
    }
    
    //set the appropriate database layer implementation
    self.serviceDelegate = [[RestKitImplementation alloc]init];
    return self;
}

-(SignUpResponse *) signupUser : (SignUpRequest *) signupRequest
{
    SignUpResponse *signUpResponse = [self.serviceDelegate signupUser:signupRequest];
    return signUpResponse;
}

@end
