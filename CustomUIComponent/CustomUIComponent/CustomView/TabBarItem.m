//
//  TabBarItem.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "TabBarItem.h"
#import <UIKit/UIKit.h>

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
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [_titleLabel setFont:[UIFont systemFontOfSize:20]];
        [_titleLabel setText:title];
        [_titleLabel setTextColor:[UIColor grayColor]];
        [self addSubview:_titleLabel];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
            [NSLayoutConstraint constraintWithItem:_titleLabel
                                         attribute:NSLayoutAttributeCenterX
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:self
                                         attribute:NSLayoutAttributeCenterX
                                        multiplier:1
                                          constant:0],
            [NSLayoutConstraint constraintWithItem:_titleLabel
                                         attribute:NSLayoutAttributeBottom
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:self
                                         attribute:NSLayoutAttributeBottom
                                        multiplier:1
                                          constant:-12.0],
        ]];
        
        // Init Underline
        _underLine = [[UIView alloc] initWithFrame:CGRectZero];
        [_underLine setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:_underLine];
        _underLine.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint activateConstraints:@[
            [NSLayoutConstraint constraintWithItem:_underLine
                                         attribute:NSLayoutAttributeCenterX
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:self
                                         attribute:NSLayoutAttributeCenterX
                                        multiplier:1
                                          constant:0],
            [NSLayoutConstraint constraintWithItem:_underLine
                                         attribute:NSLayoutAttributeBottom
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:self
                                         attribute:NSLayoutAttributeBottom
                                        multiplier:1
                                          constant:-4.0],
            [NSLayoutConstraint constraintWithItem:_underLine
                                         attribute:NSLayoutAttributeHeight
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:nil
                                         attribute:NSLayoutAttributeHeight
                                        multiplier:1
                                          constant:4.0],
            [NSLayoutConstraint constraintWithItem:_underLine
                                         attribute:NSLayoutAttributeWidth
                                         relatedBy:NSLayoutRelationEqual
                                            toItem:self
                                         attribute:NSLayoutAttributeWidth
                                        multiplier:1
                                          constant:-16.0]
        ]];
        self.selected = NO;
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    NSLog(@"# selected item : %@, %@", self.titleLabel.text, selected ? @"YES" : @"NO");
    [self.titleLabel setTextColor:((selected) ? [UIColor blackColor] : [UIColor grayColor])];
    [self.underLine setBackgroundColor:((selected) ? [UIColor colorWithWhite:220/255.f alpha:1.f] : [UIColor whiteColor])];
}

- (UIViewController *)viewController {
    if (!_viewController && self.viewControllerName) {
        NSString *storyboardName = self.storyboardName ?: @"ModeSetting";
        _viewController = [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateViewControllerWithIdentifier:self.viewControllerName];
    }
    return _viewController;
}

- (UIView *)view {
    return self.viewController.view;
}

@end
