//
//  DetailViewController.h
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeatherData;

@interface DetailViewController : UITableViewController

@property (nonatomic, strong) WeatherData *weatherData;

@end
