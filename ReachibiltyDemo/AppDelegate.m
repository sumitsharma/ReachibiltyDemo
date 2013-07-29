//
//  AppDelegate.m
//  ReachibiltyDemo
//
//  Created by Magnon International on 29/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstVC.h"
#import "Reachability.h"


@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    objFirstVC=[[FirstVC alloc] initWithNibName:@"FirstVC" bundle:nil];
    navigationController=[[UINavigationController alloc] initWithRootViewController:objFirstVC];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

//Called by Reachability whenever status changes.
- (void) reachabilityChanged: (NSNotification* )note
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
	
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    switch (netStatus)
    {
        case ReachableViaWWAN:
        {
            [self showAlert:@"Connected Via WAN"];
            break;
        }
        case ReachableViaWiFi:
        {
            [self showAlert:@"Connected Via WiFi"];
            break;
        }
        case NotReachable:
        {
            [self showAlert:@"We are unable to make a internet connection at this time. Some functionality will be limited until a connection is made."];
            break;
        }
    }
}




- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    internetReach = [[Reachability reachabilityForInternetConnection] retain];
	[internetReach startNotifier];
    
    NetworkStatus netStatus = [internetReach currentReachabilityStatus];
    
    switch (netStatus)
    {
        case ReachableViaWWAN:
        {
            [self showAlert:@"Via WAN"];
            break;
        }
        case ReachableViaWiFi:
        {
            [self showAlert:@"via Wifi"];
            break;
        }
        case NotReachable:
        {
            [self showAlert:@"We are unable to make a internet connection at this time. Some functionality will be limited until a connection is made."];
            break;
        }
            
    }
}

-(void)showAlert :(NSString *)strmsg{
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"Reachibility" message:strmsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
