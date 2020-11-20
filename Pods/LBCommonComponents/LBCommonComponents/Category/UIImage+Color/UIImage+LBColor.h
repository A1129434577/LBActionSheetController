//
//  UIImage+Color.h
//  MBP_MAPP
//
//  Created by 刘彬 on 16/5/13.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LBColor)

/// 用颜色初始化图片
/// @param color 颜色
/// @param size 大小
+ (UIImage *)lb_imageWithColor:(UIColor*)color size:(CGSize)size;

/// 改变图片颜色
/// @param color 目标颜色
- (UIImage *)lb_changedColor:(UIColor *)color;

@end
