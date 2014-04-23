//
//  DetailViewController.h
//  ThetaTau
//
//  Created by David Oramas on 4/15/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrothersEntity.h"
@interface DetailViewController : UITableViewController
{

 id currentItem;
}

@property(strong, nonatomic) IBOutlet UIView *headerView;


@property (strong, nonatomic) IBOutlet UIImageView *photo;

@property (strong, nonatomic) IBOutlet UILabel *fName;
 
@property (strong, nonatomic) IBOutlet UILabel *lName;

-(UIView *) headerView;

-(id)initWithItem:(id)item;

@property (strong, nonatomic) NSMutableDictionary *logInInfo;

@end
