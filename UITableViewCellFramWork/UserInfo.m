//
//  UserInfo.m
//  test12
//
//  Created by fuchaowen on 14-1-13.
//  Copyright (c) 2014年 付超汶. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

/*---------------------------------
 *对象在被释放前,释放它所拥有的所有对象
 *--------------------------------*/


//指派初始化方法
-(instancetype)initWithName:(NSString *)name
                phoneNumber:(NSString *)phoneNumber
                  imagePath:(NSString *)imagePaht
{
    self = [super init];
    
    if (self)
    {
        [self setName:name];
        [self setPhoneNumber:phoneNumber];
        [self setImagePath:imagePaht];
    }
    return self;
}

//便利构造器
+(instancetype)userInfoWithName:(NSString *)name
                    phoneNumber:(NSString *)phoneNumber
                      imagePath:(NSString *)imagePaht
{
    UserInfo *userInfo = [[UserInfo alloc] initWithName:name phoneNumber:phoneNumber imagePath:imagePaht];
    
    return userInfo ;
}

//实例方法,返回对象图片
-(UIImage *)userImage
{
    UIImage *image = [UIImage imageWithContentsOfFile:_imagePath];
    return image;
}
@end
