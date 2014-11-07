//
//  RestKitImplementation.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServicesProtocol.h"

@interface RestKitImplementation : NSObject <ServicesProtocol>
{
    void(^successCallback)(SignUp *response,NSError *error);
}
@end
