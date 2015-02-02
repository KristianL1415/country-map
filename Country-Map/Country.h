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
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double area;

- (instancetype) initWithName:(NSString *)name region:(NSString *)region subRegion:(NSString *)subRegion capital:(NSString *)capital latitude:(double)lat longitude:(double)lng area:(double)area;

@end
