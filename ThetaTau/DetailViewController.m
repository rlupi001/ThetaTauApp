//
//  DetailViewController.m
//  ThetaTau
//
//  Created by David Oramas on 4/15/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "DetailViewController.h"
#import "EditViewController.h"
#import "ChairsEntity.h"
#import "BrothersViewController.h"
#import "EditViewController.h"
#import "EboardEntity.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize headerView, photo, fName, lName, logInInfo;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.logInInfo = [[NSMutableDictionary alloc]init];
        [logInInfo setObject:@"123" forKey:@"OT"];
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
   // [self.photo setImage:[currentItem image]];
    [self.fName setText:[currentItem first]];
    [self.lName setText:[currentItem last]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonPressed:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void) viewDidAppear:(BOOL)animated
{
    [self.fName setText:[currentItem first]];
    [self.lName setText:[currentItem last]];
    UIImage * CI = [currentItem image];
    UIImage *imageToDisplay;
    if (CI != NULL) {
        
     imageToDisplay = [UIImage imageWithCGImage:[CI CGImage] scale:1.0 orientation:UIImageOrientationRight];
    }
    [self.photo setImage:(imageToDisplay!= NULL ? imageToDisplay: [UIImage imageNamed:@"placeholder.png"])];
}

- (void) viewWillAppear:(BOOL)animated{
    
    [self.tableView reloadData];
}

- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alert alertViewStyle] == UIAlertViewStyleLoginAndPasswordInput)
    {
        NSLog(@"Login: %@", [[alert textFieldAtIndex:0] text]);
        NSLog(@"Login: %@", [[alert textFieldAtIndex:0] text]);
        if ([[self.logInInfo objectForKey:[[alert textFieldAtIndex:0] text]] isEqual:[[alert textFieldAtIndex:1] text]]) {
            
            
            
            EditViewController *EVC = [[EditViewController alloc]initWithItem:currentItem];
            [[self navigationController] pushViewController:EVC animated:YES];
        }
        
        NSLog(@"Password: %@", [[alert textFieldAtIndex:1] text]);
    }
}

- (void) editButtonPressed:(id)sender{
    // Login and password alert
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login"
                                                    message:[NSString stringWithFormat:@"Enter Login ID and Password:"]
                                                   delegate:self cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    
    [alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    [alert show];
    
    
    
    //[self.navigationController setModalPresentationStyle:UIModalPresentationFormSheet];
    
   // [self presentViewController:EVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.headerView;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.headerView.bounds.size.height;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    switch ([indexPath row]) {
        case 0:
            [[cell textLabel] setText:[NSString stringWithFormat:@"E-mail: %@", ([currentItem email]!=NULL ? [currentItem email]: @"")]];
            break;
        case 1:
            [[cell textLabel] setText:[NSString stringWithFormat:@"Major: %@", ([currentItem major]!=NULL ? [currentItem major]: @"")]];
            break;
        case 2:
            [[cell textLabel] setText:[NSString stringWithFormat:@"Roll #: %@", ([currentItem rollnumber]!=NULL ? [currentItem rollnumber]: @"")]];
            break;
        case 3:
            [[cell textLabel] setText:[NSString stringWithFormat:@"Family: %@",([currentItem family]!=NULL ? [currentItem family]: @"")]];
        default:
            break;
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
      *detailViewController = [[ alloc] initWithNibName:@"" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
