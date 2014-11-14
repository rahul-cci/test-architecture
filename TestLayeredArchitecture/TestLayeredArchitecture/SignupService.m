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
    __block void(^successCallback)(SignUpResponse * response, NSError * error) = callback;

    //Set the parameters to be passed to the implementation
    NSDictionary *requestMapping = [self defineRequestMapping];
    NSDictionary *responseMapping = [self defineResponseMapping];
    NSString *path = RESKIT_SIGNUP_URL;
    NSMutableDictionary *headers = [[NSMutableDictionary alloc] init];
    Class requestObjectClass = [signupRequest class];
    self.requestMappingClass = requestObjectClass;
    self.responseMappingClass = [SignUpResponse class];
    
    
    
    //Call the signup method from the specified service implementation
    [self.serviceDelegate post:signupRequest withRequestMapping:requestMapping responseMapping:responseMapping path:path headers:headers requestClass:requestObjectClass callingService:self callback:^(NSObject *response, NSError *error) {
        SignUpResponse *signupresponse = (SignUpResponse *)response;
        NSLog(@"%@", signupresponse);
        successCallback(signupresponse,nil);
    }];
    
}


-(NSDictionary *)defineRequestMapping{
    NSDictionary *dictionary = [[NSDictionary alloc]initWithDictionary:@{
                                                                         @"Email":@"Email",
                                                                         @"UUID":@"UUID"
                                                                         } copyItems:YES];
    return dictionary;
}

-(NSDictionary *)defineResponseMapping{
    NSDictionary *dictionary = [[NSDictionary alloc]initWithDictionary:@{
                                                                         @"Beacons":@"Beacons",
                                                                         @"BeaconServices":@"BeaconServices",
                                                                         @"RangingServices":@"RangingServices",
                                                                         } copyItems:YES];
    return dictionary;
}



@end
