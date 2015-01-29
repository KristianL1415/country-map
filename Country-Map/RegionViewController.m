//
//  RegionViewController.m
//  Country-Map
//
//  Created by Kristian Lien on 1/27/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "RegionViewController.h"

#import "CMDataService.h"

@interface RegionViewController ()

@end

@implementation RegionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [CMDataService loadCountriesInRegion:@"africa" withBlock:^(NSArray *data, NSError *error) {
        if (error)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
    }];
}

@end
