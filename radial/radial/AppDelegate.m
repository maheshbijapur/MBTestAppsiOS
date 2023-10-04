//
//  AppDelegate.m
//  radial
//
//  Created by Mahesh.Bijapur on 8/21/18.
//  Copyright © 2018 Mahesh.Bijapur. All rights reserved.
//

#import "AppDelegate.h"
#import <MarketoFramework/MarketoFramework.h>
#import <UserNotifications/UserNotifications.h>
#import "SecondViewController.h"

#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate
//application:openURL:sourceApplication:annotation

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [paths firstObject];
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    NSString *defaultsPath = [libraryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"Preferences/%@.plist", bundleIdentifier]];

    NSLog(@"%@", defaultsPath);
    
    NSLog(@"NSHomeDirectory ; %@", NSHomeDirectory());
    Marketo *sharedInstance = [Marketo sharedInstance];
    
//    [sharedInstance initializeWithMunchkinID:@"997-MMJ-095"
//                                   appSecret:@"Q1hvYXp5V3E0MXVITTlVcDczVjZ4YlRx"
//                         mobileFrameworkType:@"native"
//                               launchOptions:launchOptions];
    
//    [sharedInstance initializeWithMunchkinID:@"288-JRG-219"
//                                   appSecret:@"RG1HVHFRN0JiWUU4a0tKcVdSYWdDTTJ2"
//                         mobileFrameworkType:@"native"
//                               launchOptions:launchOptions];
    
//    [sharedInstance initializeWithMunchkinID:@"528-FEX-444"
//                                   appSecret:@"WFlPakVHY3FtaXNCcEZ0dnc4Q3hnV2gx"
//                         mobileFrameworkType:@"native"
//                               launchOptions:launchOptions];
    
    
    [sharedInstance initializeWithMunchkinID:@"544-IYX-931"
                                   appSecret:@"TGptcEN1WTc4WDFRSXdNWkJ5b2dmV2tU"
                         mobileFrameworkType:@"native"
                               launchOptions:launchOptions];
    
    NSLog(@"callled marketo");
    
//    [sharedInstance initializeWithMunchkinID:@"997-MMJ-095"
//                                   appSecret:@"Q1hvYXp5V3E0MXVITTlVcDczVjZ4YlRx"
//                         mobileFrameworkType:@"native"
//                               launchOptions:launchOptions];
    
//    [sharedInstance initializeWithMunchkinID:@"849-BHY-433"
//                                   appSecret:@"ZjRWbG03UTV2alVBU0x0V01CaDFyR3lk"
//                         mobileFrameworkType:@"native"
//                               launchOptions:launchOptions];

    [self registerForRemoteNotifications];
    
    return YES;
}

- (void)registerForRemoteNotifications {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
            if(!error){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[UIApplication sharedApplication] registerForRemoteNotifications];
                });
            }
            else{
                NSLog(@"failed");
            }
        }];
}

//Called when a notification is delivered to a foreground app.
-(void)userNotificationCenter:(UNUserNotificationCenter *)center
      willPresentNotification:(UNNotification *)notification
        withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    NSLog(@"User Info : %@",notification.request.content.userInfo);
    NSLog(@"Radial App userNotificationCenter ");
//    [[Marketo sharedInstance] handlePushNotification:notification.request.content.userInfo];
    completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);
    
}

//Called to let your app know which action was selected by the user for a given notification.
//-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler{
//
//    NSLog(@"Radial App notificationuserNotificationCenter ");
//    NSLog(@"User Info : %@",response.notification.request.content.userInfo);
//    [[Marketo sharedInstance] application:nil didReceiveLocalNotification:completionHandler];
//    completionHandler();
//}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void(^)(void))completionHandler {
    NSLog(@"User Info : %@",response.notification.request.content.userInfo);
    NSLog(@"Radial App notificationuserNotificationCenter ---- 2 ");
    [[Marketo sharedInstance] userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:completionHandler];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    
}
//-(BOOL)application:(UIApplication *)application
//           openURL:(NSURL *)url
//           options:(NSDictionary *)options{
//    NSLog(@"openURL");
//    
//    NSString* host= [url host];
//    if([host isEqualToString:@"com.onboardmd"]){
//        if([[url path] isEqualToString:@"/Financing"]){
//            NSLog(@"openURL Financing");
//            [self.mainController setViewControllers:@[[[SecondViewController alloc] init]] animated:YES];
//        }
//        else{
//            NSLog(@"openURL Non Financing");
////            [self.mainController setViewControllers:@[[[SecondViewController alloc] init]] animated:YES];
//        }
//        return NO;
//    }
//    return [[Marketo sharedInstance] application:application
//                                         openURL:url
//                               sourceApplication:nil
//                                      annotation:nil];
//}
- (void)openURL:(NSURL *)url
        options:(NSDictionary<UIApplicationOpenExternalURLOptionsKey, id> *)options
completionHandler:(void (^)(BOOL success))completion{
    NSLog(@"openURL new");
}

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSLog(@"openURL");

    NSString* host= [url host];

    if([host isEqualToString:@"financial"]){

        if([[url path] isEqualToString:@"/structure"]){
            [self.mainController setViewControllers:@[[[SecondViewController alloc] init]] animated:YES];
        }
        else{
            [self.mainController setViewControllers:@[[[SecondViewController alloc] init]] animated:YES];
        }
        return NO;

    }
    return [[Marketo sharedInstance] application:app
                                         openURL:url
                                         options:options];
    
//    return [[Marketo sharedInstance] application:app openURL:url sourceApplication:nil annotation:nil];
    return true;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Register the push token with Marketo
    [[Marketo sharedInstance] registerPushDeviceToken:deviceToken];
}


//- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
//{
//    NSLog(@"Radial App notification : %@", notification);
//
//    NSLog(@"Radial App  notification.fireDate: %@", notification.fireDate);
//    [[Marketo sharedInstance] application:application didReceiveLocalNotification:notification];
//}




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
    NSLog(@"applicationWillTerminate");
//    [[Marketo sharedInstance] unregisterPushDeviceToken];
}


-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"didFailToRegisterForRemoteNotificationsWithError");
}
@end
