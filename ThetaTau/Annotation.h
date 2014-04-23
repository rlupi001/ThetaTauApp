//
//  Annotation.h
//  ThetaTau
//
//  Created by David Oramas on 4/18/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;



@end
