//
//  ViewController.m
//  sliderTest
//
//  Created by 张小冬 on 15/12/26.
//  Copyright © 2015年 dadong. All rights reserved.
//

#import "ViewController.h"
#import "DDScrollerView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"第一个";
    label1.textColor = [UIColor orangeColor];
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"第2个";
    label2.textColor = [UIColor orangeColor];
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = @"第3个";
    label1.textColor = [UIColor orangeColor];
    UIView *v1 = [[UIView alloc]init];
    v1.backgroundColor = [UIColor orangeColor];
    UIView *v2 = [[UIView alloc]init];
    v2.backgroundColor = [UIColor blackColor];
    UIView *v3 = [[UIView alloc]init];
    v3.backgroundColor = [UIColor greenColor];
    DDScrollerView * s = [[DDScrollerView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 300) itemsArray: @[label1,label2,label3] contentsArray:@[v1,v2,v3]];
    [self.view addSubview:s];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
