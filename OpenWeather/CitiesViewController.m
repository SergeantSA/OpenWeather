//
//  CitiesViewController.m
//  OpenWeather
//
//  Created by SergeantSA on 5/16/15.
//  Copyright (c) 2015 SergeantWare. All rights reserved.
//

#import "CitiesViewController.h"
#import "DataController.h"
#import "DetailViewController.h"

@interface CitiesViewController ()

@end

@implementation CitiesViewController
{
    DataController *dataController;
}

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
    
    dataController = [DataController sharedData];
    dataController.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataController.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell"
                                forIndexPath:indexPath];
    
    cell.textLabel.text = dataController.cities[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [dataController getWeatherForCity:
                        dataController.cities[indexPath.row]];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailViewSegue"]) {
        DetailViewController *controller =
                                segue.destinationViewController;
        controller.weatherData = sender;
    }
}

#pragma mark - Data Controller delegate

- (void)dataController:(DataController *)dc
         didUpdateData:(WeatherData *)weatherData
{
    [self performSegueWithIdentifier:@"DetailViewSegue"
                              sender:weatherData];
}

- (void)dataController:(DataController *)dc
      didFailWithError:(NSError *)error
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Receiving Data" message:[NSString stringWithFormat:@"%@", error] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alertView show];
}

@end
