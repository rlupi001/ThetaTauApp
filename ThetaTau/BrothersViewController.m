//
//  BrothersViewController.m
//  ThetaTau
//
//  Created by David Oramas on 4/15/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "BrothersViewController.h"
#import "DetailViewController.h"
#import "EditViewController.h"
#import "DataStore.h"
#define ALPHA = 0;
#define BETA = 1;
#define GAMMA  = 2;
#define DELTA = 3;
#define EPSILON = 4;
#define ZETA = 5;
#define ETA = 6;
#define THETA = 7;

@interface BrothersViewController ()

@end

@implementation BrothersViewController
@synthesize names, searchResults, families, array, allKeys, fullNamesDict, logInInfo;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Brothers", @"Brothers");
        families = [[NSMutableDictionary alloc]init];
        fullNamesDict = [[NSMutableDictionary alloc]init];
        self.logInInfo = [[NSMutableDictionary alloc]init];
        [logInInfo setObject:@"123" forKey:@"OT"];

    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    //Holds all the entities
    names = [[DataStore sharedStore] getBrothersWithSort:@"first"];
    for (BrothersEntity *temp  in names) {
        [fullNamesDict setObject:temp forKey:(NSString*)[NSString stringWithFormat:@"%@ %@",[temp first],[temp last]]];
    }
    
    //holds all the family names
    allKeys = [[NSMutableArray alloc]init];
    
    //Holds a set of all the family names aka keys
    NSMutableSet *set = [[NSMutableSet alloc]init];
    for (BrothersEntity *temp in names) {
        if (![set containsObject:[temp family]]) {
            NSMutableArray * object = [[NSMutableArray alloc]initWithObjects:temp, nil];
            if ([temp family] != NULL) {
                [families setObject:object forKey:[temp family]];
                [set addObject:[temp family]];
            }
            
            ([temp family]!=NULL ?[allKeys addObject:[temp family]]:printf("nil"));
        } else{
            [[families objectForKey:[temp family]]addObject:temp];
        }
        
    }
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewDidAppear:(BOOL)animated{
    names = [[DataStore sharedStore] getBrothersWithSort:@"first"];
    allKeys = [[NSMutableArray alloc]init];
    array = [[NSMutableArray alloc]init];
    NSMutableSet *set = [[NSMutableSet alloc]init];
    for (BrothersEntity *temp in names) {
        if (![set containsObject:[temp family]]) {
            NSMutableArray * object = [[NSMutableArray alloc]initWithObjects:temp, nil];
            if ([temp family] != NULL) {
                [families setObject:object forKey:[temp family]];
                [set addObject:[temp family]];
                
            }
          
            ([temp family]!=NULL ?[allKeys addObject:[temp family]]:printf("nil"));
            
        } else{
            [[families objectForKey:[temp family]]addObject:temp];
        }
        
    }
[self.tableView reloadData];
 
}
- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alert alertViewStyle] == UIAlertViewStyleLoginAndPasswordInput)
    {
       
        if ([[self.logInInfo objectForKey:[[alert textFieldAtIndex:0] text]] isEqual:[[alert textFieldAtIndex:1] text]]) {
            
            BrothersEntity *item = [[DataStore sharedStore] createBrother];
            
            EditViewController *EVC = [[EditViewController alloc] initWithItem:item];
            [EVC setNewEntry:YES];
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

    
    

//    if (!self.editViewController) {
//        self.editViewController = [[EditViewController alloc] initWithNibName:@"EditViewController" bundle:nil];
//        
//    }
//    
//    
//    NSArray *initArray = [NSArray arrayWithObjects:@"", @"", @"", @"", [NSDate date],@"", nil];
//    
//    // [self.detailViewController newContactDetails];
//    
//    [self.navigationController pushViewController:self.editViewController animated:YES];
    //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Search function methods
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    NSMutableArray *allData = [[NSMutableArray alloc] init];
    for (BrothersEntity *temp in [[DataStore sharedStore] getBrothersWithSort:@"first"]) {
        [allData addObject:[NSString stringWithFormat:@"%@ %@",[temp first],[temp last]]];
        
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

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView){
        return 1;
    }
    return [allKeys count];
}




- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        printf(" count: %d for section %d" ,[[families objectForKey:[allKeys objectAtIndex:section]]count] ,section );
        return [[families objectForKey:[allKeys objectAtIndex:section]]count];
        
    }
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSUInteger section = [indexPath section];
  //  NSUInteger row = [indexPath row];
	
//    NSString *key = [keys objectAtIndex:section];
//    NSArray *nameSection = [data objectForKey:key];
	
    // static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"Brothers"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Brothers"];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else {
        
       // BrothersEntity *item = [names objectAtIndex:[indexPath row]];
        NSArray *entities = [families objectForKey:[allKeys objectAtIndex:[indexPath section]]];
       // NSLog(@"%@", entities);
        BrothersEntity *item = [entities objectAtIndex:[indexPath row]];
        [[cell textLabel] setText:[NSString stringWithFormat:@"%@ %@",[item first],[item last]]];
         //[NSString stringWithFormat:@"%@ %@",[item first],[item last]]];
       // [[cell detailTextLabel] setText:[item major]];

    }
   
    
    
    
    
    
    
    
        
    return cell;
}

- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   BrothersEntity *item ;
    
    if (tableView == self.searchDisplayController.searchResultsTableView){
     
        item = [fullNamesDict objectForKey:[searchResults objectAtIndex:[indexPath row]]];
    
    }else{
    NSArray *entities = [families objectForKey:[allKeys objectAtIndex:[indexPath section]]];
    
        item = [entities objectAtIndex:[indexPath row]];
    
    }
   
    DetailViewController *DVC = [[DetailViewController alloc] initWithItem:item];
    [[self navigationController] pushViewController:DVC animated:YES];

    
    
    //UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:detailView];
//    [navController setModalPresentationStyle:UIModalPresentationFormSheet];
//    [navController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
   // [self presentViewController:navController animated:YES completion:nil];

    
 
    
    
    
    //Retrieve the current selected city
    
    
    
   
    
    // NSString *rowValue = self.homeMenu[indexPath.row];
    
    //    NSString *alertViewMessage = [[NSString alloc]initWithFormat:@"You selected %@", rowValue];
    //
    //    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Row Selected" message:alertViewMessage delegate:nil cancelButtonTitle:@"Yes I did" otherButtonTitles:nil];
    //
    //    [alert show];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView){
        return @"Results";
    }
    
    return [allKeys objectAtIndex:section];
}

-(void)refreshTable
{
    [[DataStore sharedStore] saveChanges];
    [self.tableView reloadData];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshTable];
}

@end
