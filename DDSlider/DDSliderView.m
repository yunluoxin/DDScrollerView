//
//  DDSliderView.m
//  sliderTest
//
//  Created by 张小冬 on 15/12/26.
//  Copyright © 2015年 dadong. All rights reserved.
//

#import "DDSliderView.h"
#import "UIView+DD.h"
@interface DDSliderView ()
/**
 *  每个item的宽
 */
@property (assign ,nonatomic) CGFloat width ;
/**
 *  每个item的高
 */
@property (assign ,nonatomic) CGFloat height ;
/**
 *  滑动块
 */
@property (strong ,nonatomic) UIView * slider ;
@end

@implementation DDSliderView
- (instancetype)initWithFrame:(CGRect )frame itemArray:(NSArray<UIView *> *)items
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViewsWithItemArray:items];
    }
    return self ;
}
- (UIView *)slider
{
    if (!_slider) {
        self.slider = [[UIView alloc]initWithFrame:CGRectMake(0, self.height, self.width, 3)];
        self.slider.backgroundColor = [UIColor orangeColor];
    }
    return _slider ;
}
- (void)initViewsWithItemArray:(NSArray<UIView *> *)items
{
    self.width = self.bounds.size.width/ items.count ;
    self.height = self.bounds.size.height - 3 ;
    //增加滑动块
    [self addSubview:self.slider];
    //增加项目块
    [items enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        obj.frame = CGRectMake(idx * self.width, 0, self.width, self.height);
        obj.userInteractionEnabled = YES ;
        obj.tagString = [NSString stringWithFormat:@"%ld",idx];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapView:)];
        [obj addGestureRecognizer:tap];
        [self addSubview:obj];
    }];
}
//点击了某个item
- (void)TapView:(UITapGestureRecognizer *)sender
{
    NSUInteger i = sender.view.tagString.intValue ;
    self.index = i ;
    if(self.whenItemTapped){
        self.whenItemTapped(i);
    }
}
- (void)setIndex:(CGFloat)index
{
    _index = index ;
    CGFloat x = index *self.width ;
    CGFloat y = self.height ;
    //动画
    [UIView animateWithDuration:0.25 animations:^{
        self.slider.frame = CGRectMake(x, y, self.width, self.height);
    }];
}
@end
