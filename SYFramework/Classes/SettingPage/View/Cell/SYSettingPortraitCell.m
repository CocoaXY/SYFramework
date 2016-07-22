//
//  SYSettingProtraitCell.m
//  pcdd
//
//  Created by cocoa on 7/21/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import "SYSettingPortraitCell.h"
#import "SY_CommonTableViewData.h"
#import "UIView+SY.h"

@interface SYSettingPortraitCell ()

@property (nonatomic,weak) IBOutlet UIImageView *avatar;

@property (nonatomic,weak) IBOutlet UILabel *nameLabel;

@property (nonatomic,weak) IBOutlet UILabel *accountLabel;

@end

@implementation SYSettingPortraitCell

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    
//    if (self = [super initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:reuseIdentifier]) {
//        
//        CGFloat avatarWidth = 55.f;
//        UIImageView *avatar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, avatarWidth, avatarWidth)];
//        [self.contentView addSubview:avatar];
//        self.avatar = avatar;
//        
//        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        nameLabel.font = [UIFont systemFontOfSize:18.f];
//        [self.contentView addSubview:nameLabel];
//        self.nameLabel = nameLabel;
//        
//        UILabel *accountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        accountLabel.font = [UIFont systemFontOfSize:14.f];
//        accountLabel.textColor = [UIColor grayColor];
//        [self.contentView addSubview:accountLabel];
//        self.accountLabel = accountLabel;
//        
//        
//    }
//    return self;
//}

-(void)refreshData:(SYCommonTableViewRow *)rowData tableView:(UITableView *)tableView{
    
//    self.textLabel.text       = rowData.title;
//    self.detailTextLabel.text = [NSString stringWithFormat:@"帐号：%@",rowData.extraInfo];
    
    self.nameLabel.text = rowData.title;
    self.accountLabel.text = [NSString stringWithFormat:@"帐号：%@",rowData.extraInfo];
    
//    [self setNeedsLayout];
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
}

@end
