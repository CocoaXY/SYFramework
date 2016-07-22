//
//  UIButton+SY.h
//  OC_MyHome
//
//  Created by cocoa on 5/11/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SY)

/**
 *  创建导航栏按钮
 */
-(UIBarButtonItem *)barButtonItemWithIcom:(NSString *)iconName highlightedIcon:(NSString *)highIcon;

@end
