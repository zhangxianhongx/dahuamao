//
//  YlineView.h
//  折线图
//
//  Created by ybon on 2016/12/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YlineView : UIView
//返回点的y坐标，用于确定视图上点的y轴的位置
@property (nonatomic, strong) NSMutableArray *yArray;

- (id)initWithFrame:(CGRect)frame withYpropertion:(NSString *)yp yArray:(NSArray *)yArray;

@end
