//
//  ViewModelManager.m
//  MVVMDemo
//
//  Created by mm-cy on 2018/3/9.
//  Copyright © 2018年 mm-cy. All rights reserved.
//

#import "MyViewModel.h"
#import "RawModel.h"
#import "PersonCellModel.h"
#import "SectionModel.h"
#import "PersonCell.h"

@implementation MyViewModel

- (instancetype)initWithTable:(UITableView *)table {
    self = [super initWithTable:table];
    [self.table registerNib:[UINib nibWithNibName:@"PersonCell" bundle:nil]  forCellReuseIdentifier:[PersonCell reusableCellIdentifier]];

    return self;
}

- (void)build {
    _serverData = [self fetchData];
    _tableDataModel = [self buildData:_serverData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)zanFromCell:(PersonCell *)cell {
    cell.cellModel.zan = !cell.cellModel.zan;
    [self.table reloadData];
}

- (NSArray *)fetchDataFromNetApi {
    //Api return raw data, maybe it is a JsonString, convert it to JsonObject
    
    /*mock data*/
    NSMutableArray *ret = [NSMutableArray array];
    
    NSDictionary *dic = @{@"name":@"myName_0",
                          @"age":@(10),
                          @"avatarUrl":@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3699219497,1413039697&fm=27&gp=0.jpg",
                          @"other":@"jj"};
    [ret addObject:dic];
    
    dic = @{@"name":@"myName_1",
            @"age":@(20),
            @"avatarUrl":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1520600902042&di=29fb1d3471433abc158e03ad96b68714&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F4034970a304e251fc577b1c2a086c9177f3e5303.jpg"
            ,@"other":@"aabb"};
    [ret addObject:dic];
    
    return ret;
}


- (NSArray *)fetchData {
    NSArray *data = [self fetchDataFromNetApi];
    NSMutableArray *ret = [NSMutableArray array];
    for (NSDictionary *dic in data) {
        RawModel *model = [RawModel new];
        model.name = dic[@"name"];
        model.age = [dic[@"age"] integerValue];
        model.avatarUrl = dic[@"avatarUrl"];
        model.otherData = dic[@"other"];
        [ret addObject:model];
    }
    return ret;
}

- (NSArray *)buildData:(NSArray *)data {
    NSMutableArray *arr = [NSMutableArray array];
    /*
     process raw model to view model
     **/
    for (RawModel *model in data) {
        PersonCellModel *aviewModel = [PersonCellModel new];
        aviewModel.text_0 = model.name;
        aviewModel.text_1 = [NSString stringWithFormat:@"my age is %zd", model.age];
        aviewModel.img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.avatarUrl]]];
        aviewModel.height = 104; //这里计算好Cell的高度
        [arr addObject:aviewModel];
    }
    SectionModel *section = [SectionModel new];
    section.cells = arr;
    return @[section];
}

@end
