//
//  TableViewModel.h
//  MVVMDemo
//
//  Created by mm-cy on 2019/3/13.
//  Copyright © 2019 mm-cy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewModel : NSObject<UITableViewDelegate, UITableViewDataSource> {
    NSArray *_tableDataModel;
    id _serverData;
}

@property (nonatomic, readonly) UITableView *table;

@property (nonatomic, readonly) NSArray *tableDataModel;

@property (nonatomic, readonly) id serverData;

- (instancetype)initWithTable:(UITableView *)table;

/**
    need override, provide tableDataModel
 */
- (void)build;

@end

NS_ASSUME_NONNULL_END
