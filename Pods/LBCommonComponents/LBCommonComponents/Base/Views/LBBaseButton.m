//
//  LBBaseButton.m
//  LBCommonComponentsExample
//
//  Created by 刘彬 on 2019/10/25.
//  Copyright © 2019 刘彬. All rights reserved.
//

#import "LBBaseButton.h"

@implementation LBBaseButton
- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.numberOfLines = 0;
    }
    return self;
}

@end
