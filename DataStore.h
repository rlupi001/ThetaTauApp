//
//  DataStore.h
//  ThetaTau
//
//  Created by Ripley Lupine on 4/18/14.
//  Copyright (c) 2014 Ripley Lupine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BrothersEntity, EboardEntity, ChairsEntity;
@interface DataStore : NSObject
{
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

//dataitem singleton
+(DataStore *)sharedStore;

//methods to create new objects for coredata entities
-(BrothersEntity *)createBrother;
-(EboardEntity *)createEboardMember;
-(ChairsEntity *)createChairMember;

//methods to return an array of data from coredata entities and sort by first,last, ect..
-(NSArray *)getBrothersWithSort:(NSString *)attributeToSortBy;
-(NSArray *)getEboardWithSort:(NSString *)attributeToSortBy;
-(NSArray *)getChairWithSort:(NSString *)attributeToSortBy;

-(void)saveChanges;
-(void)deleteItem:(id)item;

@end
