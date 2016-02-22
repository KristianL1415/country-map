//
//  RegionViewController.m
//  Country-Map
//
//  Created by Kristian Lien on 1/27/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "RegionViewController.h"

#import "SubRegionViewController.h"
#import "StringConstants.h"

@interface RegionViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *regions;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation RegionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.regions = @[ kAmericasRegion, kEuropeRegion, kAsiaRegion, kAfricaRegion, kOceaniaRegion ];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kSubRegionsSegue])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SubRegionViewController *destinationController = segue.destinationViewController;
        [destinationController setRegion:[self.regions objectAtIndex:indexPath.row]];
    }
}

#pragma mark - Table View

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:kRegionCell forIndexPath:indexPath];
    
    [cell.textLabel setText:[self.regions objectAtIndex:indexPath.row]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.regions.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
