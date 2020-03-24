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
@property (strong, nonatomic) IBInspectable UIColor *offTintColor;
@property (strong, nonatomic) IBInspectable UIColor *onTintColor;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
    // thumb properties
@property (strong, nonatomic) IBInspectable UIColor *thumbTintColor;
@property (nonatomic) IBInspectable CGFloat thumbCornerRadius;
@property (nonatomic) IBInspectable CGSize thumbSize;
@property (strong, nonatomic) IBInspectable UIImage *thumbImage;
    // dodati kasnije
@property (strong, nonatomic) IBInspectable UIColor *thumbShadowColor;
@property (nonatomic) IBInspectable CGSize thumbShadowOffset;
@property (nonatomic) IBInspectable CGFloat thumbShaddowRadius;
@property (nonatomic) IBInspectable CGFloat thumbShaddowOppacity;

- (instancetype)initWithCoder:(NSCoder *)coder;

@end

NS_ASSUME_NONNULL_END
