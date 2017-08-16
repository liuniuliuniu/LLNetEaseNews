//
//  ViewController.m
//  LL网易新闻
//
//  Created by liushaohua on 16/9/30.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "ChannelLable.h"
#import "ChannelModel.h"
#import "HomeCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *HomeCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *HomeCollectionFlowlayout;

@property (nonatomic, strong)NSArray *channelArr;

@property (nonatomic, strong)NSMutableArray *channelLables;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;

    [self creatChannelLable];
   
}

- (void)viewDidAppear:(BOOL)animated
{
//    只有在此方法中拿到的HomeCollectionView 和宽度 是真实的
    [super viewDidAppear:animated];
    self.HomeCollectionFlowlayout.itemSize = self.HomeCollectionView.bounds.size;
}


- (void)creatChannelLable
{

    _channelArr = [ChannelModel channels];

    _channelLables = [NSMutableArray arrayWithCapacity:_channelArr.count];
    float lableW = 80;
    float lableH = self.channelScrollView.bounds.size.height;
    for (NSInteger i = 0; i <  _channelArr.count; i++) {
        ChannelLable *lable = [[ChannelLable alloc]init];

        lable.frame = CGRectMake(lableW * i, 0, lableW, lableH);
        [self.channelScrollView addSubview:lable];

        ChannelModel *model = _channelArr[i];
        lable.text = model.tname;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [lable addGestureRecognizer:tap];
        lable.userInteractionEnabled = YES;
        lable.tag = i;
        [_channelLables addObject:lable];

        if (i == 0) {
            lable.scale = 1.0;
        }
    }

    self.channelScrollView.contentSize = CGSizeMake(lableW * _channelArr.count, 0);
}



- (void)tapAction:(UITapGestureRecognizer *)sender
{

    ChannelLable *selectLable = (ChannelLable *)sender.view;
    float offsetX = selectLable.center.x - self.view.bounds.size.width * 0.5;
    
    float MinoffsetX = 0;
    float MaxoffsetX = self.channelScrollView.contentSize.width - self.view.bounds.size.width;
    
    if (offsetX < MinoffsetX) {
        
        offsetX = MinoffsetX;
    }else if (offsetX > MaxoffsetX)
    {
        offsetX = MaxoffsetX;
    }
    
    [self.channelScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:selectLable.tag inSection:0];
    
    [self.HomeCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    
    
    NSInteger index = selectLable.tag;
    

    for (NSInteger i = 0; i < _channelLables.count; i++) {

        ChannelLable *lable = _channelLables[i];
        
        if (index == i) {
            lable.scale  = 1.0;
        }else
        {
            lable.scale = 0.0;
        }
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index =scrollView.contentOffset.x/self.view.bounds.size.width;

    ChannelLable *selectLable = _channelLables[index];

    float offsetX = selectLable.center.x - self.view.bounds.size.width * 0.5;

    float MinoffsetX = 0;
    float MaxoffsetX = self.channelScrollView.contentSize.width - self.view.bounds.size.width;
    
    if (offsetX < MinoffsetX) {
        offsetX = MinoffsetX;
    }else if (offsetX > MaxoffsetX)
    {
        offsetX = MaxoffsetX;
    }
    [self.channelScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];

    
    for (NSInteger i = 0; i<_channelLables.count; i++) {
        ChannelLable *lable = _channelLables[i];
        if (index == i) {
            lable.scale = 1.0;
        }else
        {
            lable.scale = 0.0;
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    CGFloat offsetX = scrollView.contentOffset.x/self.view.bounds.size.width;

    NSInteger index_current = scrollView.contentOffset.x/self.view.bounds.size.width;

    CGFloat percent = offsetX - index_current;
    
    
    NSInteger index_left = index_current;

    NSInteger index_right = index_current + 1;

    CGFloat scale_right = percent;

    CGFloat scale_left= 1 - percent;
    
    ChannelLable *lable_left = _channelLables[index_left];
    lable_left.scale = scale_left;
    
    if (index_right < _channelLables.count) {
        
        ChannelLable *lable_right = _channelLables[index_right];
        lable_right.scale = scale_right;
    }

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _channelArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
    

    ChannelModel *model = _channelArr[indexPath.item];
    

    NSString *URLString = [NSString stringWithFormat:@"article/list/%@/0-20.html",model.tid];

    cell.URLString = URLString;
    
    return cell;


}







@end
