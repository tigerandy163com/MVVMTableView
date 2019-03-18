//
//  TableViewModel.m
//  MVVMDemo
//
//  Created by mm-cy on 2019/3/13.
//  Copyright © 2019 mm-cy. All rights reserved.
//

#import "TableViewModel.h"
#import "SectionModel.h"
#import "CellModel.h"

@interface TableViewModel ()

@property (nonatomic) NSArray *tableDataModel;

@property (nonatomic) id serverData;

@end

@implementation TableViewModel

- (instancetype)initWithTable:(UITableView *)table {
    self = [super init];
    if (self) {
        self.table = table;
    }
    return self;
}

- (void)setTable:(UITableView *)table {
    _table = table;
    _table.delegate = self;
    _table.dataSource = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.tableDataModel count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellModel * cellModel = [self cellModelAtIndexPath:indexPath];
    return cellModel.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SectionModel *sectionModel = [self.tableDataModel objectAtIndex:section];
    return sectionModel.cells.count;
}

-  (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CellModel * cellModel = [self cellModelAtIndexPath:indexPath];
    // 获取重用ID
    NSString *reuseId = nil;
    Class cls = [cellModel respondsToSelector:@selector(cellClass)] ? [cellModel cellClass] : nil;
    if (cls) {
        if([cls respondsToSelector:@selector(reusableCellIdentifier)]) {
            reuseId = [cls reusableCellIdentifier];
        } else {
            reuseId = NSStringFromClass(cls);
        }
    }
    UITableViewCell<ReusableCell> *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    [cell setCellModel:cellModel];
    if ([cell respondsToSelector:@selector(setDelegate:)]) {
        [cell setDelegate:self];
    }
    return cell;
}

- (CellModel *)cellModelAtIndexPath:(NSIndexPath *)indexPath {
    SectionModel *sectionModel = [self.tableDataModel objectAtIndex:indexPath.section];
    CellModel *cellModel = [sectionModel.cells objectAtIndex:indexPath.row];
    return cellModel;
}

/**
    need override
 */
- (void)build {
    
}

@end
