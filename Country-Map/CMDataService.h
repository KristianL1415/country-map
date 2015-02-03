//
//  CMDataService.h
//  Country-Map
//
//  Created by Kristian Lien on 1/27/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

@interface CMDataService : NSObject

+ (void)loadSubRegionsInRegion:(NSString *)region withBlock:(void (^) (NSArray *dataFields, NSError *error)) block;
+ (void)loadCountriesInRegion:(NSString *)region withBlock:(void (^) (NSArray *dataFields, NSError *error)) block;
+ (void)loadCountriesInSubRegion:(NSString *)subRegion withBlock:(void (^) (NSArray *dataFields, NSError *error)) block;

@end
