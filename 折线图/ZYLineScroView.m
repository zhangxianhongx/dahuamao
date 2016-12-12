//
//  ZYLineScroView.m
//  折线图
//
//  Created by ybon on 2016/12/10.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "ZYLineScroView.h"
#import "XlineView.h"
#import "YlineView.h"
@implementation ZYLineScroView
{
    
    NSMutableArray *pointArray;
}

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    
    return self;
}

- (void)setXPropoertion:(NSString *)xPropoertion{
    _xPropoertion = xPropoertion;
    if (_xArray == nil) {
        return;
    }
    [self creatXlineView];
}
- (void)setYPropoertion:(NSString *)yPropoertion{
    _yPropoertion = yPropoertion;
    if (_yArray == nil) {
        return;
    }
    [self creatYlineView];

}
- (void)setXArray:(NSArray *)xArray{
    _xArray = xArray;
    if (_xPropoertion == nil) {
        return;
    }
    [self creatXlineView];

}
- (void)setYArray:(NSArray *)yArray{
    _yArray = yArray;
    if (_yPropoertion == nil) {
        return;
    }
    [self creatYlineView];

}

//xlineview
- (void)creatXlineView{
    XlineView *xv = [[XlineView alloc] initWithFrame:CGRectMake(0, 0, 20, 0) withXpropertion:_xPropoertion xArray:_xArray];
    [self addSubview:xv];
    xv.tag = 2001;
    self.contentSize = CGSizeMake(xv.bounds.size.width, self.contentSize.height);
    if ([self viewWithTag:2002]) {
        
        [self creatPointAndLine];
    }
}
//ylineview
- (void)creatYlineView{
    YlineView *yv = [[YlineView alloc] initWithFrame:CGRectMake(20, 0, 20, 0) withYpropertion:_yPropoertion yArray:_yArray];
    [self addSubview:yv];
    yv.tag = 2002;
    self.contentSize = CGSizeMake(self.contentSize.width, yv.bounds.size.height);
    if ([self viewWithTag:2001]) {
        
        [self creatPointAndLine];
    }

}

- (void)layoutSubviews{
    [super layoutSubviews];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *xv = [self viewWithTag:2001];
        xv.frame = CGRectMake(xv.frame.origin.x, self.contentSize.height-20, xv.bounds.size.width, 20);

    });
}

//画点 划线
- (void)creatPointAndLine{
    if (_yArray.count != _xArray.count) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"x和y的数组不一致" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    XlineView *xView = [self viewWithTag:2001];
    YlineView *yview = [self viewWithTag:2002];
    pointArray = [[NSMutableArray alloc] init];
    //画点
    for (int i = 0; i < _yArray.count; i ++) {
        float x = [xView.xArray[i] floatValue] + xView.frame.origin.x;
        float y = [yview.yArray[i] floatValue] + yview.frame.origin.y;
        
        UIView *pointView = [[UIView alloc] initWithFrame:CGRectMake(x, y, 4, 4)];
        pointView.center = CGPointMake(x, y);
        pointView.backgroundColor = [UIColor blackColor];
        pointView.layer.cornerRadius = 2;
        pointView.layer.masksToBounds = YES;
        [self addSubview:pointView];
        [pointArray addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
    }
    [self setNeedsDisplay];
    
    
    
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    XlineView *xView = [self viewWithTag:2001];
    YlineView *yview = [self viewWithTag:2002];
    CGPoint p1;
    CGPoint p2;
    for (int i = 0; i < pointArray.count; i ++) {
        
        p2 = [pointArray[i] CGPointValue];
        
        if (i == 0) {
            p1 = CGPointMake(xView.frame.origin.x,yview.bounds.size.height+yview.frame.origin.y);
        }else{
            p1 = [pointArray[i - 1] CGPointValue];
        }
        //获取当前上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        //移动某一点
        CGContextMoveToPoint(context, p1.x, p1.y);
        //移动某一点到某一点，绘制一条线
        CGContextAddLineToPoint(context, p2.x, p2.y);
        CGContextStrokePath(context);
        
    }
    

}



@end
