//
//  SwitchButton.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/11.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "SwitchButton.h"
#import "SwitchThumbView.h"

@interface SwitchButton() {
    BOOL _isOn;
    CGFloat _padding;
    UIColor *_onTintColor;
    UIColor *_offTintColor;
    CGFloat _cornerRadius;
    CGFloat _thumbCornerRadius;
    CGSize _thumbSize;
    CGFloat _animationDuration;
    
    SwitchThumbView *_thumbView;
    UIImageView *_onImageView;
    UIImageView *_offImageView;
    
    CGPoint _onPoint;
    CGPoint _offPoint;
    BOOL _isAnimating;
    UILabel *_labelOff;
    UILabel *_labelOn;
    BOOL _areLabelsShown;
}

@property (strong, nonatomic) SwitchThumbView *thumbView;

@property (strong, nonatomic) UIImageView *onImageView;
@property (strong, nonatomic) UIImageView *offImageView;
@property (weak, nonatomic) UIImage *onImage;
@property (weak, nonatomic) UIImage *offImage;

@property (nonatomic) CGFloat animationDuration;

@property (nonatomic) CGPoint onPoint;
@property (nonatomic) CGPoint offPoint;
@property (nonatomic) BOOL isAnimating;

@property (strong, nonatomic) UILabel *labelOff;
@property (strong, nonatomic) UILabel *labelOn;
@property (nonatomic) BOOL areLabelsShown;
//public var areLabelsShown: Bool = false {
//    didSet {
//        self.setupUI()
//    }
//}


@end

@implementation SwitchButton

- (SwitchThumbView *)thumbView {
    return _thumbView;
}
- (void)setThumbView:(SwitchThumbView *)thumbView {
    _thumbView = thumbView;
}
- (UIImageView *)onImageView {
    return _onImageView;
}
- (UIImage *)onImage {
    return _onImageView.image;
}
- (void)setOnImage:(UIImage *)onImage {
    _onImageView = [[UIImageView alloc] initWithImage:onImage];
    [self layoutSubviews];
}
- (UIImageView *)offImageView {
    return _offImageView;
}
- (UIImage *)offImage {
    return _offImageView.image;
}
- (void)setOffImage:(UIImage *)offImage {
    _offImageView = [[UIImageView alloc] initWithImage:offImage];
    [self layoutSubviews];
}
- (CGPoint)onPoint {
    return _onPoint;
}
- (void)setOnPoint:(CGPoint)onPoint {
    _onPoint = onPoint;
}
- (CGPoint)offPoint {
    return _offPoint;
}
- (void)setOffPoint:(CGPoint)offPoint {
    _offPoint = offPoint;
}
- (BOOL)isAnimating {
    return _isAnimating;
}
- (void)setIsAnimating:(BOOL)isAnimating {
    _isAnimating = isAnimating;
}
- (BOOL)areLabelsShown {
    return _areLabelsShown;
}
- (void)setAreLabelsShown:(BOOL)areLabelsShown {
    _areLabelsShown = areLabelsShown;
    [self setupUI];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        CGRect frame = coder.accessibilityFrame;
        [self drawRect:frame];
        [self setupUI];
    }
    return self;
}

- (void)initializeValue {
    _thumbView = [[SwitchThumbView alloc] initWithFrame:CGRectZero];
    _isOn = NO;
    _padding = 1.0;
    _onTintColor = [UIColor colorWithRed:70/255.f green:158/255.f blue:179/255.f alpha:1.f];
    _offTintColor = [UIColor colorWithWhite:208/255.f alpha:1.f];
    _cornerRadius = 0.5;
    self.thumbView.backgroundColor = [UIColor whiteColor];
    _thumbCornerRadius = 0.5;
    _thumbSize = CGSizeZero;
    self.thumbView.thumbImageView.image = nil;
    self.thumbView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.thumbView.layer.shadowRadius = 1.5;
    self.thumbView.layer.shadowOpacity = 0.4;
    _animationDuration = 0.5;
    _onImageView = nil;
    _offImageView = nil;
    _onPoint = CGPointZero;
    _offPoint = CGPointZero;
    _isAnimating = NO;
    _labelOff = [[UILabel alloc] init];
    _labelOn = [[UILabel alloc] init];
    _areLabelsShown = NO;
}

