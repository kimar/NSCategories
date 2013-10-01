//
//  NSDate+DaysAgo.m
//  EVEUniverse
//
//  Created by Artem Shimanski on 05.11.12.
//
//

#import "NSDate+DaysAgo.h"

@implementation NSDate (DaysAgo)

- (NSInteger) daysAgo
{
	NSCalendar* calendar = [NSCalendar currentCalendar];
	NSDateComponents* components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSTimeZoneCalendarUnit fromDate:self];
	NSDate* midnight = [calendar dateFromComponents:components];
	return [calendar components:NSDayCalendarUnit fromDate:midnight toDate:[NSDate date] options:0].day;
}

+ (NSString*) stringWithDaysAgo:(NSInteger) days
{
	if (days == 0)
		return NSLocalizedString(@"Today", @"Today");
	else if (days == 1)
		return NSLocalizedString(@"Yesterday", @"Yesterday");
	else
		return [NSString stringWithFormat:NSLocalizedString(@"%d days ago", @"%d days ago"), days];
}

- (BOOL)isSameDayWithDate:(NSDate*)date
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

- (NSString *) stringWithDaysAgoOrFormattedDate
{
    int days = [self daysAgo];
    if(days == 0)
        return NSLocalizedString(@"Today", @"Today");
    else if (days == 1)
        return NSLocalizedString(@"Yesterday", @"Yesterday");
    else
    {
        return [self asLocalizedDayAndMonthAndYear];
    }
}

@end
