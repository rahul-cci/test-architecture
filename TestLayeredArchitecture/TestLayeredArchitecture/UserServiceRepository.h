//
//  UserServiceRepository.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServicesProtocol.h"
#import "SignUpRequest.h"
#import "SignUpResponse.h"

@interface UserServiceRepository : NSObject

@property (nonatomic,strong) id<ServicesProtocol> serviceDelegate;

-(SignUpResponse *) signupUser : (SignUpRequest *) signupRequest;
@end
