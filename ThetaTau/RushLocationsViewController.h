//
//  RushLocationsViewController.h
//  ThetaTau
//
//  Created by David Oramas on 4/17/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RushLocationsViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet UINavigationBar *navbar;


- (IBAction)backButton:(id)sender;


@end
