//
//  TabBar.m
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import "TabBar.h"

@interface TabBar ()
@property (strong, nonatomic) NSArray *tabBarItems;

@end

@implementation TabBar

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}
- (void)addItems:(NSArray <TabBarItem *>*)items {
    NSInteger count = self.tabBarItems.count + items.count;
    NSLog(@"# TabBar items : %ld", count);
    for (TabBarItem *item in items) {
        
    }
}

@end
