//
//  LoginViewController.m
//  CustomConfigIOS
//
//  Created by apple on 16/1/4.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tbUname;
@property (weak, nonatomic) IBOutlet UITextField *tbPwd;

@end

@implementation LoginViewController
- (IBAction)btnLogin:(id)sender {
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[@"uname"]=self.tbUname.text;
    dic[@"pwd"]=self.tbPwd.text;
    
    [manager POST:GLLoadLoginURL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if(responseObject)
        {
            UserInfo *userinfo=[UserInfo mj_objectWithKeyValues:responseObject];
            
            [Helper WriteAccount:userinfo];
            
            [UIApplication sharedApplication].keyWindow.rootViewController=[AppDelegate globalDelegate].MainTab;
        }
        else {
            UIAlertController *alert=[Helper AlertWithTitle:@"错误" Content:@"用户名密码错误"];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertController *alert=[Helper AlertWithTitle:@"错误" Content:@"网络连接失败"];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}



@end
