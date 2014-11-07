//
//  RestKitImplementation.m
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "RestKitImplementation.h"

@implementation RestKitImplementation
- (void)signupUser:(NSObject*)object  withCallback:(void (^)(SignUpResponse *, NSError *))callback {
    successCallback = callback;
   
    
    SignUpResponse *signupResponseObject = [[SignUpResponse alloc]init];
    Employee *emp = [[Employee alloc]init];
    emp.firstName = @"Prachi";
    signupResponseObject.employee = emp;
    successCallback(signupResponseObject, nil);
   
}
@end
