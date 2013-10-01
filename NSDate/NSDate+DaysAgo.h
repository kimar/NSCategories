//
//  NSDate+DaysAgo.h
//  EVEUniverse
//
//  Created by Artem Shimanski on 05.11.12.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (DaysAgo)

- (NSInteger) daysAgo;
+ (NSString*) stringWithDaysAgo:(NSInteger) days;
- (BOOL)isSameDayWithDate:(NSDate*)date;
- (NSString *) stringWithDaysAgoOrFormattedDate;

@end
