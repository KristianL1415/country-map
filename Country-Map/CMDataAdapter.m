//
//  CMDataAdapter.m
//  Country-Map
//
//  Created by Kristian Lien on 1/29/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CMDataAdapter.h"

#import "NetworkStringConstants.h"
#import "SubRegion.h"
#import "Country.h"

@implementation CMDataAdapter

+ (NSArray *)convertDataToSubRegions:(NSArray *)countryData
{
    NSMutableArray *subRegions = [[NSMutableArray alloc] init];
    
    for (NSDictionary *country in countryData)
    {
        BOOL subRegionExists = NO;
        
        // Check if subregion already exists
        for (SubRegion *subRegion in subRegions)
        {
            NSString *curSubRegionName = country[kSubRegionKey];
            
            // If yes, add country to the subregion
            if ([curSubRegionName isEqualToString:subRegion.name])
            {
                Country *curCountry = [self convertDataToCountry:country];
                [subRegion.countries addObject:curCountry];
                subRegionExists = YES;
            }
        }
        // Otherwise add new subregion
        if (subRegionExists == NO)
        {
            SubRegion *newSubRegion = [self convertDataToSubRegion:country];
            [subRegions addObject:newSubRegion];
        }
    }
    
    return subRegions;
}

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

#pragma mark - Private Methods

+ (SubRegion *)convertDataToSubRegion:(NSDictionary *)countryData
{
    NSString *name = countryData[kSubRegionKey];
    NSString *regionName = countryData[kRegionKey];
    
    Country *country = [self convertDataToCountry:countryData];
    NSArray *countries = [[NSArray alloc] initWithObjects:country, nil];
    
    SubRegion *subRegion = [[SubRegion alloc] initWithName:name region:regionName countries:countries];
    
    return subRegion;
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
