//
//  ServiceError.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 14/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceError : NSObject

@property(nonatomic) NSString *ErrorCode;
@property(nonatomic) NSString *ErrorMessage;

@end
