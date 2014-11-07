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
@property (strong,nonatomic) NSMutableArray *beaconsArray;
@property (strong,nonatomic) NSMutableArray *beaconServicesArray;
@property (strong,nonatomic) NSMutableArray *rangingServicesArray;
@end
