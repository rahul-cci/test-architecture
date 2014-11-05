//
//  UserRepository.m
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 04/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "UserDBRepository.h"
#import "CoreDataImplementation.h"

@implementation UserDBRepository

- (id)init{
    if (!self) {
        self = [super init];
    }
    
    //set the appropriate database layer implementation
    self.databaseDelegate = [[CoreDataImplementation alloc]init];
    return self;
}

- (User*)getUserById:(int)userId{
    return [self.databaseDelegate getObjectById:userId fromClass:@"User"];
}

- (BOOL)saveUser:(User*)user{
    return [self.databaseDelegate saveObject:user];
}

@end
