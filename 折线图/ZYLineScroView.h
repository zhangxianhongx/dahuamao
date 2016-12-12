//
//  ZYLineScroView.h
//  折线图
//
//  Created by ybon on 2016/12/10.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYLineScroView : UIScrollView


//x比例 10:1
@property (nonatomic, strong) NSString *xPropoertion;
//y比例 10:1
@property (nonatomic, strong) NSString *yPropoertion;
//x数据
@property (nonatomic, strong) NSArray *xArray;
//y数据
@property (nonatomic, strong) NSArray *yArray;

@end
