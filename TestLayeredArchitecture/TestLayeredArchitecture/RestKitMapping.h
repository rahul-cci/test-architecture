//
//  RestKitMapping.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit.h>

@interface RestKitMapping : NSObject
+ (RKObjectMapping *)defineMappingForSignUpRequest;
+ (RKObjectMapping *)defineMappingForSignUpResponse;
+ (RKObjectMapping *)defineMappingForEmployee;
+ (RKObjectMapping *)defineMappingForBeacon;
+ (RKObjectMapping *)defineMappingForBeaconService;
+ (RKObjectMapping *)defineMappingForRangingService;


@end
