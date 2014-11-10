//
//  UserServiceRepository.m
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "SignupService.h"
#import "RestKitImplementation.h"
#import "Constants.h"

@implementation SignupService
- (id)init{
    if (!self) {
        self = [super init];
    }
    
    //set the appropriate service layer implementation
    self.serviceDelegate = [[RestKitImplementation alloc]init];
    return self;
}

- (void)signupUser: (SignUpRequest *) signupRequest withCallback:(void(^)(SignUpResponse * response, NSError * error)) callback {
    successCallback = callback;
    
    NSMutableDictionary *requestMapping = [self defineRequestMapping];
    NSMutableDictionary *responseMapping = [self defineResponseMapping];
    NSString *path = RESKIT_SIGNUP_URL;
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    Class requestObjectClass = [signupRequest class];
    Class responseObjectClass = [SignUpResponse class];
    
    //Call the signup method from the specified service implementation
    [self.serviceDelegate post:signupRequest addRequestMapping:requestMapping addResponseMapping:responseMapping path:path addHeaders:headers requestClass:requestObjectClass responseClass:(Class)responseObjectClass withCallback:^(NSObject *response, NSError *error) {
       //TODO convert response to signup object
       SignUpResponse *signupresponse = (SignUpResponse *)response;
       NSLog(@"%@", signupresponse);
        successCallback(signupresponse,nil);
    }];

}

-(NSMutableDictionary *) defineRequestMapping
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                      @"Email":@"Email",
                                                                                      @"UUID":@"UUID"
                                                                                      
                                                                                      } copyItems:YES];
    return dictionary;
}
-(NSMutableDictionary *) defineResponseMapping
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                       @"Beacons":@"Beacons",
                                                                                       @"BeaconServices":@"BeaconServices",
                                                                                       @"RangingServices":@"RangingServices",
                                                                                       } copyItems:YES];
    return dictionary;
}


@end
