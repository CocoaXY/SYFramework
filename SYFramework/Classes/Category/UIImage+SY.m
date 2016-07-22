//
//  UIImage+SY.m
//  OC_MyHome
//
//  Created by cocoa on 5/10/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import "UIImage+SY.h"

#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

@implementation UIImage (SY)

+(UIImage *)imageWithName:(NSString *)name{
    
    UIImage *image = NULL;
    
    if (iOS7) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        image = [UIImage imageNamed:newName];
    }else{
        image = [UIImage imageNamed:name];
    }
    return image;
}

+(UIImage *)resizeImageWithImageName:(NSString *)name{
    return [self resizeImageWithImageName:name protectLeft:0.5 top:0.5];
}

+(UIImage *)resizeImageWithImageName:(NSString *)name protectLeft:(CGFloat)left top:(CGFloat)top{
    
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*left topCapHeight:image.size.height*top];
    
}

+(UIImage *)resizeImageWithImage:(UIImage *)image{
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}



@end
