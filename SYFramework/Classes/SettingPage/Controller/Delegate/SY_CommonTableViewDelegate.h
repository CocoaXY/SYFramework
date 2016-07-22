//
//  SY_CommonTableViewDelegate.h
//  pcdd
//
//  Created by cocoa on 7/21/16.
//  Copyright © 2016 cocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSArray* (^SYDataReceiver)(void);

@interface SY_CommonTableViewDelegate : NSObject <UITableViewDataSource,UITableViewDelegate>

- (instancetype) initWithTableData:(SYDataReceiver) dataReceiver;

@property (nonatomic,assign) CGFloat defaultSeparatorLeftEdge;

@end
