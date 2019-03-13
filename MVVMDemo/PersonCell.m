//
//  TableViewCell.m
//  MVVMDemo
//
//  Created by mm-cy on 2018/3/9.
//  Copyright © 2018年 mm-cy. All rights reserved.
//

#import "PersonCell.h"

@interface PersonCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UIButton *zanButton;

@end
@implementation PersonCell

+ (NSString *)reusableCellIdentifier {
    return @"myCell";
}

+ (CGFloat)cellHeight:(CellModel *)cellModel {
    return cellModel.height;
}
 
- (void)setCellModel:(id<ReusableCellModel>)cellModel {
    PersonCellModel *model = (PersonCellModel *)cellModel;
    _cellModel = model;
    self.nameLabel.text = _cellModel.text_0;
    self.ageLabel.text = _cellModel.text_1;
    self.avatar.image = _cellModel.img;
    self.zanButton.selected = _cellModel.zan;
}

- (IBAction)zanAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(zanFromCell:)]) {
        [self.delegate zanFromCell:self];
    }
}

@end
