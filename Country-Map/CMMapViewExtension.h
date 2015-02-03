//
//  CMMapViewExtension.h
//  Country-Map
//
//  Created by Kristian Lien on 2/2/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#import "Country.h"

@interface CMMapViewExtension : NSObject

+ (MKCoordinateRegion)getRegionForCountryCoordinate:(CLLocationCoordinate2D)countryCoordinate withArea:(double)area mapView:(MKMapView *)mapView;
+ (MKCoordinateRegion)getRegionForCountries:(NSArray *)countries mapView:(MKMapView *)mapView;

@end
