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

@interface RegionViewController ()

@property (nonatomic, strong) NSArray *regions;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation RegionViewController

#pragma mark - Table View Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:kRegionCell];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] init];
    }
    
    [cell.textLabel setText:[self.regions objectAtIndex:indexPath.row]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.regions count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Override Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.regions = [[NSArray alloc] initWithObjects:kAmericasRegion, kEuropeRegion, kAsiaRegion, kAfricaRegion, kOceaniaRegion, nil];
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

@end
