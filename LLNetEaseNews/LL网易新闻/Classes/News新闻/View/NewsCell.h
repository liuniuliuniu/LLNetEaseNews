//
//  NewsCell.h
//  LL网易新闻
//
//  Created by liushaohua on 16/10/1.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <UIKit/UIKit.h>


@class NewsModel;
@interface NewsCell : UITableViewCell


@property (nonatomic, strong)NewsModel *news;


@end
/*
 //图片
 @property (nonatomic, copy)NSString *imgsrc;
 
 //回复量
 @property (nonatomic, assign)NSNumber *replyCount;
 
 //来源
 @property (nonatomic, copy)NSString *source;
 
 //标题
 @property (nonatomic, copy)NSString *title;
 
 

 */
