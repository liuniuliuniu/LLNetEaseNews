//
//  NewsModel.h
//  LL网易新闻
//
//  Created by liushaohua on 16/10/1.
//  Copyright © 2016年 liushaohua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject


@property (nonatomic, copy)NSString *imgsrc;


@property (nonatomic, assign)NSNumber *replyCount;


@property (nonatomic, copy)NSString *source;


@property (nonatomic, copy)NSString *title;


@property (nonatomic, assign)BOOL imgType;


@property (strong, nonatomic) NSArray *imgextra;



@end



/*
	{
	url_3w = http://sports.163.com/16/1001/05/C292SM8N0005877U.html;
	digest = 网易体育10月1日报道：新赛季的训练营已经开始，但由于迟迟没能和骑士谈拢续约事宜，JR-史密斯没能出现在骑士训练场上。对此骑士核心勒布朗公开发声，要求骑士续约J;
	ltitle = 詹皇终发话要求骑士续约JR:不想让去年场景重演;
	subtitle = ;
	imgsrc = http://cms-bucket.nosdn.127.net/e26b9ea2101944d3b13b88bf9fe1abaa20161001050306.jpeg;
	url = http://3g.163.com/sports/16/1001/05/C292SM8N0005877U.html;
	postid = C292SM8N0005877U;
	source = 网易体育;
	title = 詹皇终发话要求骑士续约JR:不想让去年场景重演;
	priority = 110;
	votecount = 2226;
	lmodify = 2016-10-01 05:07:36;
	docid = C292SM8N0005877U;
	boardid = sports2_bbs;
	ptime = 2016-10-01 05:02:51;
	replyCount = 2415;
 }
 );
 
 */
