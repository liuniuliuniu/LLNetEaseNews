//
//  ChannelModel.h
//  LL网易新闻
//
//  Created by liushaohua on 16/9/30.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

//用于区别频道标签的对应的新闻内容  将来用来拼接url
@property (nonatomic, copy)NSString *tid;


@property (nonatomic, copy)NSString *tname;



//通过此方法 获取频道标签的数组
+ (NSArray *)channels;



@end

/*
 {
 "tList": [
 {
 "template": "manual",
 "topicid": "00040BGE",
 "hasCover": false,
 "alias": "The Truth",
 "subnum": "6.8万",
 "tag": "hot",
 "recommendOrder": 0,
 "isNew": 0,
 "img": "http://img2.cache.netease.com/m/newsapp/banner/zhenhua.png",
 "isHot": 1,
 "hasIcon": true,
 "cid": "C1348654575297",
 "recommend": "0",
 "headLine": false,
 "tagDate": "2015-06-16 10:45:34.0",
 "color": "",
 "bannerOrder": 105,
 "tname": "原创",
 "ename": "zhenhua",
 "showType": "comment",
 "special": 0,
 "tid": "T1370583240249"
 },
 
 */