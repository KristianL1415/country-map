//
//  SubRegion.m
//  Country-Map
//
//  Created by Kristian Lien on 2/2/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "SubRegion.h"

@implementation SubRegion

- (instancetype) initWithName:(NSString *)name region:(NSString *)regionName countries:(NSArray *)countries
{
    self = [super init];
    
    if (self)
    {
        _name = name;
        _regionName = regionName;
        _countries = countries.mutableCopy;
    }
    
    return self;
}

@end
