//
//  UIView+DD.m
//  sliderTest
//
//  Created by 张小冬 on 15/12/26.
//  Copyright © 2015年 dadong. All rights reserved.
//

#import "UIView+DD.h"
#import <objc/runtime.h>
@implementation UIView (DD)
- (void)setTagString:(NSString *)tagString
{
    if (tagString==nil) {
        objc_setAssociatedObject(self, @"tagString", nil, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }else{
        objc_setAssociatedObject(self, @"tagString", tagString, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}
- (NSString *)tagString
{
    return objc_getAssociatedObject(self, @"tagString");
}
- (void)dealloc
{
    objc_removeAssociatedObjects(self);
}
@end
