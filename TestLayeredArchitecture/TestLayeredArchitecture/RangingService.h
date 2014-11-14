//
//  RangingService.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"

@interface RangingService : Model
@property (nonatomic) int rangingServiceId;
@property (nonatomic, strong) NSString *rangingServiceName;
@property (nonatomic, strong) NSString *rangingServiceURL;
@property (nonatomic, strong) NSString *createdDate;
@property (nonatomic, strong) NSString *updateDate;
@property (nonatomic) BOOL isActive;

@end
