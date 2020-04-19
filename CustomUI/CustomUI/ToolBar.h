//
//  ToolBar.h
//  CustomUI
//
//  Created by Taeyoun Lee on 2020/04/19.
//  Copyright © 2020 Sino. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface ToolBar : UIView

@property (nonatomic, copy) IBInspectable NSString *button1Title;
@property (nonatomic, copy) IBInspectable NSString *button2Title;

//@property (strong, nonatomic)
@property (strong, nonatomic) void (^block)(void);

@end

NS_ASSUME_NONNULL_END
