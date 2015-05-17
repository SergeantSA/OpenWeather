//
//  NSDictionary+weather.h
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (weather)

- (double)longitude;
- (double)latitude;
- (NSString *)temperature;
- (NSString *)pressure;
- (NSString *)humidity;
- (NSString *)windSpeed;
- (NSString *)windDirection;

@end
