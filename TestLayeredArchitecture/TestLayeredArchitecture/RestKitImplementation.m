//
//  RestKitImplementation.m
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "RestKitImplementation.h"
#import <RestKit/RestKit.h>


@implementation RestKitImplementation
- (void)signupUser:(NSObject*)request  withCallback:(void (^)(NSObject *, NSError *))callback {
    successCallback = callback;
   
    [self initializeRestkit];
    [self configureRestKitForPost :request];
}



-(void) initializeRestkit
{
    RKObjectManager *restkitManager =[RKObjectManager managerWithBaseURL:[[NSURL alloc] initWithString:@"http://timetracking.creativecapsule.ccigoa:8176/"]];
    [RKObjectManager setSharedManager:restkitManager];
    
    restkitManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    RKLogConfigureByName("Restkit/Network", RKLogLevelDebug);
    
}


- (void)configureRestKitForPost: (NSObject *)request
{
    NSObject *requestObject = request;
      
}

@end
