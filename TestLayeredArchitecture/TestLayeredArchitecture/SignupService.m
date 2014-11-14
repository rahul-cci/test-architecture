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

#define RESKIT_SIGNUP_URL @"api/requestaccess"

@implementation SignupService

static BOOL isMapDefined;

- (void)setIsMappingDefined:(BOOL)isMappingDefined {
    
    isMapDefined = isMappingDefined;
}

- (BOOL)isMappingDefined {
    return isMapDefined;
}

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
  
    self.requestMappingClass = [signupRequest class];
    self.responseMappingClass = [SignUpResponse class];
    
    
    [self.serviceDelegate postWithRequest:signupRequest headers:nil path:RESKIT_SIGNUP_URL caller:self callback:^(NSObject *response, NSError *error) {
        SignUpResponse *signUpResponse =(SignUpResponse *)response;
        NSLog(@"beacon %@", signUpResponse);
        successCallback((SignUpResponse *)response,error);
        
    }];
    
}


-(NSDictionary *) defineObjectMappingForEmployee{
        
    NSDictionary *dictionary = [[NSDictionary alloc]initWithDictionary:@{
                                                                           @"EmployeeId":@"employeeId",
                                                                           @"FirstName":@"firstName",
                                                                           @"LastName":@"lastName",
                                                                           @"JoiningDate":@"joiningDate",
                                                                           @"MobileNo":@"mobileNumber",
                                                                           @"EmailId":@"emailId",
                                                                           @"DesignationName":@"designationName",
                                                                           @"CreatedDate":@"createdDate",
                                                                           @"UpdateDate":@"updateDate"

                                                                         } copyItems:YES];
    return dictionary;
}

-(NSDictionary *)defineRequestMapping{
    NSDictionary *dictionary = [[NSDictionary alloc]initWithDictionary:@{
                                                                         @"Email":@"Email",
                                                                         @"UUID":@"UUID"
                                                                         } copyItems:YES];
    return dictionary;
}

-(NSArray *)defineResponseMapping {
    
    NSMutableArray * mappings = [[NSMutableArray alloc] init];
    [mappings addObject:[self defineObjectMappingForEmployee]];
    
    
    NSDictionary *dictionary = [[NSDictionary alloc]initWithDictionary:@{
                                                                         @"Beacons":@"beacons",
                                                                         @"BeaconServices":@"beaconServices",
                                                                         @"RangingServices":@"rangingServices",
                                                                         @"GeoFences":@"geoFences"
                                                                         } copyItems:YES];
   
    [mappings addObject:dictionary];
    return mappings;
}



@end
