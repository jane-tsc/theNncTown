//
//  AppDelegate.h
//  theNncTown
//
//  Created by lanren on 16/12/1.
//  Copyright © 2016年 com.nnctown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITRAirSideMenu.h"
#import "baseTabBarViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) ITRAirSideMenu *mainMenu;
@property (nonatomic, strong) baseTabBarViewController *mainVC;
- (void)addRootViewController;
@end

