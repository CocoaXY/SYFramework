//
//  SY_CommonTableViewData.m
//  pcdd
//
//  Created by cocoa on 7/21/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import "SY_CommonTableViewData.h"

#define DefaultUIRowHeight  50.f
#define DefaultUIHeaderHeight  44.f
#define DefaultUIFooterHeight  44.f

@implementation SYCommonTableViewSection

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if ([dict[Disable] boolValue]) return nil;
    
    if (self = [super init]) {
        
        _headerTitle = dict[HeaderTitle];
        _footerTitle = dict[FooterTitle];
        
        _uiHeaderHeight = [dict[HeaderHeight] floatValue];
        _uiFooterHeight = [dict[FooterHeight] floatValue];
        
        _uiHeaderHeight = _uiHeaderHeight? _uiHeaderHeight : DefaultUIHeaderHeight;
        _uiFooterHeight = _uiFooterHeight? _uiFooterHeight : DefaultUIFooterHeight;
        
        _rows = [SYCommonTableViewRow rowsWithData:dict[RowContent]];
        
    }
    return self;
    
}

+(NSArray<SYCommonTableViewSection *> *)sectionsWithData:(NSArray<NSDictionary *> *)data{
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *dict in data) {
        SYCommonTableViewSection *section = [[SYCommonTableViewSection alloc] initWithDict:dict];
        if (section) {
            [array addObject:section];
        }
    }
    
    return array;
}

@end

@implementation SYCommonTableViewRow

- (instancetype) initWithDict:(NSDictionary *)dict{
    
    if ([dict[Disable] boolValue]) return nil;
    
    if (self = [super init]) {
        
        _cellClassName = dict[CellClass];
        _cellActionName = dict[CellAction];
        
        _title = dict[Title];
        _detailTitle = dict[DetailTitle];
        
        _uiRowHeight = dict[RowHeight] ? [dict[RowHeight] floatValue] : DefaultUIRowHeight;
        
        _extraInfo = dict[ExtraInfo];
        _sepLeftEdge = [dict[SepLeftEdge] floatValue];
        _showAccessory = [dict[ShowAccessory] boolValue];
        _forbidSelect = [dict[ForbidSelect] boolValue];
        _fromNib = [dict[FromNib] boolValue];
        
    }
    return self;
    
}

+ (NSArray<SYCommonTableViewRow *> *)rowsWithData:(NSArray<NSDictionary *> *)data{
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSDictionary *dict in data) {
        SYCommonTableViewRow *row = [[SYCommonTableViewRow alloc] initWithDict:dict];
        if (row) {
            [array addObject:row];
        }
    }
    
    return array;
}

@end