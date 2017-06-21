//
//  UItableviewTableViewController.m
//  LL网易新闻
//
//  Created by 大影象科技 on 2017/2/7.
//  Copyright © 2017年 liushaohua. All rights reserved.
//

#import "UItableviewTableViewController.h"
#import "ViewController.h"


static NSString *cellID = @"cellID";
@interface UItableviewTableViewController ()

@end

@implementation UItableviewTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    ViewController *vc = [[ViewController alloc]init];
    
    [self addChildViewController:vc];
    
    vc.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 600);
    
    self.tableView.tableFooterView = vc.view;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    
    return cell;

}




@end
