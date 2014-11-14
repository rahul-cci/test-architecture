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
#import "BaseService.h"

@interface SignupService :BaseService {
    
}

//static int isMappingDefined;

@property (nonatomic,strong) id<ServicesProtocol> serviceDelegate;

- (void) signupUser : (SignUpRequest *) signupRequest withCallback:(void(^)(SignUpResponse *response,NSError *error))callback;
@end
