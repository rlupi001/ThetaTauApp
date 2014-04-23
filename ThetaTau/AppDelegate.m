//
//  AppDelegate.m
//  ThetaTau
//
//  Created by David Oramas on 3/24/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "AppDelegate.h"
#import "BrothersViewController.h"
#import "BACViewController.h"
#import "RushViewController.h"
#import "ViewController.h"
#import "BACViewController.h"
#import "BrothersEntity.h"
#import "DataStore.h"
#import "EboardEntity.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    BrothersViewController * BVC = [[BrothersViewController alloc] initWithNibName:@"BrothersViewController" bundle:nil];
    RushViewController * RVC = [[RushViewController alloc] initWithNibName:@"RushViewController" bundle:nil];
    BACViewController *BAC = [[BACViewController alloc]initWithNibName:@"BACViewController" bundle:nil];
    OTMajorAnalysisViewController *OTMAVC = [[OTMajorAnalysisViewController alloc]initWithNibName:@"OTMajorAnalysisViewController" bundle:nil];
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    UINavigationController *brothersNavController = [[UINavigationController alloc]initWithRootViewController:BVC];
    UINavigationController *BACNavController = [[UINavigationController alloc]initWithRootViewController:BAC];
  //  UINavigationController *rushNavController = [[UINavigationController alloc]initWithRootViewController:BAC];
    self.tabBarController.viewControllers = @[brothersNavController, RVC, BACNavController, OTMAVC];
    self.window.rootViewController = self.tabBarController;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"firstRun"])
    {
        [defaults setObject:[NSDate date] forKey:@"firstRun"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self loadBrothersDataFromPropertyList];
        [self loadBoardsDataFromPropertyList];
    }
    
    //self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)loadBrothersDataFromPropertyList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"initialBrothers" ofType:@"plist"];
    NSArray *items = [NSArray arrayWithContentsOfFile:path];
    
    for (int i = 0; i<items.count; i++) {
        BrothersEntity *temp = [[DataStore sharedStore]createBrother];
        [temp setFirst:[[items objectAtIndex:i] objectAtIndex:0]];
        [temp setLast:[[items objectAtIndex:i] objectAtIndex:1]];
        [temp setMajor:[[items objectAtIndex:i] objectAtIndex:2]];
        [temp setFamily:[[items objectAtIndex:i] objectAtIndex:3]];
        [temp setRollnumber:[[items objectAtIndex:i] objectAtIndex:4]];
        
    }
  [[DataStore sharedStore]saveChanges];

   }
- (void)loadBoardsDataFromPropertyList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"initialEboards" ofType:@"plist"];
    NSArray *items = [NSArray arrayWithContentsOfFile:path];
    
    for (int i = 0; i<items.count; i++) {
         EboardEntity *temp = [[DataStore sharedStore]createEboardMember];
         [temp setFirst:[[items objectAtIndex:i] objectAtIndex:0]];
         [temp setLast:[[items objectAtIndex:i] objectAtIndex:1]];
         [temp setMajor:[[items objectAtIndex:i] objectAtIndex:2]];
         [temp setFamily:[[items objectAtIndex:i] objectAtIndex:3]];
         [temp setRollnumber:[[items objectAtIndex:i] objectAtIndex:4]];
        
    }
    [[DataStore sharedStore]saveChanges];
    
}

-(NSManagedObjectModel *)sharedModel
{
    if(!sharedModel)
    {
        sharedModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    }
    
    return sharedModel;
}

-(NSManagedObjectContext *)sharedContext
{
    if(!sharedContext)
    {
        NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self sharedModel]];
        
        NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [documentsDirectories objectAtIndex:0];
        NSString *path = [documentDirectory stringByAppendingPathComponent:@"store.data1111"];
        NSURL *sqlURL = [NSURL fileURLWithPath:path];
        
        NSError *error = nil;
        
        //creates atabase at file path above
        if(![coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlURL options:nil error:&error])
        {
            NSLog(@"ERROR");
        }
        
        //generate context
        sharedContext = [[NSManagedObjectContext alloc] init];
        
        //connect our context to our coordinator
        [sharedContext setPersistentStoreCoordinator:coordinator];
        [sharedContext setUndoManager:nil];
        
    }
    return sharedContext;
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
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
