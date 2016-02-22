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
    self.navigationItem.title = self.country.name;
    self.nameLabel.text = self.country.name;
    self.regionLabel.text = self.country.region;
    self.subRegionLabel.text = self.country.subRegion;
    self.capitalLabel.text = self.country.capital;
}

- (void)setupMapView
{
    self.mapView.delegate = self;
    
    CLLocationCoordinate2D countryLocation = CLLocationCoordinate2DMake(self.country.latitude.doubleValue, self.country.longitude.doubleValue);
    MKCoordinateRegion region = [CMMapViewExtension getRegionForCountryCoordinate:countryLocation withArea:self.country.area.doubleValue mapView:self.mapView];
    
    [self.mapView setRegion:region animated:YES];
}

@end
