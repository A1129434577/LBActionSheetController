//
//  LBSystemHeader.h
//  CommonComponentsTestProject
//
//  Created by 刘彬 on 2019/2/22.
//  Copyright © 2019 BIN. All rights reserved.
//

#ifndef LBSystemMacro_h
#define LBSystemMacro_h

#define LB_APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define LB_BUNDLE_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]
#define LB_BUNDLE_IDENTIFIER [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
#define LB_UUID_STRING [[[UIDevice currentDevice] identifierForVendor] UUIDString]
#define LB_SYSTEM_VERSION [UIDevice currentDevice].systemVersion

#endif /* LBSystemMacro_h */
