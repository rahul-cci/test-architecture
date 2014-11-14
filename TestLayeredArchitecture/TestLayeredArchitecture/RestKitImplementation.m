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

- (id)init{
    if (!self) {
        self = [super init];
    }
    
    [self initializeRestkit];
    return self;
}


- (void)initializeRestkit
{
    //Initialize restkit manager with base url
    RKObjectManager *restkitManager =[RKObjectManager managerWithBaseURL:[[NSURL alloc] initWithString:RESKIT_BASE_URL]];
    [RKObjectManager setSharedManager:restkitManager];
    
    restkitManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    RKLogConfigureByName("Restkit/Network", RKLogLevelDebug);
    
}

//- (void)post:(NSObject*)request withRequestMapping:(NSDictionary *)requestMapping responseMapping:(NSDictionary *)responseMapping path:(NSString *)path  headers:(NSDictionary *)headers requestClass:(Class)requestClass callingService:(BaseService *)baseService callback:(void (^)(NSObject *, NSError *))callback {
//    
//    
//    [self configureRestKitForPost : request withRequestMapping:requestMapping responseMapping:responseMapping  path:path  headers: headers requestClass:requestClass callingService:(BaseService *)baseService callback:(void (^)(NSObject *, NSError *)) callback];
//}
//

-(void)postWithRequest:(NSObject*) request headers:(NSDictionary *) headers path:(NSString *) path caller:(BaseService *) caller callback:(void (^)(NSObject *, NSError *))callback {
    
    [self configureRestKitForPost : request
                withRequestMapping:[caller defineRequestMapping]
                   responseMapping:[caller defineResponseMapping]
                              path:path
                           headers: headers
                      requestClass: [caller requestMappingClass]
                    callingService:(BaseService *)caller
                          callback:(void (^)(NSObject *, NSError *)) callback];
    
}



- (void)configureRestKitForPost: (NSObject *)requestObj withRequestMapping:(NSDictionary *)requestMapping responseMapping:(NSArray *)responseMapping path:(NSString *)path  headers:(NSDictionary *)headers requestClass:(Class)requestClass callingService:(BaseService *)baseService callback:(void (^)(NSObject *, NSError *)) callback
{
    
    __block void(^successCallback)(NSObject *, NSError *) = callback;
    
    //Define the mapping for request and response
    RKObjectMapping *reqMapping;
    RKObjectMapping *respMapping;
    if(!baseService.isMappingDefined) {
        reqMapping = [self defineMapping:requestMapping];
        respMapping = [self defineMapping:responseMapping];
        baseService.isMappingDefined = YES;
    }
    
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


- (RKObjectMapping *) defineMapping :(NSDictionary *) mappingDictionary {
    
    RKObjectMapping * mapping =  [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:mappingDictionary];
    return mapping;
}


- (RKObjectMapping *) defineMappings :(NSArray *) mappingArray {
    
    RKObjectMapping * mapping =  [RKObjectMapping requestMapping];
    
    for (NSDictionary *dictionary in mappingArray) {
        
        [mapping addAttributeMappingsFromDictionary:dictionary];
    }
    
    
    return mapping;
}





@end
