//
//  SubRegion.h
//  Country-Map
//
//  Created by Kristian Lien on 2/2/15.
//  Copyright (c) 2015 Myriad Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubRegion : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *regionName;
@property (nonatomic, copy) NSMutableArray *countries;

- (instancetype)initWithName:(NSString *)name region:(NSString *)regionName countries:(NSArray *)countries;

@end
