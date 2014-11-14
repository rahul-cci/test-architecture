//
//  BeaconService.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface BeaconService : Model
@property (nonatomic) int beaconServiceId;
@property (nonatomic, strong) NSString *beaconId;
@property (nonatomic) int rangingServiceId;
@property (nonatomic) BOOL isActive;
@property (nonatomic, strong) NSString *createdDate;
@property (nonatomic, strong) NSString *updateDate;

@end
