//
//  SubRegionViewController.h
//  Country-Map
//
//  Created by Kristian Lien on 2/3/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "CMViewController.h"

@interface SubRegionViewController : CMViewController <MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString *region;

@end
