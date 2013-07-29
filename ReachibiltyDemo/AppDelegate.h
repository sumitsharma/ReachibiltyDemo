//
//  AppDelegate.h
//  ReachibiltyDemo
//
//  Created by Magnon International on 29/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FirstVC;
@class Reachability;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    UINavigationController *navigationController;
    FirstVC *objFirstVC;
    
    Reachability* hostReach;
    Reachability* internetReach;
    Reachability* wifiReach;
}

@property (strong, nonatomic) UIWindow *window;


@end
