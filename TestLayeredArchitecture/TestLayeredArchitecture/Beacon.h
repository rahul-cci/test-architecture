//
//  Beacon.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface Beacon : Model
@property (nonatomic, strong) NSString *beaconId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) BOOL isActive;
@property (nonatomic, strong) NSString *major;
@property (nonatomic, strong) NSString *minor;
@property (nonatomic, strong) NSString *proximityState;
@property (nonatomic, strong) NSString *createdDate;
@property (nonatomic, strong) NSString *updateDate;

@end
