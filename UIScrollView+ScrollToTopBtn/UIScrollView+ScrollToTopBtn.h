//
//  UIScrollView+ScrollToTopBtn.h
//  UIScrollView+ScrollToTopBtn
//
//  Created by litt1e-p on 16/4/1.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

@interface UIScrollView (ScrollToTopBtn)

/**
 *  customization for scrollToTop button, you can custom its image、title、backgroundImage or other properties as usually
 */
@property (nonatomic, assign, nullable) UIButton *scrollToTopBtn;

/**
 *  frame for scrollToTop button, include the origin position and size. default size: 44.f(side length) and its margin 12.f
 */
@property (nonatomic, assign) CGRect scrollToTopBtnFrame;

/**
 *  offset for show/hidden the scrollToTop button, default value:[UIScreen mainScreen].bounds.size.height
 */
@property (nonatomic, assign) CGFloat scrollToTopBtnShowOffset;

@end
