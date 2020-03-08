//
//  ModeAndAutomationViewController.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "ModeAndAutomationViewController.h"
#import "TitleBar.h"
#import "TabBar.h"
//#import "CustomTabbar.h"

@interface ModeAndAutomationViewController () <UITabBarDelegate>
@property (weak, nonatomic) IBOutlet TitleBar *titleBar;
@property (weak, nonatomic) IBOutlet TabBar *tabBar;

@end

@implementation ModeAndAutomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.titleBar setTitle:@"Title"];
    [self.titleBar setTarget:self backAction:@selector(goBack)];
    
    [self.tabBar addItems:@[
        [[TabBarItem alloc] initWithTitle:@"Mode" viewController:@"ModeViewController"],
        [[TabBarItem alloc] initWithTitle:@"Automation" viewController:@"AutomationViewController"],
    ]];
}

#pragma mark - Initialize

#pragma mark -
- (void)goBack {
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
}

- (void)tabBar:(UITabBar *)tabBar willBeginCustomizingItems:(NSArray<UITabBarItem *> *)items {
    
}

- (void)tabBar:(UITabBar *)tabBar didBeginCustomizingItems:(NSArray<UITabBarItem *> *)items {
    
}

- (void)tabBar:(UITabBar *)tabBar willEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed {
    
}

- (void)tabBar:(UITabBar *)tabBar didEndCustomizingItems:(NSArray<UITabBarItem *> *)items changed:(BOOL)changed {
    
}

@end
