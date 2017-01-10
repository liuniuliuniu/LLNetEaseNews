//
//  HomeCell.m
//  LL网易新闻
//
//  Created by liushaohua on 16/9/30.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "HomeCell.h"
#import "NewsController.h"

@implementation HomeCell{

//    成员变量
    NewsController *_newVC;
    
}

- (void)awakeFromNib
{
//    [super awakeFromNib];
    
    //     要是控制器关联着stroyboard 要用加载stroyboard的方式加载控制器

    UIStoryboard *news = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    _newVC = [news instantiateInitialViewController];
    
    _newVC.tableView.frame = self.contentView.bounds;
    
    [self.contentView addSubview:_newVC.tableView];
    
//    _newVC.tableView.backgroundColor =
//    [UIColor colorWithRed:((float)arc4random_uniform(256)/255.0) green:((float)arc4random_uniform(256)/255.0) blue:((float)arc4random_uniform(256)/255.0) alpha:1.0];
//    
}


#pragma mark - 将URLstring传给新闻控制器
- (void)setURLString:(NSString *)URLString
{
    _URLString = URLString;
    
    _newVC.URLString = URLString;

}





@end
