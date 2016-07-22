//
//  UITabBar+SY.h
//  Demo
//
//  Created by cocoa on 5/24/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (SY)

@end

// ———————————————————— 如果图片与文字分开请使用类扩展 ——————————————————————
@interface UITabBar (SYTabbarExtension)

// 设置个性化中间按钮
- (void)setUpTabBarCenterButton:(void ( ^ _Nullable )(UIButton * _Nullable centerButton ))centerButtonBlock;

@end