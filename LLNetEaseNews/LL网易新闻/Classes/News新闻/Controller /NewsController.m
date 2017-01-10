//
//  NewsController.m
//  LL网易新闻
//
//  Created by liushaohua on 16/9/30.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "NewsController.h"
#import "NetWorkTool.h"
#import "NewsModel.h"
#import "YYModel.h"

#import "NewsCell.h"

@interface NewsController ()

@end

@implementation NewsController{

    NSArray<NewsModel *> *_newsList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)setURLString:(NSString *)URLString
{
    _URLString = URLString;
    [self loadNewsData];
}

- (void)loadNewsData
{

    NetWorkTool *netWorkTool = [NetWorkTool sharedNetWorkTool];
    
    [netWorkTool GetWithUrlString:self.URLString success:^(NSDictionary * response) {
#warning mark -  动态的获取字典的第一个key
        NSString *key = response.keyEnumerator.nextObject;
        
        NSArray *arrDict = response[key];
        
        _newsList = [NSArray yy_modelArrayWithClass:[NewsModel class] json:arrDict];
//        刷新界面  否则有些界面显示不出来
        [self.tableView reloadData];
        
    } faile:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *Identifier;
    NewsModel *model = _newsList[indexPath.item];
    
    if (model.imgType) {
        
        Identifier = @"BigCell";
    }else if (model.imgextra.count == 2){
    
        Identifier = @"ImagesCell";
    }
    else
    {
      Identifier = @"BaseCell";
    }
   
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    
    cell.news = model;
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    
    NewsModel *model = _newsList[indexPath.item];
    
    if (model.imgType) {
        height = 180;
    }else if (model.imgextra.count == 2){
    
        height = 150;
    }
    else
    {
        height = 90;
    }
    return height;
}


@end
