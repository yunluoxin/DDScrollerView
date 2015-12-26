//
//  DDSliderView.h
//  sliderTest
//
//  Created by 张小冬 on 15/12/26.
//  Copyright © 2015年 dadong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDSliderView : UIView
/**
 *  返回一个构造好的滚动栏
 *
 *  @param frame <#frame description#>
 *  @param items <#items description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame itemArray:(NSArray<UIView *> *) items ;
/**
 *  设置当前处于第几个
 */
@property (nonatomic,assign) CGFloat index ;
/**
 *  第index的项目块被点击
 *    点击时候应该作什么
 */
@property (nonatomic , copy) void (^whenItemTapped)(NSUInteger index);
@end
