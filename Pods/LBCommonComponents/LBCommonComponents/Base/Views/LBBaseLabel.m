//
//  LBBaseLabel.m
//  LBCommonComponentsExample
//
//  Created by 刘彬 on 2019/10/25.
//  Copyright © 2019 刘彬. All rights reserved.
//

#import "LBBaseLabel.h"

@implementation LBBaseLabel

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:16];
        self.numberOfLines = 0;
    }
    return self;
}

@end
