//
//  GeoFences.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 14/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeoFences : NSObject
@property (nonatomic) int geofenceId;
@property (nonatomic, strong) NSString *geofenceName;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *radius;
@property (nonatomic) BOOL isActive;
@property (nonatomic, strong) NSString *createdDate;
@property (nonatomic, strong) NSString *updateDate;
@end
