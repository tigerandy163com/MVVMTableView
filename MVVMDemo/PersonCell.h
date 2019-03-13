//
//  TableViewCell.h
//  MVVMDemo
//
//  Created by mm-cy on 2018/3/9.
//  Copyright © 2018年 mm-cy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReusableCellProtocols.h"
#import "PersonCellModel.h"

@protocol PersonCellDelegate;

@interface PersonCell : UITableViewCell<ReusableCell>

@property (nonatomic) id<PersonCellDelegate> delegate;

@property (nonatomic) PersonCellModel *cellModel;

@end

@protocol PersonCellDelegate<NSObject>

- (void)zanFromCell:(PersonCell *)cell;

@end
