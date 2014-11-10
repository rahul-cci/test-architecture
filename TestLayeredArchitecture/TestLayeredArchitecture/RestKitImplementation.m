//
//  RestKitImplementation.m
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "RestKitImplementation.h"
#import <RestKit/RestKit.h>
#import "Constants.h"



@implementation RestKitImplementation
- (void)post:(NSObject*)request addRequestMapping:(NSMutableDictionary *)requestMapping addResponseMapping:(NSMutableDictionary *)responseMapping path:(NSString *)path  addHeaders:(NSMutableDictionary *)headers requestClass:(Class)requestClass responseClass:(Class)responseClass withCallback:(void (^)(NSObject *, NSError *))callback {
    
    successCallback = callback;
   
    [self initializeRestkit];
    [self configureRestKitForPost : request addRequestMapping:requestMapping addResponseMapping:responseMapping  path:path  addHeaders: headers requestClass:requestClass responseClass:(Class)responseClass];
}



-(void) initializeRestkit
{
    //Initialize restkit manager with base url
    RKObjectManager *restkitManager =[RKObjectManager managerWithBaseURL:[[NSURL alloc] initWithString:RESKIT_BASE_URL]];
    [RKObjectManager setSharedManager:restkitManager];
    
    restkitManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    RKLogConfigureByName("Restkit/Network", RKLogLevelDebug);
    
}


- (void)configureRestKitForPost: (NSObject *)requestObj addRequestMapping:(NSMutableDictionary *)requestMapping addResponseMapping:(NSMutableDictionary *)responseMapping path:(NSString *)path  addHeaders:(NSMutableDictionary *)headers requestClass:(Class)requestClass responseClass:(Class)responseClass
{
   
    //Define the mapping for request and respone
    RKObjectMapping *reqMapping = [self defineMapping:requestMapping];
    RKObjectMapping *respMapping = [self defineResponseMapping:responseMapping :responseClass];
    
    //Define the request and response descriptors by appending path and mapping
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:reqMapping
                                                                                   objectClass:requestClass
                                                                                   rootKeyPath:nil
                                                                                   method:RKRequestMethodPOST];
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:respMapping
                                                                                   method:RKRequestMethodPOST
                                                                                   pathPattern:path
                                                                                   keyPath:@""
                                                                                   statusCodes:RKStatusCodeIndexSetForClass (RKStatusCodeClassSuccessful)];
    
    
    //Add the request and response descriptors to the restkit manager
    [[RKObjectManager sharedManager] addRequestDescriptor:requestDescriptor];
    [[RKObjectManager sharedManager] addResponseDescriptor:responseDescriptor];
    
    
    //Define the request with request object and path
    NSMutableURLRequest *request = [[RKObjectManager sharedManager] requestWithObject:requestObj method:RKRequestMethodPOST path:path parameters:nil];
    
    
    //Set a time out interval for request
    [request setTimeoutInterval:10];
    
    //Define the operation by setting the request and response descriptor
     RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    
    
    //Callback for operation
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
      
        NSLog(@"Mapped the article: %@", result);
        successCallback([result firstObject], nil);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Failed with error: %@", [error localizedDescription]);
    }];
    
    
    //Start the operation
    [operation start];
    
}


- (RKObjectMapping *) defineMapping :(NSMutableDictionary *) mappingDictionary
{
    RKObjectMapping * mapping =  [RKObjectMapping requestMapping];
    
    [mapping addAttributeMappingsFromDictionary:mappingDictionary];
    
    return mapping;
}

- (RKObjectMapping *) defineResponseMapping :(NSMutableDictionary *) mappingDictionary : (Class) responseClass
{
    RKObjectMapping * mapping =  [RKObjectMapping mappingForClass:responseClass];
    
    [mapping addAttributeMappingsFromDictionary:mappingDictionary];
    
    return mapping;
}



@end
