//
//  NetWorkTool.h
//  LL网易新闻
//
//  Created by liushaohua on 16/10/1.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetWorkTool : AFHTTPSessionManager


//全区的访问点
+ (instancetype)sharedNetWorkTool;


- (void)GetWithUrlString:(NSString *)UrlStr success:(void(^)(id response))success faile:(void(^)(NSError *error))faile;




@end
