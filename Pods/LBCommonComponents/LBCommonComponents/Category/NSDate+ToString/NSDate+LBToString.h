//
//  NSDate+LBToString.h
//  CommonComponentsTestProject
//
//  Created by 刘彬 on 2019/3/5.
//  Copyright © 2019 BIN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (LBToString)
+ (NSString *)timeInterval:(NSTimeInterval )timeInterval toStringWithFormat:(NSString *)format;
+ (NSString *)currentDateStringWithFormat:(NSString *)format;
- (NSString *)stringWithFormat:(NSString *)format;
@end

NS_ASSUME_NONNULL_END
