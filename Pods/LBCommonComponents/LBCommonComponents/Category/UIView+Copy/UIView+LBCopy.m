//
//  UIView+init.m
//  CommonComponentsTestProject
//
//  Created by 刘彬 on 2019/2/22.
//  Copyright © 2019 BIN. All rights reserved.
//

#import "UIView+LBCopy.h"
#import <objc/runtime.h>

@implementation UIView (LBCopy)
- (id)copyWithZone:(NSZone *)zone {
    Class class = [self class];
    id aNewObj = [[class allocWithZone:zone] init];
    while (class != NSObject.self) {
        unsigned int propsCount;
        objc_property_t *props = class_copyPropertyList(class, &propsCount);//获得属性列表
        for(int i = 0;i < propsCount; i++)
        {
            objc_property_t prop = props[i];
            
            NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];//获得属性的名称
            
            if ([class instancesRespondToSelector:NSSelectorFromString(propName)] && [class instancesRespondToSelector:NSSelectorFromString([NSString stringWithFormat:@"set%@%@:",[propName substringToIndex:1].uppercaseString,[propName substringFromIndex:1]])]) {
                id value = [self valueForKey:propName];
                if ([value isKindOfClass:UIView.self]) {
                    value = [value copy];
                }
                [aNewObj setValue:value forKey:propName];
            }
        }
        
        free(props);
        class = class_getSuperclass(class);//记住还要遍历父类的属性呢
    }
    return aNewObj;
}
@end
