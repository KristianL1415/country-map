//
//  CMView.m
//  Country-Map
//
//  Created by Kristian Lien on 1/29/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import "CMView.h"

@implementation CMView

- (void)displayError:(NSString *)message error:(NSError *)error
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message
                                                        message:[error localizedDescription]
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
