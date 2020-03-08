//
//  TabBarItem.h
//  CustomUIComponent
//
//  Created by Taeyoun Lee on 2020/03/07.
//  Copyright © 2020 SinoLab. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



@interface TabBarItem : NSObject

- (instancetype)initWithTitle:(NSString *)title viewController:(NSString *)viewController;

@end

NS_ASSUME_NONNULL_END
