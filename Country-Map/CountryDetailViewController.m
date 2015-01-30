//
//  CountryDetailViewController.m
//  Country-Map
//
//  Created by Kristian Lien on 1/30/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CountryDetailViewController.h"

@interface CountryDetailViewController ()

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *regionLabel;
@property (nonatomic, strong) IBOutlet UILabel *subRegionLabel;
@property (nonatomic, strong) IBOutlet UILabel *capitalLabel;

@end

@implementation CountryDetailViewController

#pragma mark - Instance Methods

- (void)setupInterface
{
    [self.navigationItem setTitle:[self.country name]];
    [self.nameLabel setText:[self.country name]];
    [self.regionLabel setText:[self.country region]];
    [self.subRegionLabel setText:[self.country subRegion]];
    [self.capitalLabel setText:[self.country capital]];
}

#pragma mark - Override Methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupInterface];
}

@end
