//
//  CMDataAdapter.h
//  Country-Map
//
//  Created by Kristian Lien on 1/29/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMDataAdapter : NSObject

+ (NSArray *)convertDataToCountries:(NSArray *)countryData;

@end
