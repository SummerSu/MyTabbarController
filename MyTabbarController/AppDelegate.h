//
//  AppDelegate.h
//  MyTabbarController
//
//  Created by 孙苏 on 2017/6/13.
//  Copyright © 2017年 sunsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

