//
//  RushLocationsViewController.m
//  ThetaTau
//
//  Created by David Oramas on 4/17/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "RushLocationsViewController.h"
#import "Annotation.h"
@interface RushLocationsViewController ()
@property (nonatomic, strong) UIBarButtonItem *flipButton;
@end

@implementation RushLocationsViewController
@synthesize mapView, navbar ;

//Wimbledon Coordinates
#define BBQ_LATITUDE 25.7685318;
#define BBQ_LONGITUDE -80.3664279;

//Stadium coordinates
#define MEET_AND_GREET_LATITUDE 25.7543269;
#define MEET_AND_GREET_LONGITUDE -80.3707987;

#define POOL_NIGHT_LATITUDE 25.7877375;
#define POOL_NIGHT_LONGITUDE -80.3812518;

//Span
#define THE_SPAN .1f; //30% of one degree


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate= self;
    [locationManager startUpdatingLocation];
    self.navbar.barStyle = UIStatusBarStyleBlackTranslucent;
    
    //Create a region
    MKCoordinateRegion myRegion ;
    
    //Center
    CLLocationCoordinate2D center;
    center.latitude = locationManager.location.coordinate.latitude;
    center.longitude = locationManager.location.coordinate.longitude;
    
    //Span
    MKCoordinateSpan  span;
    span.latitudeDelta = THE_SPAN;
    span.longitudeDelta = THE_SPAN;
    
    myRegion.center = center;
    myRegion.span = span;
    
    //Set mapView
    [mapView setRegion:myRegion animated:YES];
    
    //Annotations
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    Annotation *myAnn;
    
    //BBQ annotation
    myAnn = [[Annotation alloc] init];
    location.latitude = BBQ_LATITUDE;
    location.longitude = BBQ_LONGITUDE;
    myAnn.coordinate = location;
    myAnn.title = @"BBQ: Meet the Brothers";
    myAnn.subtitle = @"Wed Jan 8, 1:30-3:30";
    
    [locations addObject:myAnn];
    
    //Meet and Greet annotation
    myAnn = [[Annotation alloc] init];
    location.latitude = MEET_AND_GREET_LATITUDE;
    location.longitude = MEET_AND_GREET_LONGITUDE;
    myAnn.coordinate = location;
    myAnn.title = @"Meet and Greet @ Chilli's";
    myAnn.subtitle = @"Fri Jan 10, 5:00-7:00";
    
    [locations addObject:myAnn];
    
    //Pool Night annotation
    myAnn = [[Annotation alloc] init];
    location.latitude = POOL_NIGHT_LATITUDE;
    location.longitude = POOL_NIGHT_LONGITUDE;
    myAnn.coordinate = location;
    myAnn.title = @"Pool Night @ Dave & Busters";
    myAnn.subtitle = @"Thu Jan 16, 5:30-8:30";
    
    [locations addObject:myAnn];

    
    
   /* //1. Create a coordinate for use with the annotation.
    CLLocationCoordinate2D wimblocation;
    wimblocation.latitude = WIMB_LATITUDE;
    wimblocation.longitude = WIMB_LONGITUDE;
    
    
    Annotation *myAnnotation = [Annotation alloc];
    myAnnotation.coordinate = wimblocation;
    myAnnotation.title = @"Wimbledon";
    myAnnotation.subtitle = @"Home of Koeneig";
    
    [self.mapView addAnnotation:myAnnotation]; */
//self.mapView.userLocation

   [self.mapView addAnnotations:locations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
   
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
}
@end
