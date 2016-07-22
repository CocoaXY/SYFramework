//
//  SYCommonTableViewCell.h
//  pcdd
//
//  Created by cocoa on 7/21/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SYCommonTableViewRow;

@protocol SYCommonTableViewCell <NSObject>

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@optional
- (void)refreshData:(SYCommonTableViewRow *)rowData tableView:(UITableView *)tableView;

@end
