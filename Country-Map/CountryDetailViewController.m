//
//  CountryDetailViewController.m
//  Country-Map
//
//  Created by Kristian Lien on 1/30/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CountryDetailViewController.h"

#import "CMMapViewExtension.h"

@interface CountryDetailViewController ()

@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *regionLabel;
@property (nonatomic, strong) IBOutlet UILabel *subRegionLabel;
@property (nonatomic, strong) IBOutlet UILabel *capitalLabel;

@end

@implementation CountryDetailViewController

#pragma mark - Override Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupInterface];
    [self setupMapView];
}

#pragma mark - Instance Methods

- (void)setupInterface
{
    [self.navigationItem setTitle:[self.country name]];
    [self.nameLabel setText:[self.country name]];
    [self.regionLabel setText:[self.country region]];
    [self.subRegionLabel setText:[self.country subRegion]];
    [self.capitalLabel setText:[self.country capital]];
}

- (void)setupMapView
{
    [self.mapView setDelegate:self];
    
    CLLocationCoordinate2D countryLocation = CLLocationCoordinate2DMake(self.country.latitude, self.country.longitude);
    
    MKCoordinateRegion region = [CMMapViewExtension getRegionForCountryCoordinate:countryLocation withArea:self.country.area mapView:self.mapView];
    
    [self.mapView setRegion:region animated:YES];
}

@end
