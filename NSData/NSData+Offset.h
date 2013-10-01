//
//  NSData+Offset.h
//  
//
//  Created by Marcus Kida on 01.10.13.
//
//



@interface NSData (Offset)

+ (NSData *) dataWithContentsOfFile:(NSString *)path atOffset:(off_t)offset withSize:(size_t)bytes;

@end
