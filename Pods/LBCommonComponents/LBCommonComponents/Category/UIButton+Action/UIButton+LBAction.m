//
//  UIButton+init.m
//  QHBranch
//
//  Created by 刘彬 on 2018/12/20.
//  Copyright © 2018 BIN. All rights reserved.
//

#import "UIButton+LBAction.h"
#import <objc/runtime.h>

@implementation UIButton (LBAction)
@dynamic lb_action;
static NSString *LBButtonActionKey = @"LBButtonActionKey";
- (instancetype)initWithFrame:(CGRect)frame action:(void (^)(__kindof UIButton * _Nonnull))action;
{
    self = [[self.class alloc] initWithFrame:frame];
    if (self) {
        self.lb_action = action;
        [self setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return self;
}
-(void (^)(__kindof UIButton * _Nonnull))lb_action{
    return objc_getAssociatedObject(self, &LBButtonActionKey);
}
-(void)setLb_action:(void (^)(__kindof UIButton * _Nonnull))lb_action{
    objc_setAssociatedObject(self, &LBButtonActionKey, lb_action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}
-(void)buttonAction{
    __weak typeof(self) weakSelf = self;
    self.lb_action?self.lb_action(weakSelf):NULL;
}

@end
