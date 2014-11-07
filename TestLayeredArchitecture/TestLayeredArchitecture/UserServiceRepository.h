//
//  UserServiceRepository.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServicesProtocol.h"
#import "SignUp.h"

@interface UserServiceRepository : NSObject
{
    void(^successCallback)(SignUp *response,NSError *error);
}
@property (nonatomic,strong) id<ServicesProtocol> serviceDelegate;

-(void) signupUser : (SignUp *) signupRequest withCallback:(void(^)(SignUp *response,NSError *error))callback;
@end
