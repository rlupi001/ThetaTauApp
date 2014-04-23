//
//  BoardAndChairsViewController.m
//  ThetaTau
//
//  Created by David Oramas on 3/26/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "BoardAndChairsViewController.h"

@interface BoardAndChairsViewController ()

@end

@implementation BoardAndChairsViewController

@synthesize tabBarController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarController = [[UITabBarController alloc]init];
       
       // [self.tabBarController setViewControllers:@[viewController1, navigationController]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
