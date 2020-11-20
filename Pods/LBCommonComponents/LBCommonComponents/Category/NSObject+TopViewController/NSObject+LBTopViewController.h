//
//  NSObject+LBTopViewController.h
//  LBCommonComponentsExample
//
//  Created by 刘彬 on 2020/7/7.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LBTopViewController)
+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootVC;
@end

NS_ASSUME_NONNULL_END
