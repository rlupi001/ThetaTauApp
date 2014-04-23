//
//  BACViewController.h
//  ThetaTau
//
//  Created by David Oramas on 3/26/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EboardEntity.h"

@interface BACViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) NSMutableDictionary *data;
@property(strong, nonatomic) NSMutableDictionary *Chairs;
@property(strong, nonatomic) NSArray *keys;

@property (strong, nonatomic) NSArray *searchResults;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableDictionary *logInInfo;


@end
