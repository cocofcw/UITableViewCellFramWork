//
//  UserInfo.h

//
//  Created by fuchaowen on 14-1-13.
//  Copyright (c) 2014年 付超汶. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

/*------------------------------------------------
 *UserInfo : BaseModel (继承于BaseModel的子类)
 *这是一个子类化的数据模型,在相同的子类中我们完成我们需要的
 *数据封装,该子类的一个实例对象对应于tableView的一个的cell单元
 *-----------------------------------------------------*/
@interface UserInfo : BaseModel

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *phoneNumber;
@property (nonatomic, copy)NSString *imagePath;

//指派初始化方法
-(instancetype)initWithName:(NSString *)name
                phoneNumber:(NSString *)phoneNumber
                  imagePath:(NSString *)imagePaht;
//便利构造器
+(instancetype)userInfoWithName:(NSString *)name
                    phoneNumber:(NSString *)phoneNumber
                      imagePath:(NSString *)imagePaht;
//实例方法,返回对象图片
-(UIImage *)userImage;
@end
