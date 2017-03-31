//
//  MyCell.m
//  test12
//
//  Created by fuchaowen on 14-1-14.
//  Copyright (c) 2014年 付超汶. All rights reserved.
//

#import "MyCell.h"
#import "UserInfo.h"
#import "BaseModel.h"

@implementation MyCell

/*-------------------------------------------------------------------------------
 *自定义cell的指派初始化方法,在该方法中应该完成自定义cell的初始化工作,
 *如果想实现自定义cell上控件的lazyLoading,则可视化的控件需要在对应属性的getter方法中获得.
 *可视化的控件一定要追加到cell上的contentView上,这样当单元编辑时,可见控制位置会跟着调整.
 *-------------------------------------------------------------------------------*/
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 30)];
        self.phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 200, 30)] ;
        self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(250, 10, 60, 60)];
        
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.phoneLabel];
        [self.contentView addSubview:self.userImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*-------------------------------------------------------------
 *重写父类(dataForCell属性)的setter方法,实现子类的差异化
 *-----------------------------------------------------------*/
- (void)setDataForCell:(BaseModel *)dataForCell
{
    //1.调用父类的setter方法,防止递归调用
    [super setDataForCell:dataForCell];

    //2.强制转换成相对应的子类化的数据模型
    UserInfo *userInfo = (UserInfo *)dataForCell;

    //3.把相对应的数据对象中的数据设置到子类化的cell属性中
    [self.nameLabel     setText:userInfo.name];
    [self.phoneLabel    setText:userInfo.phoneNumber];
    [self.userImageView setImage:userInfo.userImage];

}

/*------------------------------------------------------------
 *类方法,重写父类的方法,用以返回本类型的cell单元对应于数据模型的单元高度
 *当需要显示的数据内容不同时,应该根据内容调整单元的高度,如:微博应用,应该
 *根据微博文字信息内容的多少决定一个单元表格的高度
 *------------------------------------------------------------*/
+(CGFloat)cellHeightForModel:(BaseModel *)dataForCell
{
    return 80.0f;
}

@end
