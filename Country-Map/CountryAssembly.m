//
//  CountryAssembly.m
//  Country-Map
//
//  Created by Kristian Lien on 2/18/16.
//  Copyright © 2016 Myriad Mobile, LLC. All rights reserved.
//

#import "CountryAssembly.h"

#import "Country.h"

@implementation CountryAssembly

- (Country *)country
{
    return [TyphoonDefinition withClass:[Country class]
            configuration:^(TyphoonDefinition *definition) {
                
                [definition useInitializer:@selector(initWithName:region:subRegion:capital:latitude:longitude:area:)
                 
                parameters:^(TyphoonMethod *initializer) {
                    
                    [initializer injectParameterWith:[self defaultName]];
                }];
            }];
}

- (NSString *)defaultName {
    return [TyphoonDefinition withClass:[NSString class]];
}

- (NSString *)defaultRegion {
    return [TyphoonDefinition withClass:[NSString class]];
}

- (NSString *)defaultSubRegion {
    return [TyphoonDefinition withClass:[NSString class]];
}

- (NSString *)defaultCapital {
    return [TyphoonDefinition withClass:[NSString class]];
}

- (NSNumber *)defaultLatitude {
    return [TyphoonDefinition withClass:[NSNumber class]];
}

- (NSNumber *)defaultLongitude {
    return [TyphoonDefinition withClass:[NSNumber class]];
}

- (NSNumber *)defaultArea {
    return [TyphoonDefinition withClass:[NSNumber class]];
}

@end
