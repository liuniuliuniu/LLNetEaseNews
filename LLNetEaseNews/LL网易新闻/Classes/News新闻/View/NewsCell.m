//
//  NewsCell.m
//  LL网易新闻
//
//  Created by liushaohua on 16/10/1.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "NewsCell.h"
#import <UIImageView+WebCache.h>
#import "NewsModel.h"

@interface NewsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgsrcView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *sourceLable;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;
@property (nonatomic, strong)IBOutletCollection(UIImageView)NSArray *imgsrcViews;

@end

@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setNews:(NewsModel *)news
{
    _news = news;
    [self.imgsrcView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    self.titleLable.text = news.title;
    self.sourceLable.text = news.source;
    self.replyCount.text = [news.replyCount description];
    if (self.imgsrcViews.count == 2) {
        
        for (int i = 0; i < _imgsrcViews.count; i++) {
            
            UIImageView *imgV = _imgsrcViews[i];
            NSDictionary *imgDict = news.imgextra[i];
            
            NSString *imgSrc = imgDict[@"imgsrc"];
            
            [imgV sd_setImageWithURL:[NSURL URLWithString:imgSrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
        }
    }

}



@end
