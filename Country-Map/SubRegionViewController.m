//
//  SubRegionViewController.m
//  Country-Map
//
//  Created by Kristian Lien on 2/3/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "SubRegionViewController.h"

#import "CMDataService.h"
#import "StringConstants.h"
#import "CountryViewController.h"

@interface SubRegionViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *subRegions;

@end

@implementation SubRegionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:self.region];
    [self loadSubRegionsForRegion:self.region];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:kCountriesSegue])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CountryViewController *destinationController = segue.destinationViewController;
        [destinationController setSubRegion:[self.subRegions objectAtIndex:indexPath.row]];
    }
}

#pragma mark - Instance Methods

- (void)loadSubRegionsForRegion:(NSString *)region
{
    [CMDataService loadSubRegionsInRegion:region withBlock:^(NSArray *data, NSError *error) {
        if (error)
        {
            [self displayError:error withTitle:@"Error Retrieving Data"];
        }
        else
        {
            self.subRegions = data;
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - Table View Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:kSubRegionCell forIndexPath:indexPath];
    
    [cell.textLabel setText:[[self.subRegions objectAtIndex:indexPath.row] name]];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.subRegions count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
