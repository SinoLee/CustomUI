//
//  ToolBar2.m
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/04/19.
//  Copyright © 2020 Sino. All rights reserved.
//

#import "ToolBar2.h"

@interface ToolBar2()

@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UIView *divider;

@end

@implementation ToolBar2

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeView];
    }
    return self;
}

- (void)initializeView {
    [self addSubview:self.button1];
    [self.button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.button1
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeTrailing
                                    multiplier:1.0
                                      constant:-16.0],
        [NSLayoutConstraint constraintWithItem:self.button1
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                      constant:2.0],
        [NSLayoutConstraint constraintWithItem:self.button1
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                      constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.button1
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:30.0],
    ]];
    
    [self addSubview:self.button2];
    [self.button2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.button2
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.button1
                                     attribute:NSLayoutAttributeLeading
                                    multiplier:1.0
                                      constant:-16.0],
        [NSLayoutConstraint constraintWithItem:self.button2
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                      constant:2.0],
        [NSLayoutConstraint constraintWithItem:self.button2
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                      constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.button2
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:30.0],
    ]];
    
    [self addSubview:self.label1];
    [self.label1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.label1
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.button2
                                     attribute:NSLayoutAttributeLeading
                                    multiplier:1.0
                                      constant:-16.0],
        [NSLayoutConstraint constraintWithItem:self.label1
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                      constant:2.0],
        [NSLayoutConstraint constraintWithItem:self.label1
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                      constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.label1
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:60.0],
    ]];
    
}

#pragma mark - Initialize Items
- (UIButton *)button1 {
    if (!_button1) {
        _button1 = [[UIButton alloc] initWithFrame:CGRectZero];
        [_button1 setTintColor:[UIColor blueColor]];
        [_button1.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_button1 setBackgroundColor:[UIColor colorWithRed:20/255 green:20/255 blue:20/255 alpha:1.0f]];
    }
    return _button1;
}
- (UIButton *)button2 {
    if (!_button2) {
        _button2 = [[UIButton alloc] initWithFrame:CGRectZero];
        [_button2 setTintColor:[UIColor blueColor]];
        [_button2.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_button2 setBackgroundColor:[UIColor colorWithRed:120/255 green:120/255 blue:120/255 alpha:1.0f]];
    }
    return _button2;
}
- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] initWithFrame:CGRectZero];
        [_label1 setFont:[UIFont systemFontOfSize:17]];
        [_label1 setTextColor:[UIColor blueColor]];
    }
    return _label1;
}
- (UIView *)divider {
    if (_divider) {
        _divider = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _divider;
}
- (void)setButton1Title:(NSString *)button1Title {
    //[self.button1.titleLabel setText:button1Title];
    [self.button1 setTitle:button1Title forState:UIControlStateNormal];
    [self.label1 setText:button1Title];
}
- (void)setButton2Title:(NSString *)button2Title {
    [self.button2 setTitle:button2Title forState:UIControlStateNormal];
}
@end
