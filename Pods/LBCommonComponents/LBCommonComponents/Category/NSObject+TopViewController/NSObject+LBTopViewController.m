//
//  NSObject+LBTopViewController.m
//  LBCommonComponentsExample
//
//  Created by 刘彬 on 2020/7/7.
//  Copyright © 2020 刘彬. All rights reserved.
//

#import "NSObject+LBTopViewController.h"

@implementation NSObject (LBTopViewController)
+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootVC
{
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController*)rootVC;
        return (UIViewController *)[self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController*)rootVC;
        return (UIViewController *)[self topViewControllerWithRootViewController:(UIViewController *)navigationController.visibleViewController];
    } else if (rootVC.presentedViewController) {
        UIViewController *presentedViewController = (UIViewController *)rootVC.presentedViewController;
        return (UIViewController *)[self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootVC;
    }
}
@end
