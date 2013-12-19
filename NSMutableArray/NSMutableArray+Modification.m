//
//  NSMutableArray+Modification.m
//  
//
//  Created by Marcus Kida on 19.12.13.
//
//

#import "NSMutableArray+Modification.h"

@implementation NSMutableArray (Modification)

- (void)moveObjectFromIndex:(NSUInteger)from toIndex:(NSUInteger)to
{
    if (to != from) {
        id obj = [self objectAtIndex:from];
        [self removeObjectAtIndex:from];
        if (to >= [self count]) {
            [self addObject:obj];
        } else {
            [self insertObject:obj atIndex:to];
        }
    }
}

@end
