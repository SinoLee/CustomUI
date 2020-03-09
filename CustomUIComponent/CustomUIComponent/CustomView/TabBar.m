//
//  TabBar.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "TabBar.h"

#pragma mark - TabBar

@interface TabBar ()

@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) NSArray <TabBarItem *>*segmentItems;

@end

@implementation TabBar

- (void)initWithItems:(nonnull NSArray <NSDictionary <NSString *, NSString *>*>*)items {
    _segmentsCount = items.count;
    _selectedSegmentIndex = NSIntegerMax;
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    CGFloat itemOffsetX = 0;
    CGFloat itemWidth = self.bounds.size.width / items.count;
    CGFloat itemHeight = self.bounds.size.height;
    TabBarItem *prevItem = nil;
    NSMutableArray *newItems = [NSMutableArray array];
    for (NSDictionary *item in items) {
        CGRect frame = CGRectMake(itemOffsetX, 0, itemWidth, itemHeight);
        prevItem = [self addItem:item frame:frame nearView:prevItem];
        prevItem.index = newItems.count;
        [prevItem.view setHidden:YES];
        [self.contentsView addSubview:prevItem.view];
        [newItems addObject:prevItem];
        itemOffsetX += itemWidth;
    }
    self.segmentItems = [NSArray arrayWithArray:newItems];
    [self setSelectedSegmentIndex:0];
}

- (TabBarItem *)addItem:(NSDictionary *)item frame:(CGRect)frame nearView:(UIView *)view {
    TabBarItem *segmentItem = [[TabBarItem alloc] initWithTitle:item[@"title"]];
    [segmentItem setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:segmentItem];
    segmentItem.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [NSLayoutConstraint constraintWithItem:segmentItem
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeTop
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem:segmentItem
                                     attribute:NSLayoutAttributeBottom
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem:segmentItem
                                     attribute:NSLayoutAttributeLeading
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:(view != nil) ? view : self
                                     attribute:(view != nil) ? NSLayoutAttributeTrailing : NSLayoutAttributeLeading
                                    multiplier:1
                                      constant:0],
        [NSLayoutConstraint constraintWithItem:segmentItem
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeWidth
                                    multiplier:(1.0/(CGFloat)self.segmentsCount)
                                      constant:0]
    ]];
    
    [segmentItem setViewControllerName:item[@"viewController"]];
    [segmentItem setStoryboardName:item[@"storyboard"]];
    [segmentItem addTarget:self action:@selector(touchUpSegmentItem:) forControlEvents:UIControlEventTouchUpInside];
    return segmentItem;
}

- (void)touchUpSegmentItem:(TabBarItem *)sender {
    NSLog(@"# Show current view -- : %ld", sender.index);
    [self setSelectedSegmentIndex:sender.index];
    if ([self.delegate respondsToSelector:@selector(didSelectIndex:)]) {
        [self.delegate didSelectIndex:sender.index];
    }
}

- (void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex {
    if (self.segmentItems.count > selectedSegmentIndex && _selectedSegmentIndex != selectedSegmentIndex) {
        UIView *prevSelectedView = nil;
        if (_selectedSegmentIndex != NSIntegerMax) {
            prevSelectedView = self.segmentItems[_selectedSegmentIndex].view;
            [self.segmentItems[_selectedSegmentIndex] setSelected:NO];
        }
        [self.segmentItems[selectedSegmentIndex] setSelected:YES];
        
        UIView *currSelectedView = self.segmentItems[selectedSegmentIndex].view;

        [prevSelectedView setHidden:YES];
        [currSelectedView setHidden:NO];
        [currSelectedView setFrame:self.contentsView.bounds];
        
        _selectedSegmentIndex = selectedSegmentIndex;
    }
}

- (void)moveTo:(UIViewController *)viewController {
//    if ([self.delegate respondsToSelector:@selector(moveTo:)]) {
//        [self.delegate moveTo:viewController];
//    }
}

@end
