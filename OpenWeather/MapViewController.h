//
//  MapViewController.h
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController

@property(nonatomic, assign) double longitude;
@property(nonatomic, assign) double latitude;
@property(nonatomic, copy) NSString *cityName;
@property(nonatomic, copy) NSString *description;

@end
