//
//  DetailViewController.m
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import "DetailViewController.h"
#import "WeatherData.h"
#import "MapViewController.h"
#import "UIKit+AFNetworking/UIImageView+AFNetworking.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *windDirectionLabel;

@end

@implementation DetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _weatherData.cityName;
    [self.iconImageView setImageWithURL:
                [NSURL URLWithString:_weatherData.iconURL]];
    self.descriptionLabel.text = _weatherData.description;
    self.temperatureLabel.text = _weatherData.temperature;
    self.pressureLabel.text = _weatherData.pressure;
    self.humidityLabel.text = _weatherData.humidity;
    self.windSpeedLabel.text = _weatherData.windSpeed;
    self.windDirectionLabel.text = _weatherData.windDirection;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    } else if (section == 1) {
        return 2;
    }
    return 3;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ToMapSegue"]) {
        MapViewController *controller =
        segue.destinationViewController;
        controller.longitude = self.weatherData.longitude;
        controller.latitude = self.weatherData.latitude;
        controller.cityName = self.weatherData.cityName;
        controller.description =
                [NSString stringWithFormat:@"%@ %@",
                        self.weatherData.shortDescription,
                        self.weatherData.temperature];
    }
}

@end
