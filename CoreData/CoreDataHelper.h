//
//  CoreDataHelper.h
//  
//
//  Created by Marcus Kida on 03.02.14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataHelper : NSObject

@property (strong) NSManagedObjectContext *managedObjectContext;
@property (strong) NSPersistentStoreCoordinator *persistentStoreCoordinator

- (void) saveCoreDataThreadSafeForContext:(NSManagedObjectContext *)threadManagedObjectContext withCompletion:(void(^)())completion;

@end
