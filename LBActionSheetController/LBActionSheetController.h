//
//  LBActionSheetController.h
//  LBActionSheetController
//
//  Created by 刘彬 on 2020/9/17.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^_Nullable LBActionSheetAction)(NSString *_Nonnull actionTitle);

typedef NS_ENUM(NSUInteger, LBActionSheetActionStyle) {
    LBActionSheetActionStyleDefault = 0,
    LBActionSheetActionStyleCancel,
};

@interface LBActionSheetController : UIViewController
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *defaultTextFont;
@property (nonatomic, strong) UIColor *defaultTextColor;
@property (nonatomic, strong) UIFont *cancelTextFont;
@property (nonatomic, strong) UIColor *cancelTextColor;
- (instancetype)initWithTitle:(nullable NSString *)title;
- (void)addActionTitle:(NSString *)actionTitle style:(LBActionSheetActionStyle )style action:(LBActionSheetAction)action;
@end

NS_ASSUME_NONNULL_END
