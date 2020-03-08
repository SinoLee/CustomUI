//
//  NSLayoutConstraint+utils.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "NSLayoutConstraint+utils.h"

@implementation NSLayoutConstraint (utils)

// https://abc1211.tistory.com/626
#pragma mark - Size Constraints
+ (NSLayoutConstraint *)widthConstraint:(CGFloat)width view:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:view
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.f
                                         constant:width];
}

+ (NSLayoutConstraint *)heightConstraint:(CGFloat)height view:(UIView *)view {
    return [NSLayoutConstraint constraintWithItem:view
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.f
                                         constant:height];
}

#pragma mark - Alignment Constraints
+ (NSLayoutConstraint *)xAlignment:(CGFloat)offset view:(UIView *)view superView:(UIView *)superView {
    return [NSLayoutConstraint constraintWithItem:view
                                        attribute:NSLayoutAttributeCenterX
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:superView
                                        attribute:NSLayoutAttributeCenterX
                                       multiplier:1.0
                                         constant:offset];
}

+ (NSLayoutConstraint *)yAlignment:(CGFloat)offset view:(UIView *)view superView:(UIView *)superView {
    return [NSLayoutConstraint constraintWithItem:view
                                        attribute:NSLayoutAttributeCenterY
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:superView
                                        attribute:NSLayoutAttributeCenterY
                                       multiplier:1.0
                                         constant:offset];
}

#pragma mark - Alignment Constraints
+ (NSLayoutConstraint *)leadingConstraint:(CGFloat)offset firstView:(UIView *)firstView baseView:(UIView *)baseView {
    return [NSLayoutConstraint constraintWithItem:firstView
                                        attribute:NSLayoutAttributeLeading
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:baseView
                                        attribute:NSLayoutAttributeLeading
                                       multiplier:1.f
                                         constant:offset];
}

+ (NSLayoutConstraint *)trailingConstraint:(CGFloat)offset firstView:(UIView *)firstView baseView:(UIView *)baseView {
    return [NSLayoutConstraint constraintWithItem:firstView
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:baseView
                                        attribute:NSLayoutAttributeTrailing
                                       multiplier:1.f
                                         constant:-offset];
}

+ (NSLayoutConstraint *)topConstraint:(CGFloat)offset firstView:(UIView *)firstView baseView:(UIView *)baseView {
    return [NSLayoutConstraint constraintWithItem:firstView
                                        attribute:NSLayoutAttributeTop
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:baseView
                                        attribute:NSLayoutAttributeTop
                                       multiplier:1.f
                                         constant:offset];
}

+ (NSLayoutConstraint *)bottomConstraint:(CGFloat)offset firstView:(UIView *)firstView baseView:(UIView *)baseView {
    return [NSLayoutConstraint constraintWithItem:firstView
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:baseView
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1.f
                                         constant:-offset];
}

#pragma mark - Space Constraints
+ (NSLayoutConstraint *)leadingSpace:(CGFloat)offset relatedBy:(NSLayoutRelation)option first:(UIView *)firstView second:(UIView *)secondView {
    return [NSLayoutConstraint constraintWithItem:firstView
                                        attribute:NSLayoutAttributeLeading
                                        relatedBy:option
                                           toItem:secondView
                                        attribute:NSLayoutAttributeTrailing
                                       multiplier:1.f
                                         constant:offset];
}
+ (NSLayoutConstraint *)leadingSpace:(CGFloat)offset first:(UIView *)firstView second:(UIView *)secondView {
    return [NSLayoutConstraint leadingSpace:offset relatedBy:NSLayoutRelationEqual first:firstView second:secondView];
}

+ (NSLayoutConstraint *)trailingSpace:(CGFloat)offset relatedBy:(NSLayoutRelation)option first:(UIView *)firstView second:(UIView *)secondView {
    return [NSLayoutConstraint constraintWithItem:firstView
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:option
                                           toItem:secondView
                                        attribute:NSLayoutAttributeLeading
                                       multiplier:1.f
                                         constant:-offset];
}
+ (NSLayoutConstraint *)trailingSpace:(CGFloat)offset first:(UIView *)firstView second:(UIView *)secondView {
    return [NSLayoutConstraint trailingSpace:offset relatedBy:NSLayoutRelationEqual first:firstView second:secondView];
}

+ (NSLayoutConstraint *)topSpace:(CGFloat)offset firstView:(UIView *)firstView secondView:(UIView *)secondView {
    return [NSLayoutConstraint constraintWithItem:firstView
                                        attribute:NSLayoutAttributeTop
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:secondView
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1.f
                                         constant:offset];
}

+ (NSLayoutConstraint *)bottomSpace:(CGFloat)offset firstView:(UIView *)firstView secondView:(UIView *)secondView {
    return [NSLayoutConstraint constraintWithItem:firstView
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:secondView
                                        attribute:NSLayoutAttributeTop
                                       multiplier:1.f
                                         constant:offset];
}

@end
