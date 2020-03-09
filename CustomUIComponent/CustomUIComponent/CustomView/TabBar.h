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

@protocol TabBarDelegate <NSObject>

@optional
- (void)didSelectIndex:(NSInteger)index;

@end

@interface TabBar : UIView

@property (nonatomic, weak) IBOutlet UIView *contentsView;

@property (nonatomic, weak) id<TabBarDelegate> delegate;
@property (nonatomic, weak) id target;

@property (nonatomic) NSInteger selectedSegmentIndex;
@property (nonatomic, readonly) NSInteger segmentsCount;

// Item @[
//    "title":String
//    "viewController":String<UIViewControllerName>
// ]
- (void)initWithItems:(nonnull NSArray <NSDictionary <NSString *, NSString *>*>*)items;

@end

NS_ASSUME_NONNULL_END
