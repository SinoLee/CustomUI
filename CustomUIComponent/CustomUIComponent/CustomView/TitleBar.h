//
//  TitleBar.h
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TitleBar : UIView

@property (strong, nonatomic) UIView *actionView;

- (void)setTitle:(nullable NSString *)title;
- (void)setTarget:(id)target backAction:(SEL)action;

@end

NS_ASSUME_NONNULL_END
