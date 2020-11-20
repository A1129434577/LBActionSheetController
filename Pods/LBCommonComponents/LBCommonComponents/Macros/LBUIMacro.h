//
//  LBUIMacro.h
//  CommonComponentsTestProject
//
//  Created by 刘彬 on 2019/2/22.
//  Copyright © 2019 BIN. All rights reserved.
//

#ifndef LBUIMacro_h
#define LBUIMacro_h

#define LBColorRGBA(R,G,B,A) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
#define LBColorRGB(R, G, B)  LBColorRGBA(R,G,B,1.0)
#define LBColorRGBHex(rgbValue) LBColorRGB(((rgbValue & 0xFF0000) >> 16), ((rgbValue & 0x00FF00) >> 8), (rgbValue & 0x0000FF))
#define LBColorRGBAHex(rgbValue,A) LBColorRGBA(((rgbValue & 0xFF0000) >> 16), ((rgbValue & 0x00FF00) >> 8), (rgbValue & 0x0000FF), A)

#define LB_SCREEN_WIDTH CGRectGetWidth([UIScreen mainScreen].bounds)
#define LB_SCREEN_HEIGHT CGRectGetHeight([UIScreen mainScreen].bounds)

#define LB_KEY_WINDOW \
({\
id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;\
UIWindow *keyWindow = [delegate respondsToSelector:@selector(window)]?delegate.window:nil;\
if (keyWindow == nil) {\
    if (@available(ios 13, *)) {\
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes){\
            if (windowScene.activationState == UISceneActivationStateForegroundActive){\
                UIWindow *window = windowScene.windows.firstObject;\
                if (window) {\
                    keyWindow = window;\
                }\
                break;\
            }\
        }\
        if (keyWindow == nil) {\
            keyWindow = [UIApplication sharedApplication].keyWindow;\
        }\
    }else{\
        keyWindow = [UIApplication sharedApplication].keyWindow;\
    }\
}\
keyWindow;\
})

#define LB_SAFE_AREA_TOP_HEIGHT(ViewController) \
({\
        CGFloat safeAreaInsetsTop = 0;\
        if (@available(ios 13, *)) {\
            safeAreaInsetsTop = CGRectGetMaxY(LB_KEY_WINDOW.windowScene.statusBarManager.statusBarFrame);\
        }else{\
            safeAreaInsetsTop = CGRectGetMaxY([UIApplication sharedApplication].statusBarFrame);\
        }\
        if(ViewController.navigationController && !ViewController.navigationController.navigationBar.hidden && !ViewController.navigationController.navigationBarHidden){\
            safeAreaInsetsTop += CGRectGetHeight(ViewController.navigationController.navigationBar.frame);\
        }\
        safeAreaInsetsTop;\
})


#define LB_SAFE_AREA_BOTTOM_HEIGHT(ViewController) \
({\
CGFloat safeAreaInsetsBottom = 0;\
if (@available(iOS 11.0, *)) {\
    safeAreaInsetsBottom = LB_KEY_WINDOW.safeAreaInsets.bottom;\
}\
if(ViewController.tabBarController && !ViewController.tabBarController.tabBar.hidden && !ViewController.hidesBottomBarWhenPushed){\
    safeAreaInsetsBottom  += CGRectGetHeight(ViewController.tabBarController.tabBar.frame);\
}\
safeAreaInsetsBottom;\
})

#define LB_SAFE_AREA_VERTICAL_HEIGHT(ViewController) \
({\
LB_SAFE_AREA_TOP_HEIGHT(ViewController) + LB_SAFE_AREA_BOTTOM_HEIGHT(ViewController);\
})

#endif /* LBUIMacro_h */
