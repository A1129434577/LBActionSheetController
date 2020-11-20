//
//  UIView+Geometry.h
//  MMPhotoPicker
//
//  Created by LEA on 2017/11/10.
//  Copyright © 2017年 LEA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LBGeometry)

@property (nonatomic, assign) CGFloat lb_height;
@property (nonatomic, assign) CGFloat lb_width;
@property (nonatomic, assign) CGFloat lb_top;
@property (nonatomic, assign) CGFloat lb_left;
@property (nonatomic, assign) CGFloat lb_bottom;
@property (nonatomic, assign) CGFloat lb_right;
@property (nonatomic, assign) CGFloat lb_centerX;
@property (nonatomic, assign) CGFloat lb_centerY;
@property (nonatomic, assign) CGPoint lb_origin;
@property (nonatomic, assign) CGSize  lb_size;

@end
