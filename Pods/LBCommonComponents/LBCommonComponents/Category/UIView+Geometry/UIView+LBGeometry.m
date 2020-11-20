//
//  UIView+Geometry.m
//  MMPhotoPicker
//
//  Created by LEA on 2017/11/10.
//  Copyright © 2017年 LEA. All rights reserved.
//

#import "UIView+LBGeometry.h"

@implementation UIView (LBGeometry)

- (CGPoint)lb_origin
{
    return self.frame.origin;
}

- (void)setLb_origin:(CGPoint)lb_origin
{
    CGRect rect = self.frame;
    rect.origin = lb_origin;
    self.frame = rect;
}

- (CGSize)lb_size
{
    return self.frame.size;
}

- (void)setLb_size:(CGSize)lb_size
{
    CGRect rect = self.frame;
    rect.size = lb_size;
    self.frame = rect;
}

- (CGFloat)lb_height
{
    return CGRectGetHeight(self.bounds);
}

- (void)setLb_height:(CGFloat)lb_height
{
    CGRect rect = self.frame;
    rect.size.height = lb_height;
    self.frame = rect;
}

- (CGFloat)lb_width
{
    return CGRectGetWidth(self.bounds);
}

- (void)setLb_width:(CGFloat)lb_width
{
    CGRect rect = self.frame;
    rect.size.width = lb_width;
    self.frame = rect;
}

- (CGFloat)lb_top
{
    return CGRectGetMinY(self.frame);
}

- (void)setLb_top:(CGFloat)lb_top
{
    CGRect rect = self.frame;
    rect.origin.y = lb_top;
    self.frame = rect;
}

- (CGFloat)lb_left
{
    return CGRectGetMinX(self.frame);
}

- (void)setLb_left:(CGFloat)lb_left
{
    CGRect rect = self.frame;
    rect.origin.x = lb_left;
    self.frame = rect;
}

- (CGFloat)lb_bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setLb_bottom:(CGFloat)lb_bottom
{
    CGRect rect = self.frame;
    rect.origin.y = lb_bottom - CGRectGetHeight(self.bounds);
    self.frame = rect;
}

- (CGFloat)lb_right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setLb_right:(CGFloat)lb_right
{
    CGRect rect = self.frame;
    rect.origin.x = lb_right - CGRectGetWidth(self.bounds) ;
    self.frame = rect;
}

- (CGFloat)lb_centerX
{
    return CGRectGetMidX(self.frame);
}

- (void)setLb_centerX:(CGFloat)lb_centerX
{
    CGPoint center = self.center;
    center.x = lb_centerX;
    self.center = center;
}

- (CGFloat)lb_centerY
{
    return CGRectGetMidY(self.frame);
}

- (void)setLb_centerY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

@end
