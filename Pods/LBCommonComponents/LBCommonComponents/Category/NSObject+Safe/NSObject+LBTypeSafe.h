//
//  NSObject+LBTypeSafe.h
//  fachan
//
//  Created by 刘彬 on 2019/11/26.
//  Copyright © 2019 Swartz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (LBTypeSafe)

-(NSString *)safeString;

-(NSMutableString *)safeMutableString;

-(NSArray *)safeArray;

-(NSMutableArray *)safeMutableArray;

-(NSDictionary *)safeDictionary;

-(NSMutableDictionary *)safeMutableDictionary;

-(NSData *)safeData;

-(NSMutableData *)safeMutableData;

@end

