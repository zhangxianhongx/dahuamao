//
//  ViewController.m
//  折线图
//
//  Created by ybon on 2016/12/9.
//  Copyright © 2016年 ybon. All rights reserved.
//

#import "ViewController.h"
#import "ZYLineScroView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    ZYLineScroView *lView = [[ZYLineScroView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    [self.view addSubview:lView];
    lView.xPropoertion = @"1:30";
    lView.xArray = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    lView.yPropoertion = @"100:40";
    lView.yArray = @[@"100",@"150",@"300",@"400",@"500",@"600"];
}


@end
