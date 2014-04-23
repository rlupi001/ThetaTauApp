//
//  PledgesViewController.h
//  ThetaTau
//
//  Created by David Oramas on 3/27/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PledgesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong, nonatomic) NSMutableDictionary *pledges;


@end
