//
//  NSDictionary+LBSafe.m
//  LBCommonComponentsExample
//
//  Created by 刘彬 on 2020/7/14.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import "NSDictionary+LBSafe.h"
#import "NSObject+LBMethodSwizzling.h"

@implementation NSDictionary (LBSafe)
//+(void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//        Class __NSDictionaryM = NSClassFromString(@"__NSDictionaryM");
//
//        [NSObject lb_swizzleMethodClass:__NSDictionaryM
//                                 method:@selector(setObject:forKey:)
//                  originalIsClassMethod:NO
//                              withClass:self
//                             withMethod:@selector(lb_setObject:forKey:)
//                  swizzledIsClassMethod:YES];
//    });
//}
+ (void)lb_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    @try {
        [self lb_setObject:anObject forKey:aKey];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
}
@end

