//
//  User.h
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 04/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"

@interface User : NSObject

@property (nonatomic,strong) NSString *firstName;
@property (nonatomic,strong) NSString *lastName;
@property (nonatomic) int age;
@property (nonatomic,strong) NSDate *joiningDate;
@property (nonatomic) BOOL isSalaried;
@property (nonatomic,strong) Company *currentCompany;

@end
