//
//  NewsModel.m
//  LL网易新闻
//
//  Created by liushaohua on 16/10/1.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@---%@---%@",_title,_source,_replyCount];

}

@end
