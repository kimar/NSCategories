//
//  NSDate+Extensions.h
//
//
//  Created by Marcus Kida on 14.12.12.
//  Copyright (c) 2012 Marcus Kida [indiecoder.net]. All rights reserved.
//

@interface NSDate (Extensions)
   //      ------

// -------------------------------------------------------------------------------------------------

- (NSString *) asStartString;
- (NSString *) asEndString;
+ (NSDate *) nilDate;
- (NSDate *) minimum;
- (NSDate *) maximum;
- (NSString *) time;
- (NSString *) shortDayTime;
- (NSString *) day;
- (NSString *) dayAndTime;
- (NSString *) dayAndMonth;
- (NSString *) asString;
- (NSString *) asStringWithTime;
- (NSString *) asStringWithDayAndTime;
- (NSString *) asStringWithDay;
- (NSString *) asShift;
- (NSString *) asDayMonthYearStringWithSeperator:(NSString*)sep;

- (double)asTimeStamp;
- (BOOL) sameDayToDate:(NSDate *) dValue;
- (BOOL) equalToDate:(NSDate *) dValue;
- (BOOL) notEqualToDate:(NSDate *) dValue;
- (BOOL) lowerToDate:(NSDate *) dValue;
- (BOOL) lowerEqualToDate:(NSDate *) dValue;
- (BOOL) greaterToDate:(NSDate *) dValue;
- (BOOL) greaterEqualToDate:(NSDate *) dValue;
- (NSInteger) daysBetweenDate:(NSDate*)toDateTime;
- (NSInteger) secondsBetweenDate:(NSDate *)toDateTime;
+ (NSDate*)dateFromString:(NSString*)dateStr formStr:(NSString*)formStr;
+ (NSString*)stringFromDate:(NSDate*)date formStr:(NSString*)formStr;
+ (int)timeStampFromString:(NSString*)dateStr fromStr:(NSString*)formStr;

// -------------------------------------------------------------------------------------------------

- (NSString *) asLocalizedDayAndMonthAndYear;

@end
