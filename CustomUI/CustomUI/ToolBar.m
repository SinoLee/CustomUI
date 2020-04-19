//
//  ToolBar.m
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/04/19.
//  Copyright © 2020 Sino. All rights reserved.
//

#import "ToolBar.h"

@interface ToolBar()

@property (strong, nonatomic) UIColor *buttonColor;

@property (strong, nonatomic) UIStackView *buttonStack;
@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIView *button1Area;
@property (strong, nonatomic) UIView *button2Area;

@property (strong, nonatomic) UIView *divider;

@end


@implementation ToolBar

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

- (void)clearView:(UIView *)view {
}
- (void)initializeView {
    [self addSubview:self.buttonStack];
    [self.buttonStack setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.buttonStack
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeLeading
                                    multiplier:1.0
                                      constant:16.0],
        [NSLayoutConstraint constraintWithItem:self.buttonStack
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeTrailing
                                    multiplier:1.0
                                      constant:-16.0],
        [NSLayoutConstraint constraintWithItem:self.buttonStack
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                      constant:2.0],
        [NSLayoutConstraint constraintWithItem:self.buttonStack
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                      constant:0.0],
    ]];
    [self addSubview:self.divider];
    [self.divider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.divider
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeLeading
                                    multiplier:1.0
                                      constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.divider
                                     attribute:NSLayoutAttributeTrailing
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeTrailing
                                    multiplier:1.0
                                      constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.divider
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                      constant:0.0],
        [NSLayoutConstraint constraintWithItem:self.divider
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:1.0],
    ]];
}

#pragma mark - Initialize Items
- (UIStackView *)buttonStack {
    if (!_buttonStack) {
        _buttonStack = [[UIStackView alloc] initWithFrame:CGRectZero];
        [_buttonStack setBackgroundColor:[UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:1.0]];
        UIView *dummyView = [[UIView alloc] initWithFrame:CGRectZero];
        [_buttonStack addArrangedSubview:dummyView];
        [_buttonStack addArrangedSubview:self.button1Area];
        [_buttonStack addArrangedSubview:self.button2Area];
    }
    return _buttonStack;
}
- (UIView *)button1Area {
    if (!_button1Area) {
        _button1Area = [[UIView alloc] initWithFrame:CGRectZero];
        [_button1Area addSubview:self.button1];
        [self.button1 setTranslatesAutoresizingMaskIntoConstraints:NO];
        [NSLayoutConstraint activateConstraints:@[
            [NSLayoutConstraint constraintWithItem:self.button1
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:_button1Area
                                         attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0
                                          constant:0.0],
            [NSLayoutConstraint constraintWithItem:self.button1
                                         attribute:NSLayoutAttributeLeading
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:_button1Area
                                         attribute:NSLayoutAttributeLeading
                                        multiplier:1.0
                                          constant:16.0],
            [NSLayoutConstraint constraintWithItem:self.button1
                                         attribute:NSLayoutAttributeCenterY
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:_button1Area
                                         attribute:NSLayoutAttributeCenterY
                                        multiplier:1.0
                                          constant:0.0],
        ]];
    }
    return _button1Area;
}
- (UIView *)button2Area {
    if (!_button2Area) {
        _button2Area = [[UIView alloc] initWithFrame:CGRectZero];
        [_button2Area addSubview:self.button2];
        [self.button2 setTranslatesAutoresizingMaskIntoConstraints:NO];
        [NSLayoutConstraint activateConstraints:@[
            [NSLayoutConstraint constraintWithItem:self.button2
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:_button2Area
                                         attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0
                                          constant:0.0],
            [NSLayoutConstraint constraintWithItem:self.button2
                                         attribute:NSLayoutAttributeLeading
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:_button2Area
                                         attribute:NSLayoutAttributeLeading
                                        multiplier:1.0
                                          constant:16.0],
            [NSLayoutConstraint constraintWithItem:self.button2
                                         attribute:NSLayoutAttributeCenterY
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:_button2Area
                                         attribute:NSLayoutAttributeCenterY
                                        multiplier:1.0
                                          constant:0.0],
        ]];
    }
    return _button2Area;
}
- (UIButton *)button1 {
    if (!_button1) {
        _button1 = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button1.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_button1 addTarget:self action:@selector(touchUpButton1) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button1;
}
- (UIButton *)button2 {
    if (!_button2) {
        _button2 = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button2.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    return _button2;
}
- (UIView *)divider {
    if (!_divider) {
        _divider = [[UIView alloc] initWithFrame:CGRectZero];
        [_divider setBackgroundColor:[UIColor grayColor]];
    }
    return _divider;
}
- (void)setButton1Title:(NSString *)button1Title {
    [self.button1 setTitle:button1Title forState:UIControlStateNormal];
}
- (void)setButton2Title:(NSString *)button2Title {
    [self.button2 setTitle:button2Title forState:UIControlStateNormal];
}

#pragma mark - Action Methods
- (void)touchUpButton1 {
    [self block];
}

@end
