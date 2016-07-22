//
//  UIView+SY.h
//  Demo
//
//  Created by cocoa on 5/24/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SY)

@end

@interface UIView (SY_SetFrame)

@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat centerX;
@property (nonatomic, assign)CGFloat centerY;
@property (nonatomic, assign)CGSize size;

///////////////////////////////////////////////////////////////////////////////////////////////////

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;

///////////////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)isShowingOnKeyWindow;

+ (instancetype)viewFromXib;

@end

@interface UIView (SY_aboutController)

//找到自己的vc
- (UIViewController *)viewController;

@end

@interface UIView (SY_Present)

//弹出一个类似present效果的窗口
- (void)presentView:(UIView*)view animated:(BOOL)animated complete:(void(^)()) complete;

//获取一个view上正在被present的view
- (UIView *)presentedView;

- (void)dismissPresentedView:(BOOL)animated complete:(void(^)()) complete;

//这个是被present的窗口本身的方法
//如果自己是被present出来的，消失掉
- (void)hideSelf:(BOOL)animated complete:(void(^)()) complete;

@end
