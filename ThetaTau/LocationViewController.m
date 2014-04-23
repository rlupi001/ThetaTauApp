//
//  LocationViewController.m
//  ThetaTau
//
//  Created by David Oramas on 4/18/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "LocationViewController.h"
#import <MapKit/MapKit.h>
@interface LocationViewController ()

@end

@implementation LocationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Create our MapView defaulf iphone: width 320 height 480
    MKMapView * mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    mapView.mapType = MKMapTypeStandard;
    
    mapView.zoomEnabled = YES;
    mapView.scrollEnabled = YES;
    mapView.showsUserLocation = YES;
    
    //Add MKMapview object as a subview to main view
    
    [self.view addSubview:mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
