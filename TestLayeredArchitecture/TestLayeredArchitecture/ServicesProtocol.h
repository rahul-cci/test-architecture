//
//  ServicesProtocol.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#ifndef TestLayeredArchitecture_ServicesProtocol_h
#define TestLayeredArchitecture_ServicesProtocol_h

#import "SignUpResponse.h"
@protocol ServicesProtocol <NSObject>



@required
- (void)signupUser:(NSObject*)object  withCallback:(void(^)(SignUpResponse *response,NSError *error))callback;


@end

#endif
