//
//  DDScrollerView.h
//  sliderTest
//
//  Created by 张小冬 on 15/12/26.
//  Copyright © 2015年 dadong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+DD.h"
@interface DDScrollerView : UIView
/**
 *  构造方法产生一个滚动View
 *
 *  @param frame         这个大View的Frame
 *  @param items         顶部的View数组
 *  @param contentsArray 底部滚动视图里面的数组
 *
 */
- (instancetype)initWithFrame:(CGRect)frame itemsArray:(NSArray<UIView *> *)items contentsArray:(NSArray <UIView *> *)contentsArray ;
@end
