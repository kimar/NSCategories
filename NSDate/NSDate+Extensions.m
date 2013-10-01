//
//  NSDate+Extensions.m
//
//
//  Created by Marcus Kida on 14.12.12.
//  Copyright (c) 2012 Marcus Kida [indiecoder.net]. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate (Extensions)

// =================================================================================================
#pragma mark -
#pragma mark IW methods
// =================================================================================================

- (NSString *) description {
   //          -----------
   // Fixes bug in 4.1
   return [self asStringWithTime];
}

// -------------------------------------------------------------------------------------------------

+ (NSDate *) nilDate {
   //        -------
   NSDateFormatter *oFormat = [[NSDateFormatter alloc] init];
   [oFormat setDateFormat:@"01/01/0001 00:00:00"];
   
   NSDate *dValue = [oFormat dateFromString:@"01/01/0001 00:00:00"];
   
   return dValue;
}

// -------------------------------------------------------------------------------------------------

- (NSDate *) minimum {
   //        -------
   NSDateFormatter *oFormat = [[NSDateFormatter alloc] init];
   [oFormat setDateFormat:@"MM/dd/yyyy 00:00:00"];
   
   NSString *sValue = [oFormat stringFromDate:self];
   NSDate *dValue = [oFormat dateFromString:sValue];
   
   return dValue;
}

// -------------------------------------------------------------------------------------------------

- (NSDate *) maximum {
   //        -------
   static NSDateFormatter *oDateFormatter = nil;
   
   if (oDateFormatter == nil) {
      NSLocale *oLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
      oDateFormatter = [[NSDateFormatter alloc] init];
      oDateFormatter.locale = oLocale;
      oDateFormatter.dateFormat = @"yyyy-MM-dd";
   }
   
   NSString *sValue = [[oDateFormatter stringFromDate:self] stringByAppendingString:@" 23:59"];
   oDateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";

   NSDate *dValue = [oDateFormatter dateFromString:sValue];
   
   return dValue;
}

// -------------------------------------------------------------------------------------------------

- (BOOL) sameDayToDate:(NSDate *) dValue {
   //    -------------
   return [[self.description substringToIndex:10] isEqualToString:[dValue.description substringToIndex:10]];
}

// -------------------------------------------------------------------------------------------------

- (NSString *) time {
   //          ----
   // "2008-12-31 14:00:39 +0100"
   NSString *sTime = [self.description substringWithRange:NSMakeRange(11, 5)];
   
   return sTime;
}

// -------------------------------------------------------------------------------------------------

- (NSString *) day {
   //          ---
   // "2008-12-31 14:00:39 +0100"
   NSString *sDay = [self.description substringToIndex:2];
   
   return sDay;
}

// -------------------------------------------------------------------------------------------------

- (NSString *) dayAndTime {
   //          ----------
   // YYYY-MM-DD HH:MM -> Datum
   // siehe http://unicode.org/reports/tr35/tr35-6.html#Date%5FFormat%5FPatterns
   static NSDateFormatter *oDateFormatter = nil;
   
   if (oDateFormatter == nil) {
      //NSLocale *oLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"];
      oDateFormatter = [[NSDateFormatter alloc] init];
       [oDateFormatter setDateStyle:NSDateFormatterMediumStyle];
       [oDateFormatter setTimeStyle:NSDateFormatterMediumStyle];
       [oDateFormatter setLocale:[NSLocale currentLocale]];
   }
   
   NSString *sValue = [oDateFormatter stringFromDate:self];   
   
   return sValue;
}

// -------------------------------------------------------------------------------------------------

- (NSString *) dayAndMonth {
   //          -----------
   // "2008-12-31 14:00:39 +0100"
   NSString *sDay = [self.description substringToIndex:6];
   
   return sDay;
}

// -------------------------------------------------------------------------------------------------

- (NSString *) shortDayTime {
   //          ------------
   return [NSString stringWithFormat:@"%@ %@", [self.description substringToIndex:6], self.time];
}

