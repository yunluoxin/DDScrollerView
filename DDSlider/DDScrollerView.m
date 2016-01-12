//
//  DDScrollerView.m
//  sliderTest
//
//  Created by 张小冬 on 15/12/26.
//  Copyright © 2015年 dadong. All rights reserved.
//

#import "DDScrollerView.h"
#import "DDSliderView.h"
@interface DDScrollerView()<UIScrollViewDelegate>
/**
 *  顶上的滚动栏
 */
@property (nonatomic, strong) DDSliderView *sliderView ;
/**
 *  底部的滚动视图
 */
@property (nonatomic, strong) UIScrollView *scrollView ;
@end
@implementation DDScrollerView
- (instancetype)initWithFrame:(CGRect)frame itemsArray:(NSArray<UIView *> *)items contentsArray:(NSArray <UIView *> *)contentsArray
{
    if (self = [super initWithFrame:frame]) {
        //增加顶上滚动栏
        CGRect sliderF = CGRectMake(0, 0, self.bounds.size.width, 44) ;
        self.sliderView = [[DDSliderView alloc]initWithFrame:sliderF itemArray:items ];
        [self addSubview:self.sliderView];
        //底部的滚动视图
        [self initScrollViewWithArray:contentsArray];
        
    }
    return self;
}

- (void)initScrollViewWithArray:(NSArray <UIView *> *)contentsArray
{
    CGFloat w = self.bounds.size.width ;
    CGFloat y = self.sliderView.bounds.size.height ;
    CGFloat h = self.bounds.size.height - y ;
    CGFloat x = 0 ;
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self addSubview:self.scrollView];
    self.scrollView.delegate = self ;
    self.scrollView.pagingEnabled = YES ;
    self.scrollView.bounces = NO ;
    self.scrollView.showsHorizontalScrollIndicator = NO ;
    
    self.scrollView.contentSize = CGSizeMake(w * contentsArray.count, h);
    
    [contentsArray enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        CGFloat sX = idx * w ;
        obj.frame = CGRectMake(sX, 0, w, h );
        [self.scrollView addSubview:obj];
    }];
    __weak typeof(self) weakSelf = self ;
    self.sliderView.whenItemTapped = ^(NSUInteger index){
        weakSelf.scrollView.contentOffset=CGPointMake(w *index, 0);
        weakSelf.currentIndex = index ;
    };
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat index = scrollView.contentOffset.x /self.bounds.size.width ;
    self.sliderView.index = index ;
}
//作为接口提供给外界用的
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x /self.bounds.size.width ;
    self.currentIndex = index ;
}

@end
