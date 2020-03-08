//
//  NSLayoutConstraint+utils.h
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (utils)

+ (NSLayoutConstraint *)widthConstraint:(CGFloat)width view:(UIView *)view;
+ (NSLayoutConstraint *)heightConstraint:(CGFloat)height view:(UIView *)view;

+ (NSLayoutConstraint *)xAlignment:(CGFloat)offset view:(UIView *)view superView:(UIView *)superView;
+ (NSLayoutConstraint *)yAlignment:(CGFloat)offset view:(UIView *)view superView:(UIView *)superView;


+ (NSLayoutConstraint *)leadingConstraint:(CGFloat)offset firstView:(UIView *)firstView baseView:(UIView *)baseView;
+ (NSLayoutConstraint *)trailingConstraint:(CGFloat)offset firstView:(UIView *)firstView baseView:(UIView *)baseView;
+ (NSLayoutConstraint *)topConstraint:(CGFloat)offset firstView:(UIView *)firstView baseView:(UIView *)baseView;
+ (NSLayoutConstraint *)bottomConstraint:(CGFloat)offset firstView:(UIView *)firstView baseView:(UIView *)baseView;


+ (NSLayoutConstraint *)leadingSpace:(CGFloat)offset relatedBy:(NSLayoutRelation)option first:(UIView *)firstView second:(UIView *)secondView;
+ (NSLayoutConstraint *)leadingSpace:(CGFloat)offset first:(UIView *)firstView second:(UIView *)secondView;

+ (NSLayoutConstraint *)trailingSpace:(CGFloat)offset relatedBy:(NSLayoutRelation)option first:(UIView *)firstView second:(UIView *)secondView;
+ (NSLayoutConstraint *)trailingSpace:(CGFloat)offset first:(UIView *)firstView second:(UIView *)secondView;

+ (NSLayoutConstraint *)topSpace:(CGFloat)offset firstView:(UIView *)firstView secondView:(UIView *)secondView;
+ (NSLayoutConstraint *)bottomSpace:(CGFloat)offset firstView:(UIView *)firstView secondView:(UIView *)secondView;

@end

NS_ASSUME_NONNULL_END
