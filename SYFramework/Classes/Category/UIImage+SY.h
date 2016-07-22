//
//  UIImage+SY.h
//  OC_MyHome
//
//  Created by cocoa on 5/10/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SY)

/** 适配ios7的图标   @param name 图标名称    @return 对应的图片   */
+(UIImage *)imageWithName:(NSString *)name;


/** 拉伸图片    @param name 图片名称    @return UIImage对象   */
+(UIImage *)resizeImageWithImageName:(NSString *)name;


/** 拉伸图片    @param name 图片名称    @param left 左边保护比例  @param top  顶部保护比例  @return UIImage对象   */
+(UIImage *)resizeImageWithImage:(UIImage *)image;


/** 拉伸图片    @param image 图片 @return UIImage对象   */
+(UIImage *)resizeImageWithImageName:(NSString *)name protectLeft:(CGFloat)left top:(CGFloat)top;
@end
