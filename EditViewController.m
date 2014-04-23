//
//  EditViewController.m
//  ThetaTau
//
//  Created by David Oramas on 4/16/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "EditViewController.h"
#import "BrothersViewController.h"
#import "PictureViewController.h"
#import "BrothersEntity.h"
#import "EboardEntity.h"
#import "ChairsEntity.h"
#import "DataStore.h"
#import "AppDelegate.h"


@interface EditViewController ()

@end

@implementation EditViewController

@synthesize photo, infoFields , newEntry;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    //The next 3 lines of codes deal with recognizing tapping the image
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedImage:)];
    
    tapGestureRecognizer.delegate = self;
    
    [self.photo addGestureRecognizer:tapGestureRecognizer];
    
    self.photo.userInteractionEnabled = YES; // default is no for UIImageView

}
- (void)viewDidAppear:(BOOL)animated
{
    [[infoFields objectAtIndex:0] setText: [currentItem first]];
    [[infoFields objectAtIndex:1] setText: [currentItem last]];
    [[infoFields objectAtIndex:2] setText: [currentItem email]];
    [[infoFields objectAtIndex:3] setText: [currentItem major]];
    [[infoFields objectAtIndex:4] setText: [currentItem rollnumber]];
    [[infoFields objectAtIndex:5] setText: [currentItem family]];
    
    UIImage *imageToDisplay;
    
    UIImage * CI = [currentItem image]? [currentItem image] : NULL;
    if (CI != NULL) {
        
    
    imageToDisplay = [UIImage imageWithCGImage:[CI CGImage] scale:1.0 orientation:UIImageOrientationRight];
    }
    [self.photo setImage:(imageToDisplay!= NULL ? imageToDisplay: [UIImage imageNamed:@"placeholder.png"])];

}

- (void)tappedImage:(UIGestureRecognizer *)gestureRecognizer{
    
    printf("here");
    
    if (((UITextField*)[infoFields objectAtIndex:1]).text != NULL) {
        
        
        
        [currentItem setLast:[[infoFields objectAtIndex:0] text]];
        
        [currentItem setFirst:[[infoFields objectAtIndex:1] text]];
        
        [currentItem setEmail:[[infoFields objectAtIndex:2] text]];
        
        [currentItem setMajor:[[infoFields objectAtIndex:3] text]];
        
        [currentItem setRollnumber:[[infoFields objectAtIndex:4] text]];
        
        [currentItem setFamily:[[infoFields objectAtIndex:5] text]];
        
    }
    
    PictureViewController *PVC = [[PictureViewController alloc]initWithItem:currentItem];
    
    
    
    [PVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    [self presentViewController:PVC animated:YES completion:nil];


   // [self.navigationController :PVC animated:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    switch ([textField tag]) {
        case 0:
            
            [[self.infoFields objectAtIndex:1] becomeFirstResponder];
            [currentItem setLast:[[infoFields objectAtIndex:0] text]];
            break;
        case 1:
            // [currentContact addObject:textField.text];
            [[infoFields objectAtIndex:2] becomeFirstResponder];
            [currentItem setFirst:[[infoFields objectAtIndex:1] text]];
            break;
        case 2:
            //  [currentContact addObject:textField.text];
            [[infoFields objectAtIndex:3] becomeFirstResponder];
            [currentItem setEmail:[[infoFields objectAtIndex:2] text]];
            break;
        case 3:
            //  [currentContact addObject:textField.text];
            [[infoFields objectAtIndex:4] becomeFirstResponder];
            [currentItem setMajor:[[infoFields objectAtIndex:3] text]];
            break;
        case 4:
             [[infoFields objectAtIndex:5] becomeFirstResponder];
            [currentItem setRollnumber:[[infoFields objectAtIndex:4] text]];
            break;
        case 5:
            [[infoFields objectAtIndex:5] resignFirstResponder];
            [currentItem setFamily:[[infoFields objectAtIndex:5] text]];
        default:
            break;
    }
    return YES;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    self.scrollView.contentSize = self.contentView.bounds.size;
}

//Really sleek way of intercepting the back button on a navigation controller
-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
        if (((UITextField*)[infoFields objectAtIndex:0]).text == NULL && newEntry) {
            [[DataStore sharedStore] deleteItem:currentItem];
            printf("deleting");
        }
    
        
        

        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(id)sender {
    
    if (((UITextField*)[infoFields objectAtIndex:1]).text != NULL) {
        
    
    
    [currentItem setLast:[[infoFields objectAtIndex:0] text]];
    
    [currentItem setFirst:[[infoFields objectAtIndex:1] text]];
    
    [currentItem setEmail:[[infoFields objectAtIndex:2] text]];
    
    [currentItem setMajor:[[infoFields objectAtIndex:3] text]];
    
    [currentItem setRollnumber:[[infoFields objectAtIndex:4] text]];
    
    [currentItem setFamily:[[infoFields objectAtIndex:5] text]];
    
        [currentItem setImage:self.photo.image];
    }else{
        [[DataStore sharedStore] deleteItem:currentItem]; 
    }
    [[self presentingViewController] dismissViewControllerAnimated:YES
completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
         [[DataStore sharedStore] deleteItem:currentItem];
         [[self navigationController] popToRootViewControllerAnimated:YES ];
    }
   
   
    
    
    
}

- (IBAction)deleteButton:(id)sender {
    
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Delete Entry"
                          message:@"Are you sure?"
                          delegate:self
                          cancelButtonTitle:@"OK."
                          otherButtonTitles:@"Cancel",nil];
    [alert show];
    while ((!alert.hidden) && (alert.superview != nil))
    {
        [[NSRunLoop currentRunLoop] limitDateForMode:NSDefaultRunLoopMode];
    }
    

}
@end
