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
    
    //set the appropriate service layer implementation
    self.serviceDelegate = [[RestKitImplementation alloc]init];
    return self;
}

-(void) signupUser : (SignUp *) signupRequest withCallback:(void(^)(SignUp *response,NSError *error))callback
{
    successCallback = callback;
    //Call the signup method from the specified service implementation
   [self.serviceDelegate signupUser:signupRequest withCallback:^(SignUp *response, NSError *error) {
        successCallback(response,nil);
    }];

}

@end
