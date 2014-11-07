//
//  RestKitMapping.m
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "RestKitMapping.h"
#import "SignUp.h"
#import "SignUp.h"
#import "Employee.h"

@implementation RestKitMapping
+ (RKObjectMapping *) defineMappingForSignUpRequest
{
    RKObjectMapping * signupRequestMapping =  [RKObjectMapping mappingForClass:[SignUp class]];
    
    [signupRequestMapping addAttributeMappingsFromDictionary:@{
                                                               @"Email":@"email",
                                                               @"UUID":@"uuid"
                                                               
                                                               }];
    
    return signupRequestMapping;
}

+ (RKObjectMapping *) defineMappingForSignUpResponse
{
    RKObjectMapping * signupResponseMapping =  [RKObjectMapping mappingForClass:[SignUp class] ];
    
    
    [signupResponseMapping addAttributeMappingsFromDictionary:@{
                                                                @"error":@"Error",
                                                                @"employee":@"Employee",
                                                                @"beaconsArray":@"Beacons",
                                                                @"beaconServicesArray":@"BeaconServices",
                                                                @"rangingServicesArray":@"RangingServices"
                                                                
                                                                }];
    
    return signupResponseMapping;
}

+ (RKObjectMapping *) defineMappingForEmployee
{
    RKObjectMapping * employeeMapping =  [RKObjectMapping mappingForClass:[Employee class] ];
    
    [employeeMapping addAttributeMappingsFromDictionary:@{
                                                          @"employeeId":@"EmployeeId",
                                                          @"firstName":@"FirstName",
                                                          @"lastName":@"LastName",
                                                          @"joiningDate":@"JoiningDate",
                                                          @"mobileNumber":@"MobileNo",
                                                          @"emailId":@"EmailId",
                                                          @"designationName":@"DesignationName",
                                                          @"createdDate":@"CreatedDate",
                                                          @"updatedDate":@"UpdateDate",
                                                          
                                                          
                                                          }];
    
    return employeeMapping;
}



@end
