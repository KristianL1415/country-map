//
//  CMDataAdapter.m
//  Country-Map
//
//  Created by Kristian Lien on 1/29/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CMDataAdapter.h"

#import "NetworkStringConstants.h"
#import "Country.h"

@implementation CMDataAdapter

+ (NSArray *)convertDataToCountries:(NSArray *)countryData
{
    NSMutableArray *countries = [[NSMutableArray alloc] init];
    
    for (NSDictionary *country in countryData)
    {
        Country *currentCountry = [self convertDataToCountry:country];
        [countries addObject:currentCountry];
    }
    
    return countries;
}

+ (Country *)convertDataToCountry:(NSDictionary *)countryData
{
    double lat = 0.0;
    double lng = 0.0;
    double area = 0.0;
    
    if ([countryData[kLatLngKey] count] > 0)
    {
        lat = [[countryData[kLatLngKey] objectAtIndex:0] doubleValue];
        lng = [[countryData[kLatLngKey] objectAtIndex:1] doubleValue];
    }
    if (countryData[kAreaKey] != (id)[NSNull null])
    {
        area = [countryData[kAreaKey] doubleValue];
    }
    
    Country *country = [[Country alloc] initWithName:countryData[kNameKey]
                                              region:countryData[kRegionKey]
                                           subRegion:countryData[kSubRegionKey]
                                             capital:countryData[kCapitalKey]
                                            latitude:lat
                                           longitude:lng
                                                area:area];
    
    return country;
}

@end
