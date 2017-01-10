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

//频道分类 视图
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;
//新闻视图
@property (weak, nonatomic) IBOutlet UICollectionView *HomeCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *HomeCollectionFlowlayout;
//标签模型数组
@property (nonatomic, strong)NSArray *channelArr;

@property (nonatomic, strong)NSMutableArray *channelLables;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
    
    // iOS7.0的新特性 : 当UIScrollView及其子类(UITableView,UICollectionView...),自动布局时,是以nav为参考点时,滚动视图的"内容"会自动的向下偏移64个像素
//   不让滚动视图向下偏移64 个像素
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self creatChannelLable];
   
}
#pragma mark - 在此方法中设置collectionviewcell 的宽度
- (void)viewDidAppear:(BOOL)animated
{
//    只有在此方法中拿到的HomeCollectionView 和宽度 是真实的
    [super viewDidAppear:animated];
    
    self.HomeCollectionFlowlayout.itemSize = self.HomeCollectionView.bounds.size;

}

#pragma mark - 创建标签频道
- (void)creatChannelLable
{
//    拿到标签模型数组
    _channelArr = [ChannelModel channels];
//    实例化标签数组
    _channelLables = [NSMutableArray arrayWithCapacity:_channelArr.count];
    
    float lableW = 80;
    float lableH = self.channelScrollView.bounds.size.height;
    
    for (NSInteger i = 0; i <  _channelArr.count; i++) {
        
        ChannelLable *lable = [[ChannelLable alloc]init];
//    设置lable的位置
        lable.frame = CGRectMake(lableW * i, 0, lableW, lableH);
        [self.channelScrollView addSubview:lable];
//        为lable赋值
        ChannelModel *model = _channelArr[i];
        lable.text = model.tname;
        
#pragma mark - 为每一个lable添加点击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        
        [lable addGestureRecognizer:tap];
        lable.userInteractionEnabled = YES;
        lable.tag = i;
        
//        把标签都加到标签数组
        [_channelLables addObject:lable];
        
//       默认第一个 设置最大的缩放比例
        if (i == 0) {
            lable.scale = 1.0;
        }
        
    }
//一定要设置滚动范围
    self.channelScrollView.contentSize = CGSizeMake(lableW * _channelArr.count, 0);
    
    
}


#pragma mark - 点击的联动方法事件
- (void)tapAction:(UITapGestureRecognizer *)sender
{
//    拿到选中的lable  强转成lable
    ChannelLable *selectLable = (ChannelLable *)sender.view;
//    计算lable 的偏移量
    
    float offsetX = selectLable.center.x - self.view.bounds.size.width * 0.5;
    
    float MinoffsetX = 0;
    float MaxoffsetX = self.channelScrollView.contentSize.width - self.view.bounds.size.width;
    
    if (offsetX < MinoffsetX) {
        
        offsetX = MinoffsetX;
    }else if (offsetX > MaxoffsetX)
    {
        offsetX = MaxoffsetX;
    }
    
//   有动画的滚动到指定的位置
    [self.channelScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:selectLable.tag inSection:0];
    
    [self.HomeCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    
    
    NSInteger index = selectLable.tag;
    
//    把选中的标签设置成最大比  没选中的还原
    for (NSInteger i = 0; i < _channelLables.count; i++) {
//        每次都需要遍历所有的lable
        ChannelLable *lable = _channelLables[i];
        
        if (index == i) {
            lable.scale  = 1.0;
        }else
        {
            lable.scale = 0.0;
        }
    }
}
#pragma mark - 滚动collectionView的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index =scrollView.contentOffset.x/self.view.bounds.size.width;

    ChannelLable *selectLable = _channelLables[index];

    float offsetX = selectLable.center.x - self.view.bounds.size.width * 0.5;
    
//    CGFloat offsetX = selectLable.center.x - self.view.bounds.size.width * 0.5;
    
    
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
#pragma mark - 时刻在滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    获取滚动的偏移量
    CGFloat offsetX = scrollView.contentOffset.x/self.view.bounds.size.width;
//    获取滚动的索引
    NSInteger index_current = scrollView.contentOffset.x/self.view.bounds.size.width;

    CGFloat percent = offsetX - index_current;
    
    NSLog(@"%f---%zd ---%f",offsetX,index_current,percent);
//    左边标签索引
    NSInteger index_left = index_current;
//    右边标签的索引
    NSInteger index_right = index_current + 1;
//    右边边标签的缩放比例
    CGFloat scale_right = percent;
//    左边标签的缩放比例
    CGFloat scale_left= 1 - percent;
    
//    设置左边标签
    ChannelLable *lable_left = _channelLables[index_left];
    lable_left.scale = scale_left;
    
//    设置右边要进行 判断
    if (index_right < _channelLables.count) {
        
        ChannelLable *lable_right = _channelLables[index_right];
        lable_right.scale = scale_right;
    }

}


#pragma mark - 实现代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _channelArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
    
//    取出对应的模型
    ChannelModel *model = _channelArr[indexPath.item];
    
    
#warning mark - 为什么要拼接此路径
//    拼接路径
    NSString *URLString = [NSString stringWithFormat:@"article/list/%@/0-20.html",model.tid];
    // 把地址传递给谁
    cell.URLString = URLString;
    
    return cell;


}







@end
