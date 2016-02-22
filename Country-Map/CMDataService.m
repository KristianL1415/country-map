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

+ (void)loadSubRegionsInRegion:(NSString *)region withBlock:(void (^) (NSArray *dataFields, NSError *error)) block
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", kBaseUrlString, kRegionSlug, region];
    AFHTTPRequestOperation *operation = [self createOperationWithUrlString:urlString];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *response = (NSArray *)responseObject;
        NSArray *subRegions = [CMDataAdapter convertDataToSubRegions:response];
        block(subRegions, nil);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil, error);
    }];
    
    [operation start];
}

+ (void)loadCountriesInSubRegion:(NSString *)subRegion withBlock:(void (^) (NSArray *dataFields, NSError *error)) block
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", kBaseUrlString, kSubRegionSlug, subRegion];
    AFHTTPRequestOperation *operation = [self createOperationWithUrlString:urlString];
    
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

#pragma mark - Private Methods

+ (AFHTTPRequestOperation *)createOperationWithUrlString:(NSString *)urlString
{
    NSURL *requestUrl = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    return operation;
}

@end
