//
//  NSData+Offset.m
//  
//
//  Created by Marcus Kida on 01.10.13.
//
//

#import "NSData+Offset.h"

@implementation NSData (Offset)

+ (NSData *) dataWithContentsOfFile:(NSString *)path atOffset:(off_t)offset withSize:(size_t)bytes
{
    FILE *file = fopen([path UTF8String], "rb");
    if(file == NULL)
        return nil;
    
    void *data = malloc(bytes);  // check for NULL!
    fseeko(file, offset, SEEK_SET);
    fread(data, 1, bytes, file);  // check return value, in case read was short!
    fclose(file);
    
    // NSData takes ownership and will call free(data) when it's released
    return [NSData dataWithBytesNoCopy:data length:bytes];
}

@end
