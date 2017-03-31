//
//  MyCell.h
//  test12
//
//  Created by fuchaowen on 14-1-14.
//  Copyright (c) 2014年 付超汶. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"

/*--------------------------------------------------------------------------------------------
 *MyCell : BaseCell (继承于BaseCell的子类)
 *这是一个子类化的自定义cell,在相同的继承于BaseCell的子类中需要重写指派初始化方法完成可见控件的定制工作,
 *以及一些需要的数据的初始化工作.当自定义的可见控件需要lazyLoading时,需要重写相对应属性的getter方法,
 *以完成可见控件的加载!该相同的子类中需要重写父类(dataForCell属性)的setter方法,实现子类定制内容的差异化!
 *该相同关系的子类还应该重写继承于父类的+(CGFloat)cellHeightForModel:(BaseModel *)dataForCell
 *方法,当tableView询问该类,给定一个指定的数据模型,返回一个对应的单元高度值(该单元高度值应该跟随数据内容的多少变化)
 *----------------------------------------------------------------------------------------------*/
@interface MyCell : BaseCell

@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *phoneLabel;
@property (nonatomic, retain) UIImageView *userImageView;

@end
