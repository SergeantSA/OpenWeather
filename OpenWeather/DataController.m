//
//  DataController.m
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import "DataController.h"
#import "WeatherData.h"
#import "NSDictionary+weather.h"
#import "NSDictionary+weather_data.h"

static NSString * const BaseURLString =
                        @"http://api.openweathermap.org/data/2.5/";
static NSString * const IconBaseURLString =
                        @"http://openweathermap.org/img/w/";

@implementation DataController
{
    WeatherData *_weatherData;
}

+ (DataController *)sharedData
{
    static DataController *_sharedDataController = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataController = [[self alloc]
            initWithBaseURL:[NSURL URLWithString:BaseURLString]];
    });
    
    return _sharedDataController;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    if ((self = [super initWithBaseURL:url])) {
        self.responseSerializer =
                            [AFJSONResponseSerializer serializer];
        self.requestSerializer =
                            [AFJSONRequestSerializer serializer];
    }
    
    return self;
}

- (NSArray *)cities
{
    if (_cities == nil) {
        _cities = @[@"London,uk",@"Kiev",@"Minsk", @"Warsaw",@"Cairo"];
    }
    return _cities;
}

- (void)getWeatherForCity:(NSString *)city
{
    NSMutableDictionary *parameters =
                                [NSMutableDictionary dictionary];
    parameters[@"q"] = city;
    [self GET:@"weather" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        [self parseData:responseObject];
        if ([self.delegate respondsToSelector:
                @selector(dataController:didUpdateData:)]) {
            [self.delegate dataController:self
                            didUpdateData:_weatherData];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if ([self.delegate respondsToSelector:
                @selector(dataController:didFailWithError:)]) {
            [self.delegate dataController:self
                         didFailWithError:error];
        }
    }];
}

- (void)parseData:(id)data
{
    NSDictionary *dataPack = (NSDictionary *)data;
    _weatherData = [[WeatherData alloc] init];
    _weatherData.cityName = dataPack[@"name"];
    NSDictionary *coordinate = dataPack[@"coord"];
    _weatherData.longitude = [coordinate longitude];
    _weatherData.latitude = [coordinate latitude];
    NSDictionary *weather = [dataPack weather];
    _weatherData.description = weather[@"description"];
    _weatherData.shortDescription = weather[@"main"];
    _weatherData.iconURL = [NSString stringWithFormat:@"%@%@.png",
                            IconBaseURLString, weather[@"icon"]];
    NSDictionary *main = dataPack[@"main"];
    _weatherData.temperature = [main temperature];
    _weatherData.pressure = [main pressure];
    _weatherData.humidity = [main humidity];
    NSDictionary *wind = dataPack[@"wind"];
    _weatherData.windSpeed = [wind windSpeed];
    _weatherData.windDirection = [wind windDirection];
}

@end
