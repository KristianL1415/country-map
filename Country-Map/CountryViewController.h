//
//  CountryViewController.h
//  Country-Map
//
//  Created by Kristian Lien on 1/30/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "CMViewController.h"
#import "SubRegion.h"

@interface CountryViewController : CMViewController <MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) SubRegion *subRegion;

@end
