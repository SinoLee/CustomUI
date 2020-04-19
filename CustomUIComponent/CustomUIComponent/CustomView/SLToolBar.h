//
//  SLToolBar.h
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/04/18.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SLButtonAlignment) {
    SLButtonAlignmentLeft      = 0,
    SLButtonAlignmentCenter    = 1,
    SLButtonAlignmentRight     = 2,
};

IB_DESIGNABLE
@interface SLToolBar : UIView

@property (nonatomic, assign) IBInspectable NSInteger buttonCount;
//@property (nonatomic, assign) IBInspectable SLButtonAlignment alignment;

@property (nonatomic, assign) IBInspectable CGFloat padding;

@property (nonatomic, copy)   IBInspectable UIColor *buttonColor;

@property (nonatomic, copy)   IBInspectable NSString *title;

@end

NS_ASSUME_NONNULL_END
