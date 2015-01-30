//
//  CMViewController.m
//  Country-Map
//
//  Created by Kristian Lien on 1/30/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CMViewController.h"

@interface CMViewController ()

@end

@implementation CMViewController

#pragma mark - Instance Methods

- (void)displayError:(NSString *)message error:(NSError *)error
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message
                                                        message:[error localizedDescription]
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}

#pragma mark - Override Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
