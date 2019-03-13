//
//  ViewController.m
//  MVVMDemo
//
//  Created by mm-cy on 2018/3/9.
//  Copyright © 2018年 mm-cy. All rights reserved.
//

#import "ViewController.h"
#import "MyViewModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) MyViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.viewModel = [[MyViewModel alloc] initWithTable:self.tableView];
    [self reload];
}

- (void)reload {
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        [self.viewModel build];
        dispatch_async(dispatch_get_main_queue(),^{
            [self.tableView reloadData];
        });
    });
}

@end
