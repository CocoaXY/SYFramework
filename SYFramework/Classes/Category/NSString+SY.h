//
//  NSString+SY.h
//  加密
//
//  Created by cocoa on 5/26/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SY)

@end

@interface NSString (md5)

/** md5 云信加密 实例方法 */
- (NSString *)SY_MD5String;

/** md5 一般加密 实例方法 */
- (NSString *)md5String;

/** md5 一般加密 */
+ (NSString *)md5String:(NSString *)str;

/** md5 NB(牛逼的意思)加密*/
+ (NSString *)md5StringNB:(NSString *)str;

@end

@interface NSString (EX)

/**根据字体计算文字的大小*/
- (CGSize)SY_sizeWithFont:(UIFont *)font;
@end
