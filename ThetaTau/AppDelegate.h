//
//  AppDelegate.h
//  ThetaTau
//
//  Created by David Oramas on 3/24/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrothersViewController.h"
#import <CoreData/CoreData.h>
#import "OTMajorAnalysisViewController.h"
@class ViewController;


@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    NSManagedObjectModel *sharedModel;
    NSManagedObjectContext *sharedContext;
    BrothersViewController *broEntity;

}

-(NSManagedObjectContext *) sharedContext;
-(NSManagedObjectModel *) sharedModel;


@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) ViewController *viewController;

@end
