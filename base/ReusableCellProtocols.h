//
//  ReusableCellModel.h


#import <UIKit/UIKit.h>

@protocol ReusableCellModel <NSObject>
@optional
- (Class)cellClass; /** 视图绑定 */
@end

@protocol ReusableCell <NSObject>

@required
+ (NSString *)reusableCellIdentifier;
+ (CGFloat)cellHeight:(id<ReusableCellModel>)cellModel;

@optional
- (void)setCellModel:(id<ReusableCellModel>)cellModel;
- (void)setDelegate:(id)delegate;
- (id)delegate;

@end
