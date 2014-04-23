//
//  ViewController.m
//  ThetaTau
//
//  Created by David Oramas on 3/24/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "ViewController.h"
#import "RushViewController.h"
#import "BACViewController.h"
#import "BrothersViewController.h"
#import "LocationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize homeMenu;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.homeMenu = @[@"Board & Chairs", @"Rush", @"Brothers", @"Family Lines", @"Gallery", @"Local History", @"National History", @"FAQ"];
    
    self.title = @"Home";
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    BACViewController *BACController = [[BACViewController alloc]init];
    BACController.title = @"Boards and Chairs";
    
    [array addObject:BACController];
    

	
    RushViewController *rushController = [[RushViewController alloc]init];
    rushController.title = @"Rush";
    
    [array addObject:rushController];
    
    BrothersViewController *brothersController = [[BrothersViewController alloc]init];
    brothersController.title = @"Brothers";
    
    [array addObject:brothersController];
    
    LocationViewController *LVC = [[LocationViewController alloc] init];
    
    [array addObject:LVC];

    self.controllersArray = array;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 - (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.homeMenu count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * HomeTable = @"HomeTableView";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeTable];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HomeTable];
    }
    cell.textLabel.text = self.homeMenu[indexPath.row];
    
    return cell;
}

- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   // UIViewController *RVC = [[BACViewController alloc]init];
    
    
    
    //Retrieve the current selected city
    UIViewController *RVC = [self.controllersArray objectAtIndex:indexPath.row];
    
    
    [self.navigationController pushViewController:RVC animated:YES];

   // NSString *rowValue = self.homeMenu[indexPath.row];
    
//    NSString *alertViewMessage = [[NSString alloc]initWithFormat:@"You selected %@", rowValue];
//    
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Row Selected" message:alertViewMessage delegate:nil cancelButtonTitle:@"Yes I did" otherButtonTitles:nil];
//    
//    [alert show];
    
}




@end













