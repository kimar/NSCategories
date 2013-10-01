//
//  UIImage+FixOrientation.m
//
//
//  Created by Marcus Kida on 27.08.13.
//
//

#import "UIImage+FixOrientation.h"

@implementation UIImage (FixOrientation)

- (UIImage *) fixOrientation
{    
    return [[UIImage alloc] initWithCGImage:self.CGImage
                                      scale:self.scale
                                orientation:UIImageOrientationUp];
}

@end
