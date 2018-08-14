//
//  UserManager.m
//  DynamicArchive
//
//  Created by Jn_Kindle on 2018/8/14.
//  Copyright © 2018年 JnKindle. All rights reserved.
//

static NSString * const UserInfos = @"UserInfos";

#import "UserManager.h"

@implementation UserManager

+ (UserManager *)manager{
    static dispatch_once_t once = 0;
    static UserManager *sharedObject;
    dispatch_once(&once, ^{
        sharedObject = [[UserManager alloc] init];
    });
    return sharedObject;
}

//初始化用户信息
-(void)initUserInfo
{
    UserModel *model = [self getInitialUserInfosModel];
    self.userModel = model;
}


#pragma mark- Setter / Getter
/**
 是否登录
 
 @return return value description
 */
-(BOOL)isLogin
{
    UserModel *model = self.userModel;
    
    return [model.isLogin boolValue];
}



-(void)setUserModel:(UserModel *)userInfoModel
{
    //本地化用户信息
    [self saveUserInfos:userInfoModel];
    
}


-(UserModel *)userModel
{
    return [self getUserInfos];
}


-(void)logOut
{
    //清除用户信息
    //初始化数据
    UserModel *model = [self getInitialUserInfosModel];
    [self saveUserInfos:model];
}

#pragma mark - 用户数据操作
/**
 存储用户数据
 
 @param model model description
 */
- (void)saveUserInfos:(UserModel *)model
{
    NSLog(@"存储用户数据成功");
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:model];
    [GlobalFunction saveValue:encodedObject forKey:UserInfos];
}


/**
 获取用户数据
 
 @return return value description
 */
- (UserModel *)getUserInfos
{
    JNLog(@"读取用户数据成功");
    NSData *encodedObject = [GlobalFunction getValueForKey:UserInfos];
    if (encodedObject == nil) {
        UserModel *model = [self getInitialUserInfosModel];
        return model;
    }else {
        UserModel *model = [NSKeyedUnarchiver unarchiveObjectWithData: encodedObject];
        return model;
    }
}


/**
 获取用户初始化数据
 
 @return return value description
 */
- (UserModel *)getInitialUserInfosModel
{
    UserModel *model = [[UserModel alloc] init];
    //需要初始化的数据
    model.isLogin = [NSNumber numberWithBool:NO]; //初始设置为非登录
    return model;
}



@end
