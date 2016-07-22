//
//  SY_CommonTableViewData.h
//  pcdd
//
//  Created by cocoa on 7/21/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SepLineLeft 15 //分割线距左边距离

//section key
#define HeaderTitle  @"headerTitle"
#define FooterTitle  @"footerTitle"
#define HeaderHeight @"headerHeight"
#define FooterHeight @"footerHeight"
#define RowContent   @"rowContent"

//row key
#define Title         @"title"
#define DetailTitle   @"detailTitle"
#define CellClass     @"cellClass"
#define CellAction    @"action"
#define ExtraInfo     @"extraInfo"
#define RowHeight     @"rowHeight"
#define SepLeftEdge   @"leftEdge"


//common key
#define Disable       @"disable"      //cell不可见
#define ShowAccessory @"accessory"    //cell显示>箭头
#define ForbidSelect  @"forbidSelect" //cell不响应select事件
#define FromNib       @"fromNib"      //cell从nib文件中加载

@class SYCommonTableViewRow;

@interface SYCommonTableViewSection : NSObject

@property (nonatomic,copy)   NSString *headerTitle;

@property (nonatomic,copy)   NSArray<SYCommonTableViewRow *> *rows;

@property (nonatomic,copy)   NSString *footerTitle;

@property (nonatomic,assign) CGFloat  uiHeaderHeight;

@property (nonatomic,assign) CGFloat  uiFooterHeight;

- (instancetype) initWithDict:(NSDictionary *)dict;

+ (NSArray<SYCommonTableViewSection *> *)sectionsWithData:(NSArray<NSDictionary *> *)data;

@end

@interface SYCommonTableViewRow : NSObject

@property (nonatomic,strong) NSString *title;

@property (nonatomic,copy  ) NSString *detailTitle;

@property (nonatomic,copy  ) NSString *cellClassName;

@property (nonatomic,copy  ) NSString *cellActionName;

@property (nonatomic,assign) CGFloat  uiRowHeight;

@property (nonatomic,assign) CGFloat  sepLeftEdge;

@property (nonatomic,assign) BOOL     showAccessory;

@property (nonatomic,assign) BOOL     forbidSelect;

@property(nonatomic, assign) BOOL     fromNib;

@property (nonatomic,strong) id extraInfo;

- (instancetype) initWithDict:(NSDictionary *)dict;

+ (NSArray<SYCommonTableViewRow *> *)rowsWithData:(NSArray<NSDictionary *> *)data;

@end
