//
//  ViewController.h
//  ThetaTau
//
//  Created by David Oramas on 3/24/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray * homeMenu;

@property (strong, nonatomic) NSArray *controllersArray;


@end
