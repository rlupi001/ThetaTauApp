//
//  OTMajorAnalysisViewController.m
//  OmegaGammaApp
//
//  Created by ripley vit lupine on 4/20/14.
//  Copyright (c) 2014 ripley vit lupine. All rights reserved.
//

#import "OTMajorAnalysisViewController.h"
#import "DataStore.h"
#import "BrothersEntity.h"
#import "EboardEntity.h"
#import "ChairsEntity.h"

@interface OTMajorAnalysisViewController ()

@end

@implementation OTMajorAnalysisViewController
@synthesize mechTxtField, ElecTxtField, bioTxtField, compTxtField, CSTxtField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Stats", @"Stats");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self calculateStats];
}

-(void)calculateStats
{
    NSInteger mech = 0, elect = 0, compu = 0, bio = 0, cs = 0;
    
    NSMutableArray *arrayOfFrats = [[NSMutableArray alloc] initWithArray:[[DataStore sharedStore] getBrothersWithSort:@"last"]];
    
//    [arrayOfFrats addObjectsFromArray:[[OGDataStore sharedStore] getEboardWithSort:@"last"]];
//    
//    [arrayOfFrats addObjectsFromArray:[[OGDataStore sharedStore] getChairWithSort:@"last"]];
//    
    for(id person in arrayOfFrats)
    {
        NSString *major = [person major]; //get current item major and check for match agregate +1 if match = true
        
        if([major caseInsensitiveCompare:@"mechanical"] == NSOrderedSame)
        {
            mech++;
        }
        else if([major caseInsensitiveCompare:@"electrical"] == NSOrderedSame)
        {
            elect++;
        }
        else if([major caseInsensitiveCompare:@"biomedical"] == NSOrderedSame)
        {
            bio++;
        }
        else if([major caseInsensitiveCompare: @"computer"] == NSOrderedSame)
        {
            compu++;
        }else if ([major caseInsensitiveCompare: @"computer science"] == NSOrderedSame)
        {
            cs++;
        }
        
        mechTxtField.text = [NSString stringWithFormat:@"%i", mech];
        ElecTxtField.text = [NSString stringWithFormat:@"%i",elect];
        bioTxtField.text = [NSString stringWithFormat:@"%i",bio];
        compTxtField.text = [NSString stringWithFormat:@"%i",compu];
        CSTxtField.text = [NSString stringWithFormat:@"%i", cs];
        
        /*
        if([person class] == [BrothersEntity class])
        {
            BrothersEntity *newItem = person;
            if([[newItem major] isEqualToString:@"Mechanical"])
            {
                mech++;
            }
        }
        else if([person class] == [EboardEntity class])
        {
            EboardEntity *newItem = person;
            if([[newItem major] isEqualToString:@"Electrical"])
            {
                elect++;
            }
        }
        else if([person class] == [ChairsEntity class])
        {
            ChairsEntity *newItem = person;
            if([newItem major] isEqualToString:@")
        }
         */
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
