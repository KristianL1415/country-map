//
//  CMMapViewExtension.m
//  Country-Map
//
//  Created by Kristian Lien on 2/2/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CMMapViewExtension.h"

@implementation CMMapViewExtension

+ (MKCoordinateRegion)getRegionForCountryCoordinate:(CLLocationCoordinate2D)countryCoordinate withArea:(double)area mapView:(MKMapView *)mapView
{
    double areaModifier = 0.6;
    double minimumZoom = 200000.0;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(countryCoordinate, (area * areaModifier) + minimumZoom, (area * areaModifier) + minimumZoom);
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion];
    
    return adjustedRegion;
}

+ (MKCoordinateRegion)getRegionForCountries:(NSArray *)countries mapView:(MKMapView *)mapView
{
    double latitude = 0.0;
    double longitude = 0.0;
    double minLatitude = 90.0;
    double maxLatitude = -90.0;
    double minLongitude = 180.0;
    double maxLongitude = -180.0;
    
    for (Country *country in countries)
    {
        latitude += country.latitude;
        longitude += country.longitude;
        
        //FIXME: This might be a flawed approach with negative values
        if (country.latitude > maxLatitude)
        {
            maxLatitude = country.latitude;
        }
        if (country.latitude < minLatitude)
        {
            minLatitude = country.latitude;
        }
        if (country.longitude > maxLongitude)
        {
            maxLongitude = country.latitude;
        }
        if (country.latitude < minLongitude)
        {
            minLongitude = country.latitude;
        }
    }
    
    latitude /= [countries count];
    longitude /= [countries count];
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    CLLocationDistance latDistance = [self getLatitudinalDistanceFromLatitude:minLatitude toLatitude:maxLatitude];
    CLLocationDistance longDistance = [self getLongitudinalDistanceFromLongitude:minLongitude toLongitude:maxLongitude];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(center, latDistance, longDistance);
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion];
    
    return adjustedRegion;
}

+ (CLLocationDistance)getLatitudinalDistanceFromLatitude:(CLLocationDegrees)latitude1 toLatitude:(CLLocationDegrees)latitude2
{
    CLLocation *firstLat = [[CLLocation alloc] initWithLatitude:latitude1 longitude:0.0];
    CLLocation *secondLat = [[CLLocation alloc] initWithLatitude:latitude2 longitude:0.0];
    
    CLLocationDistance distance = [firstLat distanceFromLocation:secondLat];
    
    return distance;
}

+ (CLLocationDistance)getLongitudinalDistanceFromLongitude:(CLLocationDegrees)longitude1 toLongitude:(CLLocationDegrees)longitude2
{
    CLLocation *firstLong = [[CLLocation alloc] initWithLatitude:0.0 longitude:longitude1];
    CLLocation *secondLong = [[CLLocation alloc] initWithLatitude:0.0 longitude:longitude2];
    
    CLLocationDistance distance = [firstLong distanceFromLocation:secondLong];
    
    return distance;
}

@end
