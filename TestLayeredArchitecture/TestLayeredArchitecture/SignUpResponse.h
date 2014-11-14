//
//  SignUpResponseObject.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
#import "Beacon.h"
#import "BeaconService.h"
#import "RangingService.h"
#import "Model.h"

@interface SignUpResponse : Model
@property (nonatomic, strong) NSString *error;
@property (nonatomic, strong) Employee *employee;
@property (nonatomic, strong) NSMutableArray *beacons;
@property (nonatomic, strong) NSMutableArray *beaconServices;
@property (nonatomic, strong) NSMutableArray *rangingServices;
@property (nonatomic, strong) NSMutableArray *geoFences;
@end
