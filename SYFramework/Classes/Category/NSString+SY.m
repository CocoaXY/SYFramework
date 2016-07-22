//
//  NSString+SY.m
//  加密
//
//  Created by cocoa on 5/26/16.
//  Copyright © 2016 cocoa. All rights reserved.
//
#import <CommonCrypto/CommonCrypto.h>
#import <UIKit/UIKit.h>

#import "NSString+SY.h"

@implementation NSString (SY)

@end

@implementation NSString (md5)

- (NSString *)SY_MD5String {
    const char *cstr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, (CC_LONG)strlen(cstr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)md5String{
    return [NSString md5String:self];
}

+ (NSString *)md5String:(NSString *)str{
    
    const char *myPasswd = [str UTF8String];
    
    unsigned char mdc[16];
    
    CC_MD5(myPasswd, (CC_LONG)strlen(myPasswd), mdc);
    
    NSMutableString *md5String = [NSMutableString string];
    
    for (int i = 0; i< 16; i++) {
        
        [md5String appendFormat:@"%02x",mdc[i]];
        
    }
    
    return md5String;
    
}

+ (NSString *)md5StringNB:(NSString *)str{
    
    const char *myPasswd = [str UTF8String];
    
    unsigned char mdc[16];
    
    CC_MD5(myPasswd, (CC_LONG)strlen(myPasswd), mdc);
    
    NSMutableString *md5String = [NSMutableString string];
    
    [md5String appendFormat:@"%02x",mdc[0]];
    
    for (int i = 1; i< 16; i++) {
        
        [md5String appendFormat:@"%02x",mdc[i]^mdc[0]];
        
    }
    
    return md5String;
    
}

@end

@implementation NSString (EX)

- (CGSize)SY_sizeWithFont:(UIFont *)font{
    return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}



@end