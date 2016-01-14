//
//  BaseTableViewController.m
//  CustomConfigIOS
//
//  Created by apple on 16/1/6.
//  Copyright © 2016年 Spoot Studio. All rights reserved.
//

#import "BaseTableViewController.h"
#import "SettingViewController.h"
#import "TopImgView.h"
#import "ViewNewsViewController.h"
#import "News.h"

@interface BaseTableViewController ()<TopImgViewDelegate>
@property(nonatomic,strong) NSMutableArray *news;
@property(nonatomic,assign) NSInteger ps;
@end

@implementation BaseTableViewController

-(NSMutableArray *)news
{
    if(!_news)
    {
        _news=[NSMutableArray array];
    }
    return _news;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor=[UIColor grayColor];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"go" style:UIBarButtonItemStylePlain target:self action:@selector(go)];
    //修正table头被nav挡住问题,必加
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    [self LoadData];
    [self setupRefresh];
    
}
-(void)setupRefresh
{
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(LoadData)];
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
-(void)loadMoreData
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[@"uid"]=[Helper ReadAccount].name;
    dic[@"mode"]=[NSString stringWithFormat:@"%zd",self.newsmode];
    if(self.ps==0)
        self.ps=20;
    dic[@"ps"]=[NSString stringWithFormat:@"%zd",self.ps];
//    NSLog(@"%@",dic);
    [manager GET:GLGetNewsURL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *newdata=[News mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.news addObjectsFromArray:newdata];
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
        self.ps=self.ps+20;
//        NSLog(@"rows:%zd",self.news.count);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        [self.tableView.footer endRefreshing];
    }];
}
-(void)LoadData
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/html"];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[@"uid"]=[Helper ReadAccount].name;
    dic[@"mode"]=[NSString stringWithFormat:@"%zd",self.newsmode];
    dic[@"ps"]=[NSString stringWithFormat:@"%zd",0];
//    NSLog(@"%@",dic);
    [manager GET:GLGetNewsURL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *newdata=[News mj_objectArrayWithKeyValuesArray:responseObject];
        NSMutableArray *temparr=[NSMutableArray array];
        
        [temparr addObjectsFromArray:newdata];
        //        [temparr addObjectsFromArray:self.news];
        
        self.news=temparr;
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
        //        self.ps=self.ps+20;
//        NSLog(@"rows:%zd",self.news.count);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        [self.tableView.header endRefreshing];
    }];
    
}

-(void)go
{
    SettingViewController *nvc=[[SettingViewController alloc]init];
    [self.navigationController pushViewController:nvc animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(self.ShowNewsImg)
        return 2;
    else
        return 1;
}

-(void)didClickImg:(ImagePlayerView *)sender newsid:(NSInteger)nid
{
    NSLog(@"nid:%zd",nid);
    ViewNewsViewController *viewnews=[[ViewNewsViewController alloc]init];
    viewnews.nid=nid;
    
    [self.navigationController pushViewController:viewnews animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0 && self.ShowNewsImg) {
        UITableViewCell *cell001 = [tableView dequeueReusableCellWithIdentifier:@"cell001"];
        if (cell001 == nil) {
            cell001 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell001"];
            cell001.selectionStyle = UITableViewCellSelectionStyleNone;
            UIView *view=[[UIView alloc]init];
            
            TopImgView *tv=[[[NSBundle mainBundle] loadNibNamed:@"TopImgView" owner:self options:nil] lastObject];
            tv.delegate=self;
            
            
            [view addSubview:tv];
            
            view.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 500);
            [cell001 addSubview:view];
            
            NSLog(@"hcell");
            NSLog(@"userid:%d",[[Helper ReadAccount]._id intValue]);
        }
        return cell001;
    }
    else
    {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"name"];
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"name"];
        }
        News *data=self.news[indexPath.row];
        cell.textLabel.text=data.title;
        cell.detailTextLabel.text=data.postdate;
        return cell;
    }
    
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    News *data=self.news[indexPath.row];
    ViewNewsViewController *viewnews=[[ViewNewsViewController alloc]init];
    viewnews.news=data;
    
    [self.navigationController pushViewController:viewnews animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0 && self.ShowNewsImg)
        return 200;
    else
        return 45;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==0)
        return 0;
    else
        return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0 && self.ShowNewsImg) {
        return 1;
    }
    else
    {
        return self.news.count;
    }
}


@end
