//
//  NSObject+LBMethodSwizzling.m
//  LBCommonComponentsExample
//
//  Created by 刘彬 on 2020/7/9.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import "NSObject+LBMethodSwizzling.h"

@implementation NSObject (LBMethodSwizzling)
+(void)lb_swizzleMethodClass:(Class)originalClass
                      method:(SEL)originalSelector
       originalIsClassMethod:(BOOL)originalIsClassMethod
                   withClass:(Class)swizzledClass
                  withMethod:(SEL)swizzledSelector
       swizzledIsClassMethod:(BOOL)swizzledIsClassMethod{
    
    Method originalMethod;
    Method swizzledMethod;
    
    BOOL originalClassRespondSwizzledMethod = NO;
    
    if (originalIsClassMethod) {
        originalClass = object_getClass(originalClass);
        
        originalMethod = class_getClassMethod(originalClass, originalSelector);
        originalClassRespondSwizzledMethod = [originalClass respondsToSelector:swizzledSelector];
    }else{
        originalMethod = class_getInstanceMethod(originalClass, originalSelector);
        originalClassRespondSwizzledMethod = [originalClass instancesRespondToSelector:swizzledSelector];
    }
    
    if (swizzledIsClassMethod) {
        swizzledClass = object_getClass(swizzledClass);
        
        swizzledMethod = class_getClassMethod(swizzledClass, swizzledSelector);
    }else{
        swizzledMethod = class_getInstanceMethod(swizzledClass, swizzledSelector);
    }
    
    
    
    BOOL registerMethod = class_addMethod(originalClass,
                                          swizzledSelector,
                                          method_getImplementation(swizzledMethod),
                                          method_getTypeEncoding(swizzledMethod));
    
    if (originalClassRespondSwizzledMethod == NO) {
        originalClassRespondSwizzledMethod = registerMethod;
    }
    if (originalClassRespondSwizzledMethod == NO) {
        return;
    }
    
    if (originalIsClassMethod) {
        swizzledMethod = class_getClassMethod(originalClass, swizzledSelector);
    }else{
        swizzledMethod = class_getInstanceMethod(originalClass, swizzledSelector);
    }
    
    if (!swizzledMethod) {
        return;
    }
    
    BOOL didAddMethod = class_addMethod(originalClass,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(originalClass,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
