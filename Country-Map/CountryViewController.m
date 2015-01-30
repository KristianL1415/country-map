//
//  CountryViewController.m
//  Country-Map
//
//  Created by Kristian Lien on 1/30/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CountryViewController.h"

#import "CMDataService.h"
#import "StringConstants.h"

@interface CountryViewController ()

@property (nonatomic, strong) NSArray *countries;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation CountryViewController

#pragma mark - Instance Methods

- (void)loadDataForCountry:(NSString *)country
{
    [CMDataService loadCountriesInRegion:country withBlock:^(NSArray *data, NSError *error) {
        if (error)
        {
            [self displayError:@"Error Retrieving Data" error:error];
        }
        else
        {
            self.countries = data;
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - Table View Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:kCountryCell];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] init];
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.countries count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Override Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadDataForCountry:@"africa"];
}

@end
