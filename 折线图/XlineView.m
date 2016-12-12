//
//  XlineView.m
//  折线图
//
//  Created by ybon on 2016/12/12.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "XlineView.h"

@implementation XlineView

- (id)initWithFrame:(CGRect)frame withXpropertion:(NSString *)xp xArray:(NSArray *)xArray{
    if (self = [super initWithFrame:frame]) {
        
        [self getViewBoundsWithxp:xp xArray:xArray];
        
    }
    
    return self;
}


- (void)getViewBoundsWithxp:(NSString *)xp xArray:(NSArray *)xArray{
    _xArray = [[NSMutableArray alloc] init];
    NSArray *xpArray = [xp componentsSeparatedByString:@":"];
    float width = [xArray.lastObject floatValue]/[xpArray.firstObject floatValue] * [xpArray.lastObject floatValue];
    width = width+28;
    self.frame = CGRectMake(18, 0, width, 20);
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 2, width, 2)];
    lineView.backgroundColor = [UIColor blackColor];
    [self addSubview:lineView];
    //创建竖线和lable
    for (int i = 0; i < xArray.count; i ++) {
        float x = [xArray[i] floatValue];
        UIView *sVIew = [[UIView alloc] initWithFrame:CGRectMake(x/[xpArray.firstObject floatValue] * [xpArray.lastObject floatValue], 0, 1, 2)];
        sVIew.backgroundColor = [UIColor blackColor];
        [self addSubview:sVIew];
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width/xArray.count, 16)];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.text = xArray[i];
        textLabel.center = CGPointMake(sVIew.center.x, 12);
        [self addSubview:textLabel];
        [_xArray addObject:[NSString stringWithFormat:@"%.2f",sVIew.center.x]];
    }

}


@end
