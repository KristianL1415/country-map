//
//  Country.h
//  Country-Map
//
//  Created by Kristian Lien on 1/27/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, copy) NSString *subRegion;
@property (nonatomic, copy) NSString *capital;
@property (nonatomic, copy) NSNumber *latitude;
@property (nonatomic, copy) NSNumber *longitude;
@property (nonatomic, copy) NSNumber *area;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithName:(NSString *)name
                      region:(NSString *)region
                   subRegion:(NSString *)subRegion
                     capital:(NSString *)capital
                    latitude:(double)lat
                   longitude:(double)lng
                        area:(double)area;

@end
