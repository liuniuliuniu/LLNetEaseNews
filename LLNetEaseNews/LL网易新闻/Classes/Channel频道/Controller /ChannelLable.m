//
//  ChannelLable.m
//  LL网易新闻
//
//  Created by liushaohua on 16/9/30.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "ChannelLable.h"

@implementation ChannelLable

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
     
        self.textAlignment = NSTextAlignmentCenter;
        
        self.font = [UIFont systemFontOfSize:16];
    }
    return self;

}


- (void)setScale:(float)scale
{
    _scale = scale;
//    通过缩放比例去控制颜色
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1.0];

//    最小和最大的缩放比例
    float MinScale = 1.0;
    float MaxScale = 1.5;
//            通过差值去求出新的缩放比例
     scale = MinScale + (MaxScale - MinScale)* scale;
    
    self.transform = CGAffineTransformMakeScale(scale, scale);
    

}






@end
