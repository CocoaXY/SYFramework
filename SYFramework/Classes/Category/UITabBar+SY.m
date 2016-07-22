//
//  UITabBar+SY.m
//  Demo
//
//  Created by cocoa on 5/24/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import "UITabBar+SY.h"
#import <objc/runtime.h>

@implementation UITabBar (SY)

@end

@implementation UITabBar (SYTabbarExtension)


static NSString *AssociatedButtonKey;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], @selector(layoutSubviews));
        Method swizzledMethod = class_getInstanceMethod([self class], @selector(swizzled_layoutSubviews));
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIButton  *centerButton = objc_getAssociatedObject(self, &AssociatedButtonKey);
        
        if (!centerButton) {
            centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
            objc_setAssociatedObject(self, &AssociatedButtonKey, centerButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        
        [self addSubview:centerButton];
    }
    
    return self;
}

- (void)swizzled_layoutSubviews
{
    [self swizzled_layoutSubviews];
    
    [self setValue:[NSValue valueWithCGRect:self.bounds] forKeyPath:@"_backgroundView.frame"];
    
    UIButton  *centerButton = objc_getAssociatedObject(self, &AssociatedButtonKey);
    
    centerButton.bounds = CGRectMake(0, 0, centerButton.currentBackgroundImage.size.width, centerButton.currentBackgroundImage.size.height);
    CGFloat buttonW = self.frame.size.width / (self.items.count + 1);
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    CGFloat buttonX = 0;
    int index = 0;
    
    centerButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    for (UIView *chidView in self.subviews) {
        if ([chidView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            buttonX = index *buttonW;
            index++;
            if (index == 2) {
                index++;
            }
            chidView.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        }
    }
}

- (void)setUpTabBarCenterButton:(void ( ^ _Nullable )(UIButton * _Nullable centerButton ))centerButtonBlock
{
    centerButtonBlock(objc_getAssociatedObject(self, &AssociatedButtonKey));
}

@end