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
{
    void(^successCallback)(SignUpResponse *response,NSError *error);
}
@property (nonatomic,strong) id<ServicesProtocol> serviceDelegate;

-(void) signupUser : (SignUpRequest *) signupRequest withCallback:(void(^)(SignUpResponse *response,NSError *error))callback;
@end
