//
//  Country.h
//  Country-Map
//
//  Created by Kristian Lien on 1/27/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *subRegion;
@property (nonatomic, strong) NSString *capital;

@end
