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


    NewsController *_newVC;
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    UIStoryboard *news = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    _newVC = [news instantiateInitialViewController];
    
    _newVC.tableView.frame = self.contentView.bounds;
    
    [self.contentView addSubview:_newVC.tableView];
}


- (void)setURLString:(NSString *)URLString
{
    _URLString = URLString;
    
    _newVC.URLString = URLString;

}





@end
