//
//  CountryViewController.m
//  Country-Map
//
//  Created by Kristian Lien on 1/30/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CountryViewController.h"

#import "CountryDetailViewController.h"
#import "CMMapViewExtension.h"
#import "StringConstants.h"
#import "CMDataService.h"

@interface CountryViewController ()

@property (nonatomic, strong) NSArray *countries;

@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation CountryViewController

#pragma mark - Instance Methods

- (void)loadCountriesForSubRegion:(SubRegion *)subRegion
{
    self.countries = [self.subRegion countries];
    [self.tableView reloadData];
}

- (void)setupMapView
{
    [self.mapView setDelegate:self];
    
    MKCoordinateRegion region = [CMMapViewExtension getRegionForCountries:self.countries mapView:self.mapView];
    
    [self.mapView setRegion:region animated:YES];
}

#pragma mark - Table View Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:kCountryCell];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] init];
    }
    
    [cell.textLabel setText:[self.countries[indexPath.row] name]];
    
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
    
    [self loadCountriesForSubRegion:self.subRegion];
    [self setupMapView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kCountryDetailSegue])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CountryDetailViewController *destinationController = segue.destinationViewController;
        [destinationController setCountry:[self.countries objectAtIndex:indexPath.row]];
    }
}

@end
