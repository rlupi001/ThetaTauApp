//
//  BrothersViewController.h
//  ThetaTau
//
//  Created by David Oramas on 4/15/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailViewController;
@class EditViewController;
#import "BrothersEntity.h"
@interface BrothersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) NSArray *searchResults;

@property (strong, nonatomic)BrothersEntity *currentItem;

@property (strong, nonatomic) NSArray *brothers;

@property (strong, nonatomic) NSMutableDictionary *families;

@property (strong, nonatomic) EditViewController * editViewController;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *array;
@property (strong, nonatomic) NSMutableArray *allKeys;
@property (strong, nonatomic) NSMutableDictionary *logInInfo;
@property (strong, nonatomic) NSMutableDictionary * fullNamesDict;
@end
