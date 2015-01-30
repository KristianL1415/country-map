//
//  CountryViewController.m
//  Country-Map
//
//  Created by Kristian Lien on 1/30/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CountryViewController.h"

#import "CMDataService.h"

@interface CountryViewController ()

@end

@implementation CountryViewController

#pragma mark - Instance Methods

- (void)loadDataForCountry:(NSString *)country
{
    [CMDataService loadCountriesInRegion:@"africa" withBlock:^(NSArray *data, NSError *error) {
        if (error)
        {
            [self displayError:@"Error Retreiving Data" error:error];            
        }
    }];
}

#pragma mark - Override Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadDataForCountry:@"africa"];
}

@end
