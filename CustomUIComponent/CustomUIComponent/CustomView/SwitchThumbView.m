//
//  SwitchThumbView.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/11.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "SwitchThumbView.h"

@interface SwitchThumbView()

@end

@implementation SwitchThumbView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.thumbImageView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self addSubview:self.thumbImageView];
    }
    return self;
}

- (UIImageView *)thumbImageView {
    if (!_thumbImageView) {
        _thumbImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _thumbImageView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.thumbImageView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.thumbImageView.layer setCornerRadius:self.layer.cornerRadius];
    [self.thumbImageView setClipsToBounds:self.clipsToBounds];
}

@end
