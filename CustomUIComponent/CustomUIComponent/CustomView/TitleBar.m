//
//  TitleBar.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "TitleBar.h"
#import "NSLayoutConstraint+utils.h"
#import <CustomUIComponent-Swift.h>
#import <CustomUI/CustomUI.h>

@interface TitleBar ()
{
    UIView *_actionView;
}
@property (strong, nonatomic) UIView *leftActionView;
@property (strong, nonatomic) UIView *underline;

@property (strong, nonatomic) UIButton *backButton;

@property (strong, nonatomic) UILabel *titleLabel;

//
@property (weak, nonatomic) id target;
@property (assign, nonatomic) SEL action;

@end

@implementation TitleBar

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initializeView];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        [self initializeView];
        [self setTitle:title];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        // remove all storyboard sampleviews
        for (UIView *view in self.subviews) {
            [view removeFromSuperview];
        }
        [self initializeView];
    }
    return self;
}

#pragma mark - Initialize View
- (void)initializeView {
    [self addSubview:self.leftActionView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.underline];
    
    [self updateLayoutLeftActionView];
    [self updateLayoutBackButton];
    [self updateLayoutTitleLabel];
    [self updateLayoutUnderline];
}
#pragma mark - Initialize View Items
- (UIView *)leftActionView {
    if (!_leftActionView) {
        _leftActionView = [[UIView alloc] init];
        [_leftActionView addSubview:self.backButton];
    }
    return _leftActionView;
}
- (UIView *)actionView {
    return _actionView;
}
- (void)setActionView:(UIView *)actionView {
    _actionView = actionView;
    [self addSubview:_actionView];
    [self updateLayoutActionView];
    [self updateLayoutTitleLabel];
}
- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc] init];
        [_underline setBackgroundColor:[UIColor systemGrayColor]];
    }
    return _underline;
}
- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        [_backButton setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(touchUpBack) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:17]];
        [_titleLabel setTextColor:[UIColor blackColor]];
    }
    return _titleLabel;
}
#pragma mark - UpdateLayout View Items
- (void)updateLayoutLeftActionView {
    [self.leftActionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.leftActionView width:36],
        [self.leftActionView height:36],
        [self.leftActionView centerY],
        [self.leftActionView alignLeading:8]
    ]];
}
- (void)updateLayoutActionView {
    if (!self.actionView) {
        NSLog(@"# ActionView is nil");
    }
    CGSize size = self.actionView.frame.size;
    [self.actionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.actionView width:size.width],
        [self.actionView height:size.height],
        [self.actionView centerY],
        [self.actionView alignTrailing:8]
    ]];
}
- (void)updateLayoutUnderline {
    [self.underline setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [self.underline height:2],
        [self.underline alignLeading:8],
        [self.underline alignTrailing:8],
        [self.underline alignBottom:2]
    ]];
}
- (void)updateLayoutBackButton {
    if (!self.backButton) {
        NSLog(@"# backbutton is nil");
        return;
    }
    [self.backButton setTranslatesAutoresizingMaskIntoConstraints:NO];

    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint widthConstraint:24.f view:self.backButton];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint heightConstraint:24.f view:self.backButton];
    NSLayoutConstraint *centerX = [NSLayoutConstraint xAlignment:0.f view:self.backButton superView:self.leftActionView];
    NSLayoutConstraint *centerY = [NSLayoutConstraint yAlignment:0.f view:self.backButton superView:self.leftActionView];
    
    [NSLayoutConstraint activateConstraints:@[widthConstraint, heightConstraint, centerX, centerY]];
}

- (void)updateLayoutTitleLabel {
    [self.titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint *centerY = [NSLayoutConstraint yAlignment:0.f view:self.titleLabel superView:self];
    NSLayoutConstraint *leading = [NSLayoutConstraint leadingSpace:4.f first:self.titleLabel second:self.leftActionView];
    NSLayoutConstraint *trailing;
    if (self.actionView) {
        trailing = [NSLayoutConstraint trailingSpace:4.f relatedBy:NSLayoutRelationGreaterThanOrEqual first:self.titleLabel second:self.actionView];
    }
    else {
        trailing = [NSLayoutConstraint trailingConstraint:50.f firstView:self.titleLabel baseView:self];
    }

    [NSLayoutConstraint activateConstraints:@[leading, trailing, centerY]];
}

#pragma mark - Internal action methods
- (void)touchUpBack {
    if (!self.target && !self.action) {
        return;
    }
    void (*func)(id, SEL, id) = (void *)[self.target methodForSelector:self.action];
    func(self.target, self.action, self);
}

#pragma mark - External action methods

- (void)setTitle:(NSString *)title {
    NSLog(@"# title : %@", title);
    [self.titleLabel setText:title];
}

- (void)setTarget:(id)target backAction:(SEL)action {
    self.target = target;
    self.action = action;
}

//
//- (void)updateLayout {
//    [self.backButton addConstraints:@[widthConstraint, heightConstraint, centerX, centerY]];
//}

@end
