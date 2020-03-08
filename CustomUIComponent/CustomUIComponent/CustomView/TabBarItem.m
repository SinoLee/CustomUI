//
//  TabBarItem.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "TabBarItem.h"
#import <UIKit/UIKit.h>

@interface TabBarItem ()

@property (strong, nonatomic) UIViewController *viewController;
@property (weak, nonatomic) UIView *view;

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *viewControllerName;

@end

@implementation TabBarItem

- (instancetype)initWithTitle:(NSString *)title viewController:(NSString *)viewController {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
