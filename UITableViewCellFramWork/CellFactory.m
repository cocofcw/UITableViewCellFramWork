//
//  CellFactory.m
//  test12
//
//  Created by fuchaowen on 14-1-14.
//  Copyright (c) 2014年 付超汶. All rights reserved.
//

#import "CellFactory.h"
#import "BaseCell.h"
#import "BaseModel.h"
/*-----------------------------------
 *引入用到的自定义cell子类型的头文件,以及
 *子类化的数据模型的头文件
 *----------------------------------*/
#import "UserInfo.h"
#import "MyCell.h"

@implementation CellFactory

+ (BaseCell *)cellForModel:(BaseModel *)modelForCell reuseabledIdentifier:(NSString *)cellIdentifier
{
    //获得数据模型相对应的cell子类
    Class cellClass = [self cellClassForModel:modelForCell];
    
    //用子类对象初始化父类指针
    BaseCell *cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    return cell ;
}

/*-----------------------------------------------------------------
 *类方法,通过给定一个子类化的数据模型,返回该数据模型相对应的cell子类型
 *项目中应该把需要使用到得自定义cell子类型关联到该方法中
 *------------------------------------------------------------------*/
+(Class)cellClassForModel:(BaseModel *)dataModel
{
    Class cellClass = Nil;
    
    if ([dataModel isKindOfClass:[UserInfo class]])
    {
        cellClass = [MyCell class];
    }

    return cellClass;
}
@end
