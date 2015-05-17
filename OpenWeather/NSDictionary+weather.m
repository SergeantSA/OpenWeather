//
//  NSDictionary+weather.m
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import "NSDictionary+weather.h"

@implementation NSDictionary (weather)

- (double)longitude
{
    NSNumber *cc = self[@"lon"];
    double n = [cc doubleValue];
    return n;
}

- (double)latitude
{
    NSNumber *cc = self[@"lat"];
    double n = [cc doubleValue];
    return n;
}

- (NSString *)temperature
{
    NSNumber *cc = self[@"temp"];
    float n = [cc floatValue];
    n -= 273.15f;
    NSString *s;
    if (n > 0) {
        s = [NSString stringWithFormat:@"+%.0f", n];
    } else {
        s = [NSString stringWithFormat:@"%.0f", n];
    }
    s = [s stringByAppendingString:@"\u00B0C"];
    return s;
}

- (NSString *)pressure
{
    NSNumber *cc = self[@"pressure"];
//    double n = [cc doubleValue];
    NSString *s = [NSString stringWithFormat:@"%@ hPa", cc];
    return s;
}

- (NSString *)humidity
{
    NSNumber *cc = self[@"humidity"];
    NSString *s = [NSString stringWithFormat:@"%@%%", cc];
    return s;
}

- (NSString *)windSpeed
{
    NSNumber *cc = self[@"speed"];
    double n = [cc doubleValue];
    NSString *s = [NSString stringWithFormat:@"%.0f mps", n];
    return s;
}

- (NSString *)windDirection
{
    NSNumber *cc = self[@"deg"];
    double n = [cc doubleValue];
    NSString *s = [NSString stringWithFormat:@"%.0f\u00B0", n];
    return s;
}


@end