- (BOOL)isOn {
    return _isOn;
}
- (void)setIsOn:(BOOL)isOn {
    _isOn = isOn;
}
- (CGFloat)padding {
    return _padding;
}
- (void)setPadding:(CGFloat)padding {
    _padding = padding;
    [self layoutSubviews];
}
- (UIColor *)onTintColor {
    if (!_onTintColor) {
        _onTintColor = [UIColor colorWithRed:70/255.f green:158/255.f blue:179/255.f alpha:1.f];
    }
    return _onTintColor;
}
- (void)setOnTintColor:(UIColor *)onTintColor {
    _onTintColor = onTintColor;
    [self setupUI];
}
- (UIColor *)offTintColor {
    if (!_offTintColor) {
        _offTintColor = [UIColor colorWithWhite:208/255.f alpha:1.f];
    }
    return _offTintColor;
}
- (void)setOffTintColor:(UIColor *)offTintColor {
    _offTintColor = offTintColor;
    [self setupUI];
}
- (CGFloat)cornerRadius {
    return _cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    if (cornerRadius > 0.5 || cornerRadius < 0.0) {
        _cornerRadius = 0.5;
    }
    else {
        _cornerRadius = cornerRadius;
    }
    [self layoutSubviews];
}
- (UIColor *)thumbTintColor {
    return self.thumbView.backgroundColor;
}
- (void)setThumbTintColor:(UIColor *)thumbTintColor {
    self.thumbView.backgroundColor = self.thumbTintColor;
}
// thumbCornerRadius
- (CGFloat)thumbCornerRadius {
    return _thumbCornerRadius;
}
- (void)setThumbCornerRadius:(CGFloat)thumbCornerRadius {
    if (thumbCornerRadius > 0.5 || thumbCornerRadius < 0.0) {
        _thumbCornerRadius = 0.5;
    }
    else {
        _thumbCornerRadius = thumbCornerRadius;
    }
    [self layoutSubviews];
}
- (CGSize)thumbSize {
    return _thumbSize;
}
- (void)setThumbSize:(CGSize)thumbSize {
    _thumbSize = thumbSize;
    [self layoutSubviews];
}
- (UIImage *)thumbImage {
    return self.thumbView.thumbImageView.image;
}
- (void)setThumbImage:(UIImage *)thumbImage {
    if (!thumbImage) {
        return;
    }
    self.thumbView.thumbImageView.image = thumbImage;
}
- (UIColor *)thumbShadowColor {
    return [UIColor colorWithCGColor:self.thumbView.layer.shadowColor];
}
- (void)setThumbShadowColor:(UIColor *)thumbShadowColor {
    self.thumbView.layer.shadowColor = [thumbShadowColor CGColor];
}
- (CGSize)thumbShadowOffset {
    return self.thumbView.layer.shadowOffset;
}
- (void)setThumbShadowOffset:(CGSize)thumbShadowOffset {
    self.thumbView.layer.shadowOffset = thumbShadowOffset;
}
- (CGFloat)thumbShadowRadius {
    return self.thumbView.layer.shadowRadius;
}
- (void)setThumbShadowRadius:(CGFloat)thumbShadowRadius {
    self.thumbView.layer.shadowRadius = thumbShadowRadius;
}
- (CGFloat)thumbShadowOpacity {
    return self.thumbView.layer.shadowOpacity;
}
- (void)setThumbShadowOpacity:(CGFloat)thumbShadowOpacity {
    self.thumbView.layer.shadowOpacity = thumbShadowOpacity;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}
