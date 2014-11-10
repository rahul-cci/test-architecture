//
//  BaseService.h
//  TestLayeredArchitecture
//
//  Created by Prachi Ghatwal on 10/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseService : NSObject
@property (nonatomic) BOOL *isMappingDefined;
@property (nonatomic) Class requestMappingClass;
@property (nonatomic) Class responseMappingClass;
- (NSDictionary *) requestMapping;
- (NSDictionary *) responseMapping;

@end
