//
//  ServicesProtocol.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#ifndef TestLayeredArchitecture_ServicesProtocol_h
#define TestLayeredArchitecture_ServicesProtocol_h

@protocol ServicesProtocol <NSObject>



@required
- (void)signupUser:(NSObject*)object  addRequestMapping:(NSMutableDictionary *)requestMapping addResponseMapping:(NSMutableDictionary *)responseMapping path:(NSString *)path  addHeaders:(NSMutableDictionary *)headers withCallback:(void(^)(NSObject *response,NSError *error))callback;


@end

#endif
