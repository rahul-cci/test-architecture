//
//  Model.h
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 05/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//
//  This is the base class for all the models to be used.

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic) int identifier;

- (BOOL) isOfModelType;     //the purpose of this method is to typecheck objects created dynamically

@end
