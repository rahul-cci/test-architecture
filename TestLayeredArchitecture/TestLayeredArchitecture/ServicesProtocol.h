//
//  ServicesProtocol.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#ifndef TestLayeredArchitecture_ServicesProtocol_h
#define TestLayeredArchitecture_ServicesProtocol_h
#import "BaseService.h"

@protocol ServicesProtocol <NSObject>


@required
//- (void)post:(NSObject*)object  withRequestMapping:(NSDictionary *)requestMapping responseMapping:(NSDictionary *)responseMapping path:(NSString *)path  headers:(NSDictionary *)headers requestClass:(Class)requestClass callingService:(BaseService *)baseService callback:(void(^)(NSObject *response,NSError *error))callback;

- (void)postWithRequest:(NSObject*) request headers:(NSDictionary *) headers path:(NSString *) path caller:(BaseService *) caller callback:(void (^)(NSObject *, NSError *))callback;
    
    


@end

#endif
