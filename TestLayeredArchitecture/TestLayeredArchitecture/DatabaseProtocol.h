//
//  DatabaseProtocol.h
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 04/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#ifndef TestLayeredArchitecture_DatabaseProtocol_h
#define TestLayeredArchitecture_DatabaseProtocol_h

@protocol DatabaseProtocol <NSObject>

@required
- (id)getObjectById:(int)ID fromClass:(NSString*)className;
- (BOOL)saveObject:(NSObject*)object;
// other operations
@end

#endif
