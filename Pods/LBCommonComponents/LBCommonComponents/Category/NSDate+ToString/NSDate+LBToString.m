//
//  NSDate+LBToString.m
//  CommonComponentsTestProject
//
//  Created by 刘彬 on 2019/3/5.
//  Copyright © 2019 BIN. All rights reserved.
//

#import "NSDate+LBToString.h"

@implementation NSDate (LBToString)
+ (NSString *)timeInterval:(NSTimeInterval )timeInterval toStringWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return [dateFormatter stringFromDate:date];
}
+(NSString *)currentDateStringWithFormat:(NSString *)format{
    return [[NSDate date] stringWithFormat:format];
}
- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:self];
}

@end
