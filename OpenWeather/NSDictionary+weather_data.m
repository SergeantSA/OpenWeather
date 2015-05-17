//
//  NSDictionary+weather_data.m
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import "NSDictionary+weather_data.h"

@implementation NSDictionary (weather_data)

- (NSDictionary *)weather
{
    NSArray *ar = self[@"weather"];
    return ar[0];
}

@end
