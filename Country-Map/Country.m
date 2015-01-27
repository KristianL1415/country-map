//
//  Country.m
//  Country-Map
//
//  Created by Kristian Lien on 1/27/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "Country.h"

@implementation Country

- (instancetype) initWithName:(NSString *)name region:(NSString *)region subRegion:(NSString *)subRegion capital:(NSString *)capital
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.region = region;
        self.subRegion = subRegion;
        self.capital = capital;
    }
    
    return self;
}

@end
