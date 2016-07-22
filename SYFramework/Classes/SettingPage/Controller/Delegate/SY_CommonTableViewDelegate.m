//
//  SY_CommonTableViewDelegate.m
//  pcdd
//
//  Created by cocoa on 7/21/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import "SY_CommonTableViewDelegate.h"
#import "SY_CommonTableViewData.h"
#import "SYCommonTableViewCell.h"
#import "UIView+SY.h"
#import "NSString+SY.h"

#define SepViewTag 10001

static NSString *DefaultTableCell = @"UITableViewCell";


@interface SY_CommonTableViewDelegate ()

@property(nonatomic, copy) SYDataReceiver dataReceiver;

@end

@implementation SY_CommonTableViewDelegate

-(instancetype)initWithTableData:(SYDataReceiver)dataReceiver{
    
    if (self = [super init]) {
        
        _dataReceiver = dataReceiver;
        _defaultSeparatorLeftEdge = SepLineLeft;
        
    }
    return self;
}

-(NSArray<SYCommonTableViewSection *> *)data{
    return self.dataReceiver();
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self data].count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SYCommonTableViewSection *tableSection = [[self data] objectAtIndex:section];
    return tableSection.rows.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 获取单元格的数据
    SYCommonTableViewSection *tableSection = [[self data] objectAtIndex:indexPath.section];
    SYCommonTableViewRow *tableRow = [tableSection.rows objectAtIndex:indexPath.row];
    
    // 用类名做单元格的标识符
    NSString *identity = tableRow.cellClassName.length? tableRow.cellClassName : DefaultTableCell;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        
        if (tableRow.fromNib) {
            // 从nib文件创建单元格实例
            UINib *nib = [UINib nibWithNibName:identity bundle:[NSBundle mainBundle]];
            NSArray *instantiateArr = [nib instantiateWithOwner:nil options:nil];
            cell = (UITableViewCell *)[instantiateArr lastObject];
        } else {
            // 用代码创建单元格实例
            Class cellClass = NSClassFromString(identity);
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identity];
        }
        
        UIView *sep = [[UIView alloc] initWithFrame:CGRectZero]; // 单元格的分隔线
        sep.tag = SepViewTag;
        
        sep.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        sep.backgroundColor = [UIColor lightGrayColor];
        [cell addSubview:sep];
    }
    
    
    if (![cell respondsToSelector:@selector(refreshData:tableView:)]) {
        UITableViewCell *defaultCell = (UITableViewCell *)cell;
        [self refreshData:tableRow tableViewCell:defaultCell];
    }else{
        [(id<SYCommonTableViewCell>)cell refreshData:tableRow tableView:tableView];
    }
    
    cell.accessoryType = tableRow.showAccessory? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

// Variable height support
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SYCommonTableViewSection *tableSection = [[self data] objectAtIndex:indexPath.section];
    SYCommonTableViewRow *tableRow = [tableSection.rows objectAtIndex:indexPath.row];
    return tableRow.uiRowHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    SYCommonTableViewSection *tableSection = [[self data] objectAtIndex:indexPath.section];
    SYCommonTableViewRow *tableRow = [tableSection.rows objectAtIndex:indexPath.row];
    
    if (!tableRow.forbidSelect) {
        
        UIViewController *vc = tableView.viewController;
        NSString *actionName = tableRow.cellActionName;
        if (actionName.length) {
            SEL sel = NSSelectorFromString(actionName);
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            [vc performSelector:sel withObject:cell];
        }
        
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //这里的cell已经有了正确的bounds
    //不在cellForRow的地方设置分割线是因为在ios7下，0.5像素的view利用autoResizeMask调整布局有问题，会导致显示不出来，ios6,ios8均正常。
    //具体问题类似http://stackoverflow.com/questions/30663733/add-a-0-5-point-height-subview-to-uinavigationbar-not-show-in-ios7
    
    
    
    //这个回调里调整分割线的位置
    SYCommonTableViewSection *tableSection = [[self data] objectAtIndex:indexPath.section];
    SYCommonTableViewRow *tableRow = [tableSection.rows objectAtIndex:indexPath.row];
    
    UIView *sep = [cell viewWithTag:SepViewTag];
    
    CGFloat sepHeight = .5f;
    CGFloat sepWidth;
    if (tableRow.sepLeftEdge) {
        sepWidth  = cell.width - tableRow.sepLeftEdge;
    }else{
        SYCommonTableViewSection *section = self.data[indexPath.section];
        if (indexPath.row == section.rows.count - 1) {
            //最后一行
            sepWidth = 0;
        }else{
            sepWidth = cell.width - self.defaultSeparatorLeftEdge;
        }
    }
    sepWidth  = sepWidth > 0 ? sepWidth : 0;
    sep.frame = CGRectMake(cell.width - sepWidth, cell.height - sepHeight, sepWidth ,sepHeight);
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    SYCommonTableViewSection *tableSection = [[self data] objectAtIndex:section];
    return tableSection.headerTitle;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) return 25.f;
    
    SYCommonTableViewSection *tableSection = [[self data] objectAtIndex:section];
    return [tableSection.headerTitle SY_sizeWithFont:[UIFont systemFontOfSize:13.f]].height;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    SYCommonTableViewSection *tableSection = [[self data] objectAtIndex:section];
    return tableSection.footerTitle;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SYCommonTableViewSection *tableSection = [[self data] objectAtIndex:section];
    if (tableSection.headerTitle.length) return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    SYCommonTableViewSection *tableSection = [[self data] objectAtIndex:section];
    if (tableSection.footerTitle.length) return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    return view;
}


#pragma mark - Private
- (void)refreshData:(SYCommonTableViewRow *)rowData tableViewCell:(UITableViewCell *)cell{
    cell.textLabel.text = rowData.title;
    cell.detailTextLabel.text = rowData.detailTitle;
}
@end
