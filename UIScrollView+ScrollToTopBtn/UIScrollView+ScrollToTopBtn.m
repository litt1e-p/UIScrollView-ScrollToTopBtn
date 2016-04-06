//
//  UIScrollView+ScrollToTopBtn.m
//  UIScrollView+ScrollToTopBtn
//
//  Created by litt1e-p on 16/4/1.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "UIScrollView+ScrollToTopBtn.h"
#import <objc/runtime.h>

#define kScrollToTopBtnDefaultShowOffset ([UIScreen mainScreen].bounds.size.height)

@implementation UIScrollView (ScrollToTopBtn)

static CGFloat const kScrollToTopBtnSideLength = 44.f;
static CGFloat const kScrollToTopBtnMargin     = 12.f;

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oriImp = class_getInstanceMethod(self, @selector(setContentOffset:));
        Method swiImp = class_getInstanceMethod(self, @selector(st_setContentOffset:));
        if (oriImp && swiImp) {
            method_exchangeImplementations(oriImp, swiImp);
        } else {
            NSLog(@"__SCROLLTOTOPBTN__ SWIZZLE ERROR");
        }
    });
}

- (void)st_setContentOffset:(CGPoint)contentOffset
{
    if (!self.scrollToTopBtn) {
        [self st_setContentOffset:contentOffset];
        return;
    }
    if (![self.superview.subviews containsObject:self.scrollToTopBtn]) {
        self.scrollToTopBtn.frame = self.scrollToTopBtnFrame;
        [self.superview addSubview:self.scrollToTopBtn];
        [self.superview layoutIfNeeded];
        [self.scrollToTopBtn addTarget:self action:@selector(scrollToTopBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    }
    self.scrollToTopBtn.hidden = contentOffset.y <= self.scrollToTopBtnShowOffset;
    [self st_setContentOffset:contentOffset];
}

- (void)scrollToTopBtnEvent
{
    [self setContentOffset:CGPointMake(0, -self.contentInset.top) animated:YES];
}

- (nullable UIButton *)scrollToTopBtn
{
    return objc_getAssociatedObject(self, @selector(scrollToTopBtn));
}

- (void)setScrollToTopBtn:(nullable UIButton *)scrollToTopBtn
{
    objc_setAssociatedObject(self, @selector(scrollToTopBtn), scrollToTopBtn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)scrollToTopBtnFrame
{
    id rect      = objc_getAssociatedObject(self, @selector(scrollToTopBtnFrame));
    CGRect frame = [rect CGRectValue];
    if (CGRectEqualToRect(CGRectNull, frame) || CGRectEqualToRect(CGRectZero, frame)) {
        CGFloat x = MIN(CGRectGetMaxX(self.frame), CGRectGetMaxX(self.superview.frame)) - kScrollToTopBtnMargin - kScrollToTopBtnSideLength;
        CGFloat y = MIN(CGRectGetMaxY(self.frame), CGRectGetMaxY(self.superview.frame)) - kScrollToTopBtnMargin - kScrollToTopBtnSideLength;
        frame = CGRectMake(x , y, kScrollToTopBtnSideLength, kScrollToTopBtnSideLength);
    }
    return frame;
}

- (void)setScrollToTopBtnFrame:(CGRect)scrollToTopBtnFrame
{
    objc_setAssociatedObject(self, @selector(scrollToTopBtnFrame), [NSValue valueWithCGRect:scrollToTopBtnFrame], OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)scrollToTopBtnShowOffset
{
    id offset = objc_getAssociatedObject(self, @selector(scrollToTopBtnShowOffset));
    return offset > 0 ? [offset floatValue]: kScrollToTopBtnDefaultShowOffset;
}

- (void)setScrollToTopBtnShowOffset:(CGFloat)scrollToTopBtnShowOffset
{
    objc_setAssociatedObject(self, @selector(scrollToTopBtnShowOffset), @(scrollToTopBtnShowOffset), OBJC_ASSOCIATION_ASSIGN);
}

@end
