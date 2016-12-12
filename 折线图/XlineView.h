//
//  XlineView.h
//  折线图
//
//  Created by ybon on 2016/12/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XlineView : UIView
//返回点的x坐标，用于确定视图上点的x轴的位置
@property (nonatomic, strong) NSMutableArray *xArray;

- (id)initWithFrame:(CGRect)frame withXpropertion:(NSString *)xp xArray:(NSArray *)xArray;

@end
