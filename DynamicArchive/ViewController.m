//
//  ViewController.m
//  DynamicArchive
//
//  Created by Jn_Kindle on 2018/8/13.
//  Copyright © 2018年 JnKindle. All rights reserved.
//

#import "ViewController.h"

#import "LoginController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}



/**
 检查登录
 */
- (void)checkLogin
{
    if (![UserManager manager].isLogin) {
        //未登录
        LoginController *vc = [[LoginController alloc] init];;
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        [self.navigationController presentViewController:navi animated:YES completion:nil];
    }
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}


@end
