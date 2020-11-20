//
//  UIImage+Color.m
//  MBP_MAPP
//
//  Created by 刘彬 on 16/5/13.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import "UIImage+LBColor.h"

@implementation UIImage (LBColor)
+ (UIImage *)lb_imageWithColor:(UIColor*)color size:(CGSize)size{
    @autoreleasepool{
        CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillEllipseInRect(context, rect);
        UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return theImage;
    }
    
}

- (UIImage *)lb_changedColor:(UIColor *)color
{
    @autoreleasepool{
        UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextTranslateCTM(context, 0, self.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, kCGBlendModeNormal);
        CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
        CGContextClipToMask(context, rect, self.CGImage);
        [color setFill];
        CGContextFillRect(context, rect);
        UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
    
}


@end
