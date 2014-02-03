//
//  CoreDataHelper.m
//  
//
//  Created by Marcus Kida on 03.02.14.
//
//

#import "CoreDataHelper.h"

@implementation CoreDataHelper

#pragma mark - Public
- (void) saveCoreDataThreadSafeForContext:(NSManagedObjectContext *)threadManagedObjectContext withCompletion:(void(^)())completion
{
    // lock the store we share with main thread's context
    [self.persistentStoreCoordinator lock];
    
    // save any changes, observe it so we can trigger merge with the actual context
    @try {
        [threadManagedObjectContext processPendingChanges];
    }
    @catch (NSException * e) {
        [self.persistentStoreCoordinator unlock];
    }
    @finally {
        // pass
    }
    
    NSNotificationCenter *dnc = [NSNotificationCenter defaultCenter];
    [dnc addObserver:self selector:@selector(threadControllerContextDidSave:) name:NSManagedObjectContextDidSaveNotification object:threadManagedObjectContext];
    @try {
        NSError *error;
        if (![threadManagedObjectContext save:&error]) {
            [self.persistentStoreCoordinator unlock];
        }
    } @catch (NSException *e) {
        [self.persistentStoreCoordinator unlock];
    } @finally {
        // pass
    }
    
    completion();
}

#pragma mark - Private
// Merging changes causes the fetched results controller to update its results
- (void)threadControllerContextDidSave:(NSNotification*)saveNotification
{
    
    // need to unlock before we let main thread merge
    [self.persistentStoreCoordinator unlock];
    [self performSelectorOnMainThread:@selector(mergeToMainContext:) withObject:saveNotification waitUntilDone:YES];
}

- (void)mergeToMainContext:(NSNotification*)saveNotification
{
    NSError *error;
    [self.managedObjectContext mergeChangesFromContextDidSaveNotification:saveNotification];
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"CoreData Context Save Error: %@", [error localizedDescription]);
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSManagedObjectContextDidSaveNotification object:nil];
}

@end
