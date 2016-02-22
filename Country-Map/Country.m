//
//  Country.m
//  Country-Map
//
//  Created by Kristian Lien on 1/27/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Country.h"

@implementation Country

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
    {
        // TODO Integrate JSONModel or Mantle
        _name = dictionary[@"name"];
        _region = dictionary[@"region"];
        _subRegion = dictionary[@"sub_region"];
        _capital = dictionary[@"capital"];
        _latitude = dictionary[@"lat"];
        _longitude = dictionary[@"lng"];
        _area = dictionary[@"area"];
    }
    
    return self;
}

- (instancetype) initWithName:(NSString *)name region:(NSString *)region subRegion:(NSString *)subRegion capital:(NSString *)capital latitude:(double)lat longitude:(double)lng area:(double)area
{
    self = [super init];
    
    if (self)
    {
        _name = name;
        _region = region;
        _subRegion = subRegion;
        _capital = capital;
        _latitude = @(lat);
        _longitude = @(lng);
        _area = @(area);
    }
    
    return self;
}

@end
