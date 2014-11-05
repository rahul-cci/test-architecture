//
//  UserRepository.h
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 04/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DatabaseProtocol.h"
#import "User.h"

@interface UserDBRepository : NSObject

@property (nonatomic,strong) id<DatabaseProtocol> databaseDelegate;

- (User*)getUserById:(int)userId;
- (BOOL)saveUser:(User*)user;
@end
