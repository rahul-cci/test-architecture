//
//  CoreDataImplementation.m
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 04/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "CoreDataImplementation.h"
#import <objc/runtime.h>

@implementation CoreDataImplementation

- (id)getObjectById:(int)ID fromClass:(NSString*)className{
    //coredata code to fetch object from db
    id object = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %d", ID];
    [fetchRequest setPredicate:predicate];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:className inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if ([fetchedObjects count] > 0) {
        object = [self toObject:[fetchedObjects objectAtIndex:0] ofType:className];
    }
    return object;
}

- (BOOL)saveObject:(NSObject *)object{
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *managedObject = [self toManagedObject:object];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        return false;
    }
    
    
    //update identifier to the primary key.
    if ([object valueForKey:@"identifier"]==nil || [[object valueForKey:@"identifier"] intValue]==0) {
        int pk = [[[[[[managedObject objectID] URIRepresentation] absoluteString] lastPathComponent] substringFromIndex:1] intValue];
        [object setValue:[NSNumber numberWithInt:pk] forKey:@"identifier"];
        [managedObject setValue:[NSNumber numberWithInt:pk] forKey:@"identifier"];
    }
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        return false;
    }

    
    return true;
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.creativecapsuleprojects.TestLayeredArchitecture" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"TestLayeredArchitecture" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"TestLayeredArchitecture.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data Auxillory methods

- (id)toObject:(NSManagedObject*) managedObject ofType:(NSString*)className{
    //This function converts a NSManagedObject to an object of class with the given className
    id object = [[NSClassFromString(className) alloc]init];
    NSEntityDescription *entity = [managedObject entity];
    for (NSString *key in [entity attributesByName] ) {
        //NSLog(@"primitive Type:%@",key );
        [object setValue:[managedObject valueForKey:key] forKey:key];
    }
    for (NSString *key in [entity relationshipsByName]) {
        //If the table has pointers to other tables we need to create objects for the pointed record
        id pointerObj = [object valueForKey:key];
        NSManagedObject *pointerManagedObject = [managedObject valueForKey:key];
        NSEntityDescription *entity = [pointerManagedObject entity];
        NSString *innerClassName = NSStringFromClass([pointerObj class]);
        innerClassName = [entity name];
        pointerObj = [self toObject:pointerManagedObject ofType:innerClassName];
        [object setValue:pointerObj forKey:key];
    }
    
    //The primary key of the coredata table is copied to the identifier field
    int pk = [[[[[[managedObject objectID] URIRepresentation] absoluteString] lastPathComponent] substringFromIndex:1] intValue];
    [object setValue:[NSNumber numberWithInt:pk] forKey:@"identifier"];
    return  object;
}

- (NSManagedObject*)toManagedObject:(id)object{
    //This function converts an object subclassed from Model to an NSManagedObject
    NSManagedObjectContext *context = [self managedObjectContext];
    NSString *entityName = [NSString stringWithFormat:@"%@",[object class]];
    NSManagedObject *managedObject;
    
    /*************/
    // This block checks if the passed object already exists in the db if yes fetches a reference to the existing record otherwise creates a new record in the table
    if ([object valueForKey:@"identifier"]==nil || [object valueForKey:@"identifier"]==0) {
        managedObject = [NSEntityDescription
                         insertNewObjectForEntityForName:entityName
                         inManagedObjectContext:context];
    }
    else{
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription
                                       entityForName:entityName inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %d", [[object valueForKey:@"identifier"]intValue]];
        [fetchRequest setPredicate:predicate];
        NSError *error;
        NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
        if ([fetchedObjects count] > 0) {
            managedObject = [fetchedObjects objectAtIndex:0];
        }
        else{
            managedObject = [NSEntityDescription
                             insertNewObjectForEntityForName:entityName
                             inManagedObjectContext:context];
        }
        
    }
    /*************/
    
    
    //Loop through the properties of the given object and create an NSManagedObject
    unsigned propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([object class], &propertyCount);
    for (int prop = 0; prop < propertyCount; prop++)
    {
        // for all property attributes
        unsigned int attributeCount = 0;
        objc_property_t property = properties[prop];
        objc_property_attribute_t* attributes = property_copyAttributeList(property, &attributeCount);
        NSString *propertyKey;
        
        for (unsigned int  attr = 0; attr < attributeCount; attr++)
        {
            switch (attributes[attr].name[0]) {
                case 'V':
                    propertyKey = [NSString stringWithFormat:@"%s",attributes[attr].value];
                    break;
                default:
                    break;
            }
        }
        
        id valueObj = [object valueForKey:propertyKey];
        //If any of the properties is a Custom model create NSManagedObject for it recursively
        if ([valueObj respondsToSelector:@selector(isOfModelType)]) {
            //is a custom model.
            [self saveObject:[object valueForKey:propertyKey]];
            NSManagedObject *innerObject = [self toManagedObject:[object valueForKey:propertyKey]];
            [managedObject setValue:innerObject forKey:propertyKey];
        }
        else{
            //is a primitive type hence can be assigned directly.
            [managedObject setValue:[object valueForKey:propertyKey] forKey:propertyKey];
        }
        
        
        
        
        
    }
    
    return managedObject;
}

@end
