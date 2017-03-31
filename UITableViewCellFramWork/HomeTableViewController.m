//
//  HomeTableViewController.m
//  UITableViewCellFramWork
//
//  Created by fuchaowen on 14-1-14.
//  Copyright (c) 2014年 付超汶. All rights reserved.
//

#import "HomeTableViewController.h"
#import "UserInfo.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

//重写父类封装数据源的方法,实现不同表视图控制器的差异化.
-(NSMutableArray *)hardCode
{
    UserInfo *u1 = [UserInfo userInfoWithName:@"robin"    phoneNumber:@"1" imagePath:nil];
    
    UserInfo *u3 = [UserInfo userInfoWithName:@"sogeking" phoneNumber:@"3" imagePath:nil];
    
    UserInfo *u5 = [UserInfo userInfoWithName:@"nami"     phoneNumber:@"5" imagePath:nil];
    
    UserInfo *u7 = [UserInfo userInfoWithName:@"chopper"  phoneNumber:@"7" imagePath:nil];
    
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:u1,  u3,  u5,  u7,  nil];
    
    int i = 1;
    for (UserInfo *user in array)
    {
        NSString *imageName = [NSString stringWithFormat:@"h%d",i++];
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpeg"];
        [user setImagePath:imagePath];
    }
    
    return array ;
    
}

@end
