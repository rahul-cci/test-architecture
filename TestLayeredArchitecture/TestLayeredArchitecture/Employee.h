//
//  Employee.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit.h>

@interface Employee : NSObject
@property (nonatomic) int *employeeId;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *joiningDate;
@property (nonatomic, strong) NSString *mobileNumber;
@property (nonatomic, strong) NSString *emailId;
@property (nonatomic, strong) NSString *designationName;
@property (nonatomic, strong) NSString *createdDate;
@property (nonatomic, strong) NSString *updatedDate;
@end
