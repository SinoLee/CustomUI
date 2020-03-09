//
//  TabBarItem.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "TabBarItem.h"

#pragma mark - SegmentItemViewController
@implementation SegmentItemViewController

@end

#pragma mark - TabBarItem

@interface TabBarItem ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *underLine;

@property (nonatomic, strong) UIViewController *viewController;

@end

@implementation TabBarItem

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        // Init Label
        [self initializeView];
        [self setTitle:title];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title viewController:(NSString *)viewControllerName {
    self = [super init];
    if (self) {
        [self initializeView];
        [self setTitle:title];
        [self setViewControllerName:viewControllerName];
    }
    return self;
}

#pragma mark - Initialize View

- (void)initializeView {
    [self addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.titleLabel
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem:self.titleLabel
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1
                                      constant:-12.0],
    ]];
    
    // Init Underline
    [self addSubview:self.underLine];
    self.underLine.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:self.underLine
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem:self.underLine
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1
                                      constant:-4.0],
        [NSLayoutConstraint constraintWithItem:self.underLine
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeHeight
                                    multiplier:1
                                      constant:4.0],
        [NSLayoutConstraint constraintWithItem:self.underLine
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeWidth
                                    multiplier:1
                                      constant:-16.0]
    ]];
    self.selected = NO;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [_titleLabel setFont:[UIFont systemFontOfSize:20]];
        [_titleLabel setTextColor:[UIColor grayColor]];
    }
    return _titleLabel;
}

- (UIView *)underLine {
    if (!_underLine) {
        _underLine = [[UIView alloc] initWithFrame:CGRectZero];
        [_underLine setBackgroundColor:[UIColor whiteColor]];
    }
    return _underLine;
}

#pragma mark -

- (void)setTitle:(NSString *)title {
    [self.titleLabel setText:title];
}

- (void)setSelected:(BOOL)selected {
    NSLog(@"# selected item : %@, %@", self.titleLabel.text, selected ? @"YES" : @"NO");
    [self.titleLabel setTextColor:((selected) ? [UIColor blackColor] : [UIColor grayColor])];
    [self.underLine setBackgroundColor:((selected) ? [UIColor colorWithWhite:220/255.f alpha:1.f] : [UIColor whiteColor])];
}

- (UIViewController *)viewController {
    if (!_viewController && self.viewControllerName) {
        NSString *storyboardName = self.storyboardName ?: @"Main";
        _viewController = [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateViewControllerWithIdentifier:self.viewControllerName];
    }
    return _viewController;
}

- (UIView *)view {
    return self.viewController.view;
}

@end
