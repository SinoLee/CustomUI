//
//  TabBarItem.h
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TabBarItemDelegate <NSObject>

@optional
- (void)segmentItemViewControllerMoveTo:(UIViewController *)viewController;

@end

#pragma mark - SegmentItemViewController
@interface SegmentItemViewController : UIViewController

@property (nonatomic, weak) id<TabBarItemDelegate> delegate;

@end

#pragma mark - TabBarItem
@interface TabBarItem : UIControl

@property (nonatomic, strong) NSString *storyboardName;
@property (nonatomic, strong) NSString *viewControllerName;

@property (nonatomic, weak, readonly) UIView *view;
@property (nonatomic) NSInteger index;

- (instancetype)initWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
