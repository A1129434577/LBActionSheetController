//
//  NSObject+LBMethodSwizzling.h
//  LBCommonComponentsExample
//
//  Created by 刘彬 on 2020/7/9.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LBMethodSwizzling)

/// SwizzlingMethod
/// @param originalClass 被交换类
/// @param originalSelector 被交换方法
/// @param originalIsClassMethod 被交换方法是类方法
/// @param swizzledClass 交换类
/// @param swizzledSelector 交换方法
/// @param swizzledIsClassMethod 交换方法是类方法
+(void)lb_swizzleMethodClass:(Class )originalClass
                      method:(SEL )originalSelector
       originalIsClassMethod:(BOOL)originalIsClassMethod
                   withClass:(Class )swizzledClass
                  withMethod:(SEL )swizzledSelector
       swizzledIsClassMethod:(BOOL)swizzledIsClassMethod;
@end

NS_ASSUME_NONNULL_END
