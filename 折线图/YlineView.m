//
//  YlineView.m
//  折线图
//
//  Created by ybon on 2016/12/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "YlineView.h"

@implementation YlineView

- (id)initWithFrame:(CGRect)frame withYpropertion:(NSString *)yp yArray:(NSArray *)yArray{
    if (self = [super initWithFrame:frame]) {
        [self getViewBoundsWithyp:yp yArray:yArray];
        
    }
    
    return self;
}


//计算视图的宽高
- (void)getViewBoundsWithyp:(NSString *)yp yArray:(NSArray *)yArray{
    _yArray = [[NSMutableArray alloc] init];
    NSArray *ypArray = [yp componentsSeparatedByString:@":"];
    float height = [yArray.lastObject floatValue]/[yArray.firstObject floatValue] * [ypArray.lastObject floatValue];
    height = height+26;
    self.frame = CGRectMake(0, -16, 20, height);
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(16, 0, 2, height)];
    lineView.backgroundColor = [UIColor blackColor];
    [self addSubview:lineView];
    //创建竖线和lable
    for (int i = 0; i < yArray.count; i ++) {
        float y = [yArray[i] floatValue];
        UIView *sVIew = [[UIView alloc] initWithFrame:CGRectMake(18,height - y/[ypArray.firstObject floatValue] * [ypArray.lastObject floatValue], 2, 1)];
        sVIew.backgroundColor = [UIColor blackColor];
        [self addSubview:sVIew];
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 16,height/yArray.count)];
        textLabel.numberOfLines = 0;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.text = yArray[i];
        textLabel.center = CGPointMake(8, sVIew.center.y);
        [self addSubview:textLabel];
        [_yArray addObject:[NSString stringWithFormat:@"%.2f",sVIew.center.y]];
    }
    
    
}

@end
