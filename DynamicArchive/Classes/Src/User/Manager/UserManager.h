//
//  UserManager.h
//  DynamicArchive
//
//  Created by Jn_Kindle on 2018/8/14.
//  Copyright © 2018年 JnKindle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserManager : NSObject

/**
 单例
 
 @return return value description
 */
+ (instancetype)manager;

/**
 初始化用户信息
 */
- (void)initUserInfo;


/**
 退出登录
 */
-(void)logOut;

/**
 是否登录
 */
@property (nonatomic,assign,readonly) BOOL isLogin;

/**
 用户信息
 */
@property (nonatomic,strong) UserModel * userModel;

@end
