//
//  ChannelModel.m
//  LL网易新闻
//
//  Created by liushaohua on 16/9/30.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "ChannelModel.h"
#import "YYModel.h"

@implementation ChannelModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+ (NSArray *)channels
{
//    加载json数据
    NSString *jsonPath  = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
//    反序列化
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    NSArray *tListArr = jsonDict[@"tList"];
    
    NSMutableArray *channelArrM = [NSMutableArray arrayWithCapacity:tListArr.count];
    

    [tListArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        ChannelModel *model = [[ChannelModel alloc]init];
        
        [model setValuesForKeysWithDictionary:obj];
        
        [channelArrM addObject:model];
    }];
    
//    将数组里边重新排序
   
    [channelArrM sortUsingComparator:^NSComparisonResult(ChannelModel *   obj1, ChannelModel * obj2) {
      
        return [obj1.tid compare:obj2.tid];
    }];
    
    return channelArrM.copy;

}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@---%@",_tid,_tname];
}





@end


