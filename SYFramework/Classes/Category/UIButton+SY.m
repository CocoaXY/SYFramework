//
//  UIButton+SY.m
//  OC_MyHome
//
//  Created by cocoa on 5/11/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import "UIButton+SY.h"

@implementation UIButton (SY)

-(UIBarButtonItem *)barButtonItemWithIcom:(NSString *)iconName highlightedIcon:(NSString *)highIcon{
    [self setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    CGFloat BtnW = self.currentImage.size.width;
    CGFloat BtnH = self.currentImage.size.height;
    self.bounds = CGRectMake(0, 0, BtnW, BtnH);
    return [[UIBarButtonItem alloc] initWithCustomView:self];
}

@end
