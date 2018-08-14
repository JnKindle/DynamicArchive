//
//  LoginController.m
//  DynamicArchive
//
//  Created by Jn_Kindle on 2018/8/14.
//  Copyright © 2018年 JnKindle. All rights reserved.
//

#import "LoginController.h"


@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)login
{
    //调用接口登录，登陆成功后，进行数据赋值
    
    
    NSDictionary *loginDic = @{}; //登录成功返回的数据
    
    UserModel *model = [[UserModel alloc]init];
    [model setValuesForKeysWithDictionary:loginDic];
    model.isLogin = [NSNumber numberWithBool:YES];
    [UserManager manager].userModel = model;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}




@end
