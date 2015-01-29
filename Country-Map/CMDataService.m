//
//  CMDataService.m
//  Country-Map
//
//  Created by Kristian Lien on 1/27/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CMDataService.h"

#import "CMDataAdapter.h"
#import "NetworkStringConstants.h"

@implementation CMDataService

+ (void)loadCountriesInRegion:(NSString *)region withBlock:(void (^) (NSArray *dataFields, NSError *error)) block
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", kBaseUrlString, kRegionSlug, region];
    NSURL *requestUrl = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *response = (NSArray *)responseObject;
        NSArray *countries = [CMDataAdapter convertDataToCountries:response];
        block(countries, nil);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil, error);
    }];
    
    [operation start];
}

@end