- (void)setupUI {
    [self clear];
    [self setClipsToBounds:NO];
    [self.thumbView setBackgroundColor:self.thumbTintColor];
    [self.thumbView setUserInteractionEnabled:NO];
    
    [self.thumbView.layer setShadowColor:self.thumbShadowColor.CGColor];
    [self.thumbView.layer setShadowRadius:self.thumbShadowRadius];
    [self.thumbView.layer setShadowOpacity:self.thumbShadowOpacity];
    [self.thumbView.layer setShadowOffset:self.thumbShadowOffset];
    
    [self setBackgroundColor:(self.isOn ? self.onTintColor : self.offTintColor)];
    [self addSubview:self.thumbView];
    [self addSubview:self.onImageView];
    [self addSubview:self.offImageView];
    
    [self setupLabels];
}
- (void)clear {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super beginTrackingWithTouch:touch withEvent:event];
    [self animate];
    return true;
}
- (void)setOn:(BOOL)on animated:(BOOL)animated {
    if (animated) {
        [self animateOn:on];
    }
    else {
        self.isOn = on;
        [self setupViewsOnAction];
        [self completeAction];
    }
}
- (void)animate {
    [self animateOn:!self.isOn];
}
- (void)animateOn:(BOOL)on {
    [self setIsOn:on];
    [self setIsAnimating:YES];
    [UIView animateWithDuration:self.animationDuration delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.5 options:(UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionAllowUserInteraction) animations:^{
        [self setupViewsOnAction];
    } completion:^(BOOL finished) {
        [self completeAction];
    }];
}
- (void)setupViewsOnAction {
    CGRect frame = self.thumbView.frame;
    frame.origin.x = self.isOn ? self.onPoint.x : self.offPoint.x;
    [self.thumbView setFrame:frame];
    [self setBackgroundColor:(self.isOn ? self.onTintColor : self.offTintColor)];
    [self setOnOffImageFrame];
}
- (void)completeAction {
    [self setIsAnimating:NO];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}
- (void)setupLabels {
    if (!self.areLabelsShown) {
        [self.labelOff setAlpha:0.0];
        [self.labelOn setAlpha:0.0];
        return;
    }
    [self.labelOff setAlpha:1.0];
    [self.labelOn setAlpha:1.0];
    CGFloat labelWidth = self.bounds.size.width / 2 - self.padding * 2;
    [self.labelOn setFrame:CGRectMake(0, 0, labelWidth, self.frame.size.height)];
    [self.labelOff setFrame:CGRectMake(self.frame.size.width - labelWidth, 0, labelWidth, self.frame.size.height)];
    [self.labelOn setFont:[UIFont boldSystemFontOfSize:12]];
    [self.labelOff setFont:[UIFont boldSystemFontOfSize:12]];
    [self.labelOn setTextColor:[UIColor whiteColor]];
    [self.labelOff setTextColor:[UIColor whiteColor]];
    
    [self.labelOff sizeToFit];
    [self.labelOff setText:@"Off"];
    [self.labelOn setText:@"On"];
    [self.labelOff setTextAlignment:NSTextAlignmentCenter];
    [self.labelOn setTextAlignment:NSTextAlignmentCenter];
    
    [self insertSubview:self.labelOff belowSubview:self.thumbView];
    [self insertSubview:self.labelOn belowSubview:self.thumbView];
}
- (void)setOnOffImageFrame {
    if (self.onImage == nil || self.offImage == nil) {
        return;
    }
    CGPoint onImageViewCenter = self.onImageView.center;
    onImageViewCenter.x = self.isOn ? (self.onPoint.x + self.thumbView.frame.size.width / 2) : self.frame.size.width;
    [self.onImageView setCenter:onImageViewCenter];
    CGPoint offImageViewCenter = self.offImageView.center;
    offImageViewCenter.x = !self.isOn ? (self.offPoint.x + self.thumbView.frame.size.width / 2) : 0;
    [self.offImageView setCenter:offImageViewCenter];
    [self.onImageView setAlpha:(self.isOn ? 1.0 : 0.0)];
    [self.offImageView setAlpha:(self.isOn ? 0.0 : 1.0)];
}
@end

