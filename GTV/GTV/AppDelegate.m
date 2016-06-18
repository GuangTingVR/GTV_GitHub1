//
//  AppDelegate.m
//  GTV
//
//  Created by 梁艳广 on 16/5/29.
//  Copyright © 2016年 guangting. All rights reserved.
//

#import "AppDelegate.h"
#import "SettingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    sleep(1.5);
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //状态栏颜色
    [UIApplication  sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //[[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    _window.backgroundColor = [UIColor whiteColor];
    MainTabBarViewController *main = [[MainTabBarViewController alloc]init];
    SettingViewController *setting = [[SettingViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:setting];
    //nav.title = @"我的";
    //nav.navigationBar.tintColor = [UIColor whiteColor];
    MMDrawerController * drawer = [[MMDrawerController alloc]initWithCenterViewController:main leftDrawerViewController:nav];
    drawer.maximumLeftDrawerWidth = SCREEN_W;
    drawer.openDrawerGestureModeMask = MMOpenDrawerGestureModePanningNavigationBar;
    drawer.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    _window.rootViewController = drawer;
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
