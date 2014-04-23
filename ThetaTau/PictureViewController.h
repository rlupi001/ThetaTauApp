//
//  PictureViewController.h
//  AddressBookPlus
//
//  Created by David Oramas on 4/12/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailViewController;
@interface PictureViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    id currentItem;
}

@property (strong, nonatomic) IBOutlet UIImageView *image;


- (IBAction)takePicture:(id)sender;

- (IBAction)cancel:(id)sender;


- (IBAction)removePicture:(id)sender;

-(id)initWithItem:(id)item;

@property (strong, nonatomic) UIImage * thumb;

@property (strong, nonatomic) NSMutableArray *currentContact;

@property (strong, nonatomic) NSData * rawImageData;

@property (strong, nonatomic) DetailViewController *detailController;



@end
