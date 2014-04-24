//
//  DataStore.m
//  ThetaTau
//
//  Created by Ripley Lupine on 4/18/14.
//  Copyright (c) 2014 Ripley Lupine. All rights reserved.
//

#import "DataStore.h"
#import "AppDelegate.h"
#import "BrothersEntity.h"
#import "EboardEntity.h"
#import "ChairsEntity.h"

@implementation DataStore

//singleton for data store
+(DataStore *)sharedStore
{
    static DataStore *sharedStore = nil;
    if(!sharedStore)
    {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

-(id)init
{
    self = [super init];
    
    //get context and model from appdelegate
    if(self)
    {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        context = [appDelegate sharedContext];
        model = [appDelegate sharedModel];
    }
    return self;
}


//create empty item for detail view..
-(BrothersEntity *)createBrother
{
    BrothersEntity *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"BrothersEntity" inManagedObjectContext:context];
    
    return newItem;
}

//create empty item for detail view..
-(EboardEntity *)createEboardMember
{
    EboardEntity *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"EboardEntity" inManagedObjectContext:context];
    
    return newItem;
}

//create empty item for detail view..
-(ChairsEntity *)createChairMember
{
    ChairsEntity *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"ChairsEntity" inManagedObjectContext:context];
    
    return newItem;
}

//get array from coredata sorted by parameter given
-(NSArray *)getBrothersWithSort:(NSString *)attributeToSortBy
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [[model entitiesByName] objectForKey:@"BrothersEntity"];
    [request setEntity:description];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:attributeToSortBy ascending:YES];
    
    NSError *error = nil;
    
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if(error)
    {
        NSLog(@"Error Occured While Adding New Brother: %@", [error localizedDescription]);
    }
    
    return result;
}

-(NSArray *)getChairWithSort:(NSString *)attributeToSortBy
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [[model entitiesByName] objectForKey:@"ChairsEntity"];
    [request setEntity:description];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:attributeToSortBy ascending:YES];
    
    NSError *error = nil;
    
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if(error)
    {
        NSLog(@"Error Occured While Adding New Chair: %@", [error localizedDescription]);
    }
    
    return result;
}

-(NSArray *)getEboardWithSort:(NSString *)attributeToSortBy
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [[model entitiesByName] objectForKey:@"EboardEntity"];
    [request setEntity:description];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:attributeToSortBy ascending:YES];
    
    NSError *error = nil;
    
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if(error)
    {
        NSLog(@"Error Occured While Adding New Eboard: %@", [error localizedDescription]);
    }
    
    return result;
}

-(void)deleteItem:(id)item
{
    //check type of class and assign and delete
    if([item class] == [BrothersEntity class])
    {
        BrothersEntity *itemDel = item;
        [context deleteObject:itemDel];
    }
    else if([item class] == [EboardEntity class])
    {
        EboardEntity *itemDel = item;
        [context deleteObject:itemDel];
    }
    else
    {
        ChairsEntity *itemDel = item;
        [context deleteObject:itemDel];
    }
}

-(void)saveChanges
{
    //save all changes to coredata
    NSError *error = nil;
    [context save:&error];
    if(error)
    {
        NSLog(@"Error occured while saving %@", [error localizedDescription]);
    }
    
}

@end

