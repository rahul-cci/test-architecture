//
//  UserServiceRepository.m
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "UserServiceRepository.h"
#import "RestKitImplementation.h"
#import "Constants.h"

@implementation UserServiceRepository
- (id)init{
    if (!self) {
        self = [super init];
    }
    
    //set the appropriate service layer implementation
    self.serviceDelegate = [[RestKitImplementation alloc]init];
    return self;
}

-(void) signupUser : (SignUpRequest *) signupRequest withCallback:(void(^)(SignUpResponse *response,NSError *error))callback
{
    successCallback = callback;
    
    NSMutableDictionary *requestMapping = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *responseMapping = [[NSMutableDictionary alloc] init];
    NSString *path = RESKIT_SIGNUP_URL;
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
   
    NSObject *reqObject ;
    
    //Call the signup method from the specified service implementation
   [self.serviceDelegate signupUser:reqObject addRequestMapping:requestMapping addResponseMapping:responseMapping path:path addHeaders:headers withCallback:^(NSObject *response, NSError *error) {
       //TODO convert response to signup object
       
        successCallback(response,nil);
    }];

}

@end
