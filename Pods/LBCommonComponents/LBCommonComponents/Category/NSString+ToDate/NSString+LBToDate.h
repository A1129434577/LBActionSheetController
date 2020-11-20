//
//  NSString+LBToDate.h
//  CommonComponentsTestProject
//
//  Created by 刘彬 on 2019/3/5.
//  Copyright © 2019 BIN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LBToDate)
- (NSDate *)dateWithFormat:(NSString *)format;
@end

NS_ASSUME_NONNULL_END
