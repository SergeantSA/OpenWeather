//
//  WeatherData.h
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double latitude;
@property (nonatomic, copy) NSString *iconURL;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *shortDescription;
@property (nonatomic, copy) NSString *temperature;
@property (nonatomic, copy) NSString *humidity;
@property (nonatomic, copy) NSString *pressure;
@property (nonatomic, copy) NSString *windSpeed;
@property (nonatomic, copy) NSString *windDirection;

@end
