//
//  BACViewController.m
//  ThetaTau
//
//  Created by David Oramas on 3/26/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "BACViewController.h"
#import "DetailViewController.h"
#import "DataStore.h"
#import "EditViewController.h"


@interface BACViewController ()

@end

@implementation BACViewController

@synthesize data, Chairs, keys, searchResults, logInInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Boards", @"Boards");
        self.logInInfo = [[NSMutableDictionary alloc]init];
        [logInInfo setObject:@"123" forKey:@"OT"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    keys = [[DataStore sharedStore] getEboardWithSort:@"first"];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;

}

//- (void)viewDidAppear:(BOOL)animated{
//   keys = [[DataStore sharedStore] getEboardWithSort:@"first"];
//    //[super viewWillAppear:animated];
//    [self refreshTable];
//
//}
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    NSMutableArray *allData = [[NSMutableArray alloc] init];
    for (BrothersEntity *temp in keys) {
        [allData addObject:temp.first];
           }
    
   NSLog(@"%@", allData);
    
    
    searchResults = [allData filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}
- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
     if ([alert alertViewStyle] == UIAlertViewStyleLoginAndPasswordInput)
    {
        NSLog(@"Login: %@", [[alert textFieldAtIndex:0] text]);
        NSLog(@"Login: %@", [[alert textFieldAtIndex:0] text]);
        if ([[self.logInInfo objectForKey:[[alert textFieldAtIndex:0] text]] isEqual:[[alert textFieldAtIndex:1] text]]) {
            
            EboardEntity *item = [[DataStore sharedStore] createEboardMember];
            
            EditViewController *EVC = [[EditViewController alloc] initWithItem:item];
            [EVC setNewEntry:YES ];
            [[self navigationController] pushViewController:EVC animated:YES];
        }
       
       
    }
}

- (void)insertNewObject:(id)sender
{
    // Login and password alert
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login"
                                                    message:[NSString stringWithFormat:@"Enter Login ID and Password:"]
                                                   delegate:self cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    
    [alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    [alert show];
    
//    while ((!alert.hidden) && (alert.superview != nil))
//    {
//        [[NSRunLoop currentRunLoop] limitDateForMode:NSDefaultRunLoopMode];
//    }

   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}




- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [keys count];
        
    }

    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"EBoards"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EBoards"];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else {
        EboardEntity *item = [keys objectAtIndex:[indexPath row]];
        NSLog(@"%@", keys);
        [[cell textLabel] setText:[NSString stringWithFormat:@"%@ %@",[item first],[item last]]];
        [[cell detailTextLabel] setText:[item position]];
        
    }

    
    
   
    
     
    
    return cell;
}

- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EboardEntity *item = [[[DataStore sharedStore] getEboardWithSort:@"first"] objectAtIndex:[indexPath row]];
    DetailViewController *DVC = [[DetailViewController alloc] initWithItem:item];
    
    [[self navigationController] pushViewController:DVC animated:YES];
    
    
        
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//     NSString *key = [keys objectAtIndex:section];
//    return key;
    if (section == 0) {
        return @"Boards";
    }
    return @"Chairs";
}

-(void)refreshTable
{
    [[DataStore sharedStore] saveChanges];
    [self.tableView reloadData];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    keys = [[DataStore sharedStore] getEboardWithSort:@"first"];
    [self refreshTable];
}




@end
