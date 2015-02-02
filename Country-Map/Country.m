//
//  Country.m
//  Country-Map
//
//  Created by Kristian Lien on 1/27/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Country.h"

@implementation Country

- (instancetype) initWithName:(NSString *)name region:(NSString *)region subRegion:(NSString *)subRegion capital:(NSString *)capital latitude:(double)lat longitude:(double)lng area:(double)area
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.region = region;
        self.subRegion = subRegion;
        self.capital = capital;
        self.latitude = lat;
        self.longitude = lng;
        self.area = area;        
    }
    
    return self;
}

@end
