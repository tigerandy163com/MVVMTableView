//
//  ViewModel.h
//  MVVMDemo
//
//  Created by mm-cy on 2018/3/9.
//  Copyright © 2018年 mm-cy. All rights reserved.
//
#import "ReusableCellProtocols.h"

@interface CellModel : NSObject<ReusableCellModel>

@property (nonatomic) CGFloat height;

@end
