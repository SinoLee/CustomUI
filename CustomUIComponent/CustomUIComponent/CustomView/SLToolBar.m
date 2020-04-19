//
//  SLToolBar.m
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/04/18.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "SLToolBar.h"

@interface SLToolBar()

@property (nonatomic) SLButtonAlignment alignment;
@property (nonatomic, strong) CAShapeLayer *barLayer;

@end

@implementation SLToolBar

- (void)setupDefaults {
    if (self.barLayer == nil) {
        self.barLayer = [CAShapeLayer layer];
        [self.layer addSublayer:self.barLayer];
    }
    self.buttonCount = 0;
    self.alignment = SLButtonAlignmentRight;
    self.padding = 16.0f;
    self.buttonColor = [UIColor blackColor];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        //custom initlizaiton
        self.opaque = NO;
        self.clearsContextBeforeDrawing = YES;
        [self setupDefaults];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaults];
    }
    return self;
}

#pragma mark - Initialize View
- (void)prepareForInterfaceBuilder{
    self.backgroundColor = [UIColor blackColor];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateLayerProperties];
}

- (void)clearView:(UIView *)view {
    if (!view) return;
    for (UIView *subView in view.subviews) {
        //[self clearView:subView];
        [subView removeFromSuperview];
    }
}
#pragma mark - Initialize Items
- (void)setButtonCount:(NSInteger)buttonCount {
    _buttonCount = buttonCount;
#if !TARGET_INTERFACE_BUILDER
    // this code will run in the app itself
    //Code compiled here that runs the call in app
    NSLog(@"# 1");
#else
    // this code will execute only in IB
    //Code compiled here, called in IB Painting
    NSLog(@"# 2");
#endif
    [self updateLayerProperties];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)updateLayerProperties {
    [self clearView:self];
    if (self.buttonCount < 0) { return; }
    UIView *baseView = nil;
    CGFloat buttonHeight = MAX(self.frame.size.height - 8, 0.f);
    for (NSInteger idx = 0; idx < self.buttonCount; idx++) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"Button" forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [button setTintColor:self.buttonColor];
        [self addSubview:button];
        [button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [NSLayoutConstraint activateConstraints:@[
            [NSLayoutConstraint constraintWithItem:button
                                         attribute:NSLayoutAttributeTrailing
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:(baseView != nil) ? baseView : self
                                         attribute:(baseView != nil) ? NSLayoutAttributeLeading : NSLayoutAttributeTrailing
                                        multiplier:1.0
                                          constant:8],
            [NSLayoutConstraint constraintWithItem:button
                                         attribute:NSLayoutAttributeWidth
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                          constant:30],
            [NSLayoutConstraint constraintWithItem:button
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute
                                        multiplier:1.0
                                          constant:buttonHeight],
            [NSLayoutConstraint constraintWithItem:button
                                         attribute:NSLayoutAttributeCenterY
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:self
                                         attribute:NSLayoutAttributeCenterY
                                        multiplier:1.0
                                          constant:0.0],
        ]];
        baseView = button;
    }
    
}


@end