// -------------------------------------------------------------------------------------------------

- (NSString *) asString {
   //          --------
   // YYYY-MM-DD HH:MM -> Datum
   // siehe http://unicode.org/reports/tr35/tr35-6.html#Date%5FFormat%5FPatterns
   static NSDateFormatter *oDateFormatter = nil;
   
   if (oDateFormatter == nil) {
      NSLocale *oLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"];
      oDateFormatter = [[NSDateFormatter alloc] init];
      oDateFormatter.locale = oLocale;
      oDateFormatter.dateFormat = @"dd.MM.yyyy";
   }
   
   NSString *sValue = [oDateFormatter stringFromDate:self];   
   
   return sValue;
}

// -------------------------------------------------------------------------------------------------

- (NSString *) asStringWithTime {
   //          ----------------
   // YYYY-MM-DD HH:MM -> Datum
   // siehe http://unicode.org/reports/tr35/tr35-6.html#Date%5FFormat%5FPatterns
   static NSDateFormatter *oDateFormatter = nil;
   
   if (oDateFormatter == nil) {
      NSLocale *oLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
      oDateFormatter = [[NSDateFormatter alloc] init];
      oDateFormatter.locale = oLocale;
      oDateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
   }
   
   NSString *sValue = [oDateFormatter stringFromDate:self];  
   
   return sValue;
}

// -------------------------------------------------------------------------------------------------

- (NSString *) asStringWithDay {
   //          ---------------
   // YYYY-MM-DD HH:MM -> Datum
   // siehe http://unicode.org/reports/tr35/tr35-6.html#Date%5FFormat%5FPatterns
   static NSDateFormatter *oDateFormatter = nil;
   
   if (oDateFormatter == nil) {
      NSLocale *oLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"];
      oDateFormatter = [[NSDateFormatter alloc] init];
      oDateFormatter.locale = oLocale;
      oDateFormatter.dateFormat = @"EE, dd.MM.yyyy";
   }
   
   NSString *sValue = [oDateFormatter stringFromDate:self];   
   
   return sValue;
}

// -------------------------------------------------------------------------------------------------

- (NSString *) asStringWithDayAndTime {
   //          ----------------------
   // YYYY-MM-DD HH:MM -> Datum
   // siehe http://unicode.org/reports/tr35/tr35-6.html#Date%5FFormat%5FPatterns
   static NSDateFormatter *oDateFormatter = nil;
   
   if (oDateFormatter == nil) {
      NSLocale *oLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"];
      oDateFormatter = [[NSDateFormatter alloc] init];
      oDateFormatter.locale = oLocale;
      oDateFormatter.dateFormat = @"EEEE, dd.MM.yyyy HH:mm";
   }
   
   NSString *sValue = [oDateFormatter stringFromDate:self];   
   
   return sValue;
}

// -------------------------------------------------------------------------------------------------

- (NSString *) asShift {
   //          -------
   NSString *sValue;
   
   static NSDateFormatter *oDateFormatter = nil;
   
   if (oDateFormatter == nil) {
      NSLocale *oLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"];
      oDateFormatter = [[NSDateFormatter alloc] init];
      oDateFormatter.locale = oLocale;
      oDateFormatter.dateFormat = @"HH";
   }
   
   int nHour = [[oDateFormatter stringFromDate:self] intValue];   
   
   if (nHour <= 6) {
      sValue = @"Morgens";
   } else if (nHour <= 14) {
      sValue = @"Mittags";
   } else {
      sValue = @"Abends";
   }
   
   return sValue;
}

// -------------------------------------------------------------------------------------------------

- (NSString *) asStartString {
   //          -------------
   static NSDateFormatter *oDateFormatter = nil;
   
   if (oDateFormatter == nil) {
      NSLocale *oLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"];
      oDateFormatter = [[NSDateFormatter alloc] init];
      oDateFormatter.locale = oLocale;
      oDateFormatter.dateFormat = @"EEEE, HH:mm";
   }
   
   NSString *sValue = [oDateFormatter stringFromDate:self];   
   
   return sValue;
}

