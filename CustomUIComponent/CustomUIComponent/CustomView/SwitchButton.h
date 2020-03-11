//
//  SwitchButton.h
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/11.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface SwitchButton : UIControl


@property (nonatomic) IBInspectable BOOL isOn;
@property (nonatomic) IBInspectable CGFloat padding;
@property (nonatomic) IBInspectable UIColor *onTintColor;
@property (nonatomic) IBInspectable UIColor *offTintColor;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable UIColor *thumbTintColor;
@property (nonatomic) IBInspectable CGFloat thumbCornerRadius;
@property (nonatomic) IBInspectable CGSize thumbSize;
@property (nonatomic) IBInspectable UIImage *thumbImage;

@property (nonatomic) IBInspectable UIColor *thumbShadowColor;
@property (nonatomic) IBInspectable CGSize thumbShadowOffset;
@property (nonatomic) IBInspectable CGFloat thumbShadowRadius;
@property (nonatomic) IBInspectable CGFloat thumbShadowOpacity;


@end

NS_ASSUME_NONNULL_END
