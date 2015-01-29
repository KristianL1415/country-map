//
//  RegionViewController.m
//  Country-Map
//
//  Created by Kristian Lien on 1/27/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "RegionViewController.h"

#import "RegionsView.h"
#import "CMDataService.h"

@interface RegionViewController ()

@end

@implementation RegionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view = [[RegionsView alloc] init];
    
    [CMDataService loadCountriesInRegion:@"africa" withBlock:^(NSArray *data, NSError *error) {
        if (error)
        {
            // TODO: display error alert
//            self.view
            
        }
    }];
}

@end
