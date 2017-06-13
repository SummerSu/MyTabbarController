//
//  AppDelegate.m
//  MyTabbarController
//
//  Created by 孙苏 on 2017/6/13.
//  Copyright © 2017年 sunsu. All rights reserved.
//

#import "AppDelegate.h"


#import "SecondViewController.h"
#import "ViewController.h"
#import "HJTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //初始化各个控制器
    ViewController *v1 = [[ViewController alloc] init];
    SecondViewController *v2 = [[SecondViewController alloc] init];
    ViewController *v3 = [[ViewController alloc] init];
    SecondViewController *v4 = [[SecondViewController alloc] init];
    SecondViewController *v5 = [[SecondViewController alloc] init];
    v5.view.backgroundColor = [UIColor blueColor];
    
    //初始化tabBarCController
    HJTabBarController *tabBarVc = [[HJTabBarController alloc] init];
    //设置tabBarCController的基本属性
    [tabBarVc addChildVc:@[v1,v2,v3,v4] Titles:@[@"消息",@"联系人",@"发现",@"我的"] TitleColor:[UIColor lightGrayColor] SelectedTitleColor:[UIColor brownColor] ImageNames:@[@"tabbar_mainframe",@"tabbar_contacts",@"tabbar_discover",@"tabbar_me"] SelectedImageNames:@[@"tabbar_mainframeHL",@"tabbar_contactsHL",@"tabbar_discoverHL",@"tabbar_meHL"] HaveNavigationBar:YES];
    //设置tabBarCController的中间按钮
    [tabBarVc tabBarPlusButtonImageName:@"tabbar_discover" SelectedImageName:@"tabbar_discover"];
    //设置tabBarCController的中背景图片
    tabBarVc.tabBarBackRoundImage = [UIImage imageNamed:@"tabbarBkg"];
    //设置点击中间按钮present出来的控制器
    tabBarVc.presentVc = v5;
    self.window.rootViewController = tabBarVc;
    
    
    
    [self.window makeKeyAndVisible];

    return YES;
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"MyTabbarController"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
