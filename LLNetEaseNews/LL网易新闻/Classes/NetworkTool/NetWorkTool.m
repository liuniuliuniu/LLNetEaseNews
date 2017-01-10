//
//  NetWorkTool.m
//  LL网易新闻
//
//  Created by liushaohua on 16/10/1.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "NetWorkTool.h"


@implementation NetWorkTool
// 全区的访问点
+ (instancetype)sharedNetWorkTool
{
    static NetWorkTool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
//        相对路径
        NSURL *baseUrl = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
    
        instance = [[self alloc]initWithBaseURL:baseUrl];
//        让AFN支持其他格式
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        
    });
    return instance;
}

- (void)GetWithUrlString:(NSString *)UrlStr success:(void (^)(id))success faile:(void (^)(NSError *))faile{
    
//    发送get请求
    
    [self GET:UrlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (faile) {
            faile(error);
        }
        
        
    }];
    
    
    
}
@end
