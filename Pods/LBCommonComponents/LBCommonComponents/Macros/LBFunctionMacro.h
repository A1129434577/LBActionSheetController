//
//  MacroFunction.h
//  mbp_purse
//
//  Created by 刘彬 on 2016/10/13.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#ifndef LBFunctionMacro_h
#define LBFunctionMacro_h

#define LB_WEAK(weakObject,Object) typeof(Object) __weak weakObject = Object;
#define LB_WEAKSELF LB_WEAK(weakSelf,self);

#endif /* LBFunctionMacro_h */
