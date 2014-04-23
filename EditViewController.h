//
//  EditViewController.h
//  ThetaTau
//
//  Created by David Oramas on 4/16/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrothersEntity.h"
@class PictureViewController;
@interface EditViewController : UIViewController<UIGestureRecognizerDelegate, UITextFieldDelegate, UIAlertViewDelegate>
{
 id currentItem;
}

@property (nonatomic) BOOL newEntry;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *contentView;


@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *infoFields;

@property (strong, nonatomic) IBOutlet UIImageView *photo;


- (IBAction)doneButton:(id)sender;


- (IBAction)deleteButton:(id)sender;

-(id)initWithItem:(id)item;
@end
