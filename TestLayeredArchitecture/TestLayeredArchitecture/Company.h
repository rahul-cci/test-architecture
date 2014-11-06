//
//  Company.h
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface Company : Model
@property (nonatomic,strong) NSString *companyName;
@property (nonatomic,strong) NSString *address;
@end
