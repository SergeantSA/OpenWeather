//
//  MapViewController.m
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface MapViewController () <MKMapViewDelegate, MKAnnotation>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mapView addAnnotation:self];
    [self.mapView setCenterCoordinate:[self coordinate] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CLLocationCoordinate2D)coordinate
{
    return
        CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

- (NSString *)title
{
    return self.cityName;
}

- (NSString *)subtitle
{
    return self.description;
}

@end
