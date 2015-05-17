//
//  DataController.h
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@class WeatherData;
@protocol DataControllerDelegate;

@interface DataController : AFHTTPSessionManager

@property(nonatomic, copy) NSArray *cities;
@property(nonatomic, weak) id<DataControllerDelegate> delegate;

+ (DataController *)sharedData;
- (void)getWeatherForCity:(NSString *)city;

@end

@protocol DataControllerDelegate <NSObject>
@optional
- (void)dataController:(DataController *)dc
         didUpdateData:(WeatherData *)weatherData;
- (void)dataController:(DataController *)dc
      didFailWithError:(NSError *)error;
@end
