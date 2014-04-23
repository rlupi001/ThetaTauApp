//
//  PictureViewController.m
//  AddressBookPlus
//
//  Created by David Oramas on 4/12/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "PictureViewController.h"
#import "DetailViewController.h"
#import "BrothersEntity.h"
#import "EboardEntity.h"
#import "ChairsEntity.h"
@interface PictureViewController ()

@end

@implementation PictureViewController
@synthesize image,  thumb, currentContact;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.image.image = self.thumb;
    }
    return self;
}
-(id)initWithItem:(id)item
{
    self = [super init];
    if(self)
    {
        if([item class] == [BrothersEntity class])
        {
            currentItem = (BrothersEntity*) item;
            
        }
        else if([item class] == [EboardEntity class])
        {
            currentItem =  (EboardEntity*) item;
            
        }
        else
        {
            currentItem = (ChairsEntity *) item;
            
        }
        
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.image.image = [currentItem image];
}

- (void)viewDidAppear:(BOOL)animated{
    
    self.image.image = [currentItem image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePicture:(id)sender {
    
    UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];
    
    //check if device has camera
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [cameraController setSourceType:UIImagePickerControllerSourceTypeCamera];
    }else
    {
        [cameraController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [cameraController setDelegate:self];
    
    [self presentViewController: cameraController animated: YES completion: nil];

}

- (IBAction)cancel:(id)sender {
    
    [currentItem setImage:self.image.image];
    
    [[self presentingViewController] dismissViewControllerAnimated:YES
                                                        completion:nil];
}

- (IBAction)removePicture:(id)sender {
    
    [self.image setImage:[UIImage imageNamed:@"placeholder"]];
    
    
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *photo = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.thumb = photo;
    
    [image setImage: thumb];
    [currentItem setImage:thumb];
  //  = UIImageJPEGRepresentation(photo, 0.5);
    
   // self.thumb = [UIImage imageWithData:self.rawImageData];
   // self.image.image = self.thumb;
    
    
    
   // self.currentContact[5] = (self.rawImageData != nil ? self.rawImageData : @"");
      // [self.detailController.image setImage:self.image.image];
    
    //[self.image setNeedsDisplay];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
