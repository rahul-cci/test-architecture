//
//  SignUpRequestObject.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignUpRequest : NSObject
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *uuid;
@end
