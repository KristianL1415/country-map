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
    Country *country = [[Country alloc] initWithName:countryData[kNameKey]
                                              region:countryData[kRegionKey]
                                           subRegion:countryData[kSubRegionKey]
                                             capital:countryData[kCapitalKey]];
    
    return country;
}

@end