// -------------------------------------------------------------------------------------------------

- (NSString *) asEndString {
   //          -----------
   return [self time];
}

// -------------------------------------------------------------------------------------------------
- (NSString *) asDayMonthYearStringWithSeperator:(NSString*)sep {
    //          -----------
    
    if (!sep) {
        sep = @".";
        
    }
    
    static NSDateFormatter *oDateFormatter = nil;
    
    if (oDateFormatter == nil) {
        NSLocale *oLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"];
        oDateFormatter = [[NSDateFormatter alloc] init];
        oDateFormatter.locale = oLocale;
        oDateFormatter.dateFormat = [NSString stringWithFormat:@"yyyy%@MM%@dd",sep,sep];
    }
    
    NSString *sValue = [oDateFormatter stringFromDate:self];
    
    return sValue;
}

// -------------------------------------------------------------------------------------------------
- (double)asTimeStamp{
    return [self timeIntervalSince1970];

}

// -------------------------------------------------------------------------------------------------

- (BOOL) equalToDate:(NSDate *) dValue {
   //    -----------
   return [self compare:dValue] == NSOrderedSame;
}

// -------------------------------------------------------------------------------------------------

- (BOOL) notEqualToDate:(NSDate *) dValue {
   //    --------------
   return [self compare:dValue] != NSOrderedSame;
}

// -------------------------------------------------------------------------------------------------

- (BOOL) lowerToDate:(NSDate *) dValue {
   //    -----------
   return [self compare:dValue] == NSOrderedAscending;
}

// -------------------------------------------------------------------------------------------------

- (BOOL) lowerEqualToDate:(NSDate *) dValue {
   //    ----------------
   return [self compare:dValue] != NSOrderedDescending;
}

// -------------------------------------------------------------------------------------------------

- (BOOL) greaterToDate:(NSDate *) dValue {
   //    -------------
   return [self compare:dValue] == NSOrderedDescending;
}

// -------------------------------------------------------------------------------------------------

- (BOOL) greaterEqualToDate:(NSDate *) dValue {
   //    ------------------
   return [self compare:dValue] != NSOrderedAscending;
}

// -------------------------------------------------------------------------------------------------

- (NSInteger) daysBetweenDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:self];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

- (NSInteger) secondsBetweenDate:(NSDate *)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSSecondCalendarUnit startDate:&fromDate
                 interval:NULL forDate:self];
    [calendar rangeOfUnit:NSSecondCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSSecondCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference second];
}

+(NSDate*)dateFromString:(NSString*)dateStr formStr:(NSString*)formStr{

    NSDateFormatter * dateForm = [[NSDateFormatter alloc] init];
    NSLocale * local = [[NSLocale alloc]  initWithLocaleIdentifier:@"de_DE"];
    [dateForm setLocale:local];
    [dateForm setDateFormat:formStr];

    return [dateForm dateFromString:dateStr];

}

+ (NSString*)stringFromDate:(NSDate*)date formStr:(NSString*)formStr{
    NSDateFormatter * dateForm = [[NSDateFormatter alloc] init];
    NSLocale * local = [[NSLocale alloc]  initWithLocaleIdentifier:@"de_DE"];
    [dateForm setLocale:local];
    [dateForm setDateFormat:formStr];
    
    return [dateForm stringFromDate:date];

}

+(int)timeStampFromString:(NSString*)dateStr fromStr:(NSString*)formStr{
    NSDate * date = [NSDate dateFromString:dateStr formStr:formStr];
    
    return [date timeIntervalSince1970];

}

// -------------------------------------------------------------------------------------------------

- (NSString *) asLocalizedDayAndMonthAndYear
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];;
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    return [dateFormatter stringFromDate:self];
}
@end
