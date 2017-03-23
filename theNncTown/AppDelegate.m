//
//  AppDelegate.m
//  theNncTown
//
//  Created by lanren on 16/12/1.
//  Copyright © 2016年 com.nnctown. All rights reserved.
//

#import "AppDelegate.h"
#import "leftClass.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = WHITECOLOR;
    [self.window makeKeyAndVisible];
    [self addRootViewController];
    return YES;
}
- (void)addRootViewController{
    self.mainVC = [baseTabBarViewController loadTabBarController];
    leftClass *leftVC = [[leftClass alloc] init];
    _mainMenu = [[ITRAirSideMenu alloc] initWithContentViewController:self.mainVC leftMenuViewController:leftVC];
    _mainMenu.backgroundImage = [YBYTheNncTown imageWithColor:COLOR(62, 65, 71, 1.0)];
    //optional delegate to receive menu view status
    _mainMenu.delegate = leftVC;
    //content view shadow properties
    _mainMenu.contentViewShadowColor = [UIColor blackColor];
    _mainMenu.contentViewShadowOffset = CGSizeMake(0, 0);
    _mainMenu.contentViewShadowOpacity = 0.6;
    _mainMenu.contentViewShadowRadius = 12;
    _mainMenu.contentViewShadowEnabled = YES;
    
    //content view animation properties
    _mainMenu.contentViewScaleValue = 0.9f;
    _mainMenu.contentViewRotatingAngle = 20.0f;
    _mainMenu.contentViewTranslateX = 350.0f;
    
    //menu view properties
    _mainMenu.menuViewRotatingAngle = 60.0f;
    _mainMenu.menuViewTranslateX = 50.0f;
    
    self.window.rootViewController = _mainMenu;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
