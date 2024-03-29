//
//  AppDelegate.h
//  Dijkstra
//
//  Created by kkgn06 on 2013/02/09.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate> {
    UIWindow *window_;
    UINavigationController *navController_;

    CCDirectorIOS *director_;                            // weak ref
}

@property(nonatomic, retain) UIWindow *window;
@property(readonly) UINavigationController *navController;
@property(readonly) CCDirectorIOS *director;

@end
