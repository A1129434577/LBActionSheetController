//
//  NSArray+LBSafe.m
//  LBCommonComponentsExample
//
//  Created by 刘彬 on 2020/7/14.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import "NSArray+LBSafe.h"
#import "NSObject+LBMethodSwizzling.h"

@implementation NSArray (LBSafe)
//+(void)load{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        
//        Class __NSArrayM = NSClassFromString(@"__NSArrayM");
//        
//        [NSObject lb_swizzleMethodClass:__NSArrayM
//                       method:@selector(insertObject:atIndex:)
//        originalIsClassMethod:NO withClass:self
//                   withMethod:@selector(lb_insertObject:atIndex:)
//        swizzledIsClassMethod:YES];
//        
//        [NSObject lb_swizzleMethodClass:__NSArrayM
//                       method:@selector(removeObjectsInRange:)
//        originalIsClassMethod:NO withClass:self
//                   withMethod:@selector(lb_removeObjectsInRange:)
//        swizzledIsClassMethod:YES];
//        
//        [NSObject lb_swizzleMethodClass:__NSArrayM
//                       method:@selector(subarrayWithRange:)
//        originalIsClassMethod:NO withClass:self
//                   withMethod:@selector(lb_subarrayWithRange:)
//        swizzledIsClassMethod:YES];
//        
//        [NSObject lb_swizzleMethodClass:__NSArrayM
//                       method:@selector(setObject:atIndexedSubscript:)
//        originalIsClassMethod:NO withClass:self
//                   withMethod:@selector(lb_setObject:atIndexedSubscript:)
//        swizzledIsClassMethod:YES];
//        
//        
//        [NSObject lb_swizzleMethodClass:__NSArrayM
//                       method:@selector(replaceObjectAtIndex:withObject:)
//        originalIsClassMethod:NO withClass:self
//                   withMethod:@selector(lb_replaceObjectAtIndex:withObject:)
//        swizzledIsClassMethod:YES];
//        
//        
//        [NSObject lb_swizzleMethodClass:__NSArrayM
//                       method:@selector(replaceObjectsInRange:withObjectsFromArray:)
//        originalIsClassMethod:NO withClass:self
//                   withMethod:@selector(lb_replaceObjectsInRange:withObjectsFromArray:)
//        swizzledIsClassMethod:YES];
//        
//        
//        [NSObject lb_swizzleMethodClass:__NSArrayM
//                       method:@selector(replaceObjectsAtIndexes:withObjects:)
//        originalIsClassMethod:NO withClass:self
//                   withMethod:@selector(lb_replaceObjectsAtIndexes:withObjects:)
//        swizzledIsClassMethod:YES];
//        
//        
//        [NSObject lb_swizzleMethodClass:__NSArrayM
//                       method:@selector(replaceObjectsInRange:withObjectsFromArray:range:)
//        originalIsClassMethod:NO withClass:self
//                   withMethod:@selector(lb_replaceObjectsInRange:withObjectsFromArray:range:)
//        swizzledIsClassMethod:YES];
//        
//        
//        NSArray<Class> *arrayClassArray =
//        @[__NSArrayM,
//          NSClassFromString(@"__NSPlaceholderArray"),
//          NSClassFromString(@"__NSArrayI"),
//          NSClassFromString(@"__NSSingleObjectArrayI"),
//          NSClassFromString(@"__NSArray0")];
//        
//        [arrayClassArray enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            [NSObject lb_swizzleMethodClass:obj
//                                     method:@selector(objectAtIndex:)
//                      originalIsClassMethod:NO withClass:self
//                                 withMethod:@selector(lb_objectAtIndex:)
//                      swizzledIsClassMethod:YES];
//            
//            [NSObject lb_swizzleMethodClass:obj
//                           method:@selector(objectAtIndexedSubscript:)
//            originalIsClassMethod:NO withClass:self
//                       withMethod:@selector(lb_objectAtIndexedSubscript:)
//            swizzledIsClassMethod:YES];
//            
//            [NSObject lb_swizzleMethodClass:obj
//                           method:@selector(objectsAtIndexes:)
//            originalIsClassMethod:NO withClass:self
//                       withMethod:@selector(lb_objectsAtIndexes:)
//            swizzledIsClassMethod:YES];
//            
//            
//        }];
//    });
//}
+ (instancetype)lb_objectAtIndex:(NSUInteger)index{
    @try {
       return [self lb_objectAtIndex:index];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
    return nil;
}
+ (instancetype)lb_objectAtIndexedSubscript:(NSUInteger)index{
    @try {
       return [self lb_objectAtIndexedSubscript:index];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
    return nil;
}
+ (NSArray *)lb_objectsAtIndexes:(NSIndexSet *)indexes{
    @try {
       return [self lb_objectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
    return nil;
}

+ (void)lb_insertObject:(id)anObject atIndex:(NSUInteger)index{
    @try {
        [self lb_insertObject:anObject atIndex:index];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
}

+ (void)lb_removeObjectsInRange:(NSRange)range{
    @try {
        [self lb_removeObjectsInRange:range];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
}

+ (void)lb_subarrayWithRange:(NSRange)range{
    @try {
        [self lb_subarrayWithRange:range];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
}
+ (void)lb_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx{
    @try {
        [self lb_setObject:obj atIndexedSubscript:idx];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
}

+ (void)lb_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    @try {
        [self lb_replaceObjectAtIndex:index withObject:anObject];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
}

+ (void)lb_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray{
    @try {
        [self lb_replaceObjectsInRange:range withObjectsFromArray:otherArray];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
}

+ (void)lb_replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects{
    @try {
        [self lb_replaceObjectsAtIndexes:indexes withObjects:objects];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
}
+ (void)lb_replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange{
    @try {
        [self lb_replaceObjectsInRange:range withObjectsFromArray:otherArray range:otherRange];
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    } @finally {
    }
}
@end
