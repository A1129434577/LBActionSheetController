//
//  NSObject+LBTypeSafe.m
//  fachan
//
//  Created by 刘彬 on 2019/11/26.
//  Copyright © 2019 Swartz. All rights reserved.
//

#import "NSObject+LBTypeSafe.h"

@implementation NSObject (LBTypeSafe)
-(NSString *)safeString{
    if ([self isKindOfClass:NSString.class]) {
        return (NSString *)self;
    }else if ([self respondsToSelector:@selector(stringValue)]){
        return ((NSNumber *)self).stringValue;
    }else{
        return @"";
    }
}

-(NSMutableString *)safeMutableString{
    if ([self isKindOfClass:NSMutableString.class]) {
        return (NSMutableString *)self;
    }else if ([self isKindOfClass:NSString.class]) {
        return [(NSString *)self mutableCopy];
    }else if ([self respondsToSelector:@selector(stringValue)]){
        return ((NSNumber *)self).stringValue.mutableCopy;
    }else{
        return @"".mutableCopy;
    }
}

-(NSArray *)safeArray{
    return [self isKindOfClass:NSArray.class]?(NSArray *)self:nil;
}

-(NSMutableArray *)safeMutableArray{
    if ([self isKindOfClass:NSMutableArray.class]) {
        return (NSMutableArray *)self;
    }else if ([self isKindOfClass:NSArray.class]) {
        return [(NSArray *)self mutableCopy];
    }else{
        return nil;
    }
}

-(NSDictionary *)safeDictionary{
    return [self isKindOfClass:NSDictionary.class]?(NSDictionary *)self:nil;
}

-(NSMutableDictionary *)safeMutableDictionary{
    if ([self isKindOfClass:NSMutableDictionary.class]) {
        return (NSMutableDictionary *)self;
    }else if ([self isKindOfClass:NSDictionary.class]) {
        return [(NSDictionary *)self mutableCopy];
    }else{
        return nil;
    }
}

-(NSData *)safeData{
    return [self isKindOfClass:NSData.class]?(NSData *)self:nil;
}

-(NSMutableData *)safeMutableData{
    if ([self isKindOfClass:NSMutableData.class]) {
        return (NSMutableData *)self;
    }else if ([self isKindOfClass:NSData.class]) {
        return [(NSData *)self mutableCopy];
    }else{
        return nil;
    }
}
@end
