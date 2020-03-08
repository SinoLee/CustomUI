//
//  TabBar.h
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarItem.h"

NS_ASSUME_NONNULL_BEGIN

@class TabBar, TabBarItem;

@protocol TabBarDelegate<NSObject>
@optional
- (void)tabBar:(TabBar *)tabBar didSelectItem:(TabBarItem *)item;
@end

@interface TabBar : UIView

@property (strong, nonatomic) UIView *contentsView;

- (void)addItems:(NSArray <TabBarItem *>*)items;

@end

NS_ASSUME_NONNULL_END
