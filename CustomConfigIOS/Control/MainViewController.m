//
//  MainViewController.m
//  CustomConfigIOS
//
//  Created by apple on 15/12/28.
//  Copyright © 2015年 Spoot Studio. All rights reserved.
//

#import "MainViewController.h"
#import "SettingViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"go" style:UIBarButtonItemStylePlain target:self action:@selector(go)];
    //修正table头被nav挡住问题,必加
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(void)go
{
    SettingViewController *nvc=[[SettingViewController alloc]init];
    [self.navigationController pushViewController:nvc animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text=@"111";
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
@end
