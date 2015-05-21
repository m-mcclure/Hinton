//
//  ViewController.m
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "ViewController.h"
#import "BackendService.h"
#import "MapPoint.h"
#import "RestaurantDetailViewController.h"
#import "RestaurantMapTableViewCell.h"
#import "RestaurantImageTableViewCell.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate, RestaurantDetailDelegate, UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet UIView *header;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) RestaurantDetailViewController *restaurantDetail;
@property (strong, nonatomic) NSArray *mapPoints;
//@property (strong, nonatomic) UISearchController *searchController;

@end

@implementation ViewController

CLLocationDistance initialMapViewDistance = 5000;
NSTimeInterval dismissViewAnimationDuration = 0.3;

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.mapView.delegate = self;
  self.restaurantDetail.delegate = self;
  [self.progressBar setProgress:0.0 animated:NO];
  
  self.searchBar.delegate = self;
  self.searchBar.scopeButtonTitles = @[@"Standard", @"Genre"];
  self.searchBar.showsScopeBar = YES;

//  self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//  self.searchController.searchResultsUpdater = self;
//  self.searchController.dimsBackgroundDuringPresentation = NO;
//  self.searchController.searchBar.delegate = self;
//  self.searchController.searchBar.scopeButtonTitles = @[@"Standard", @"Genre"];
//  [self.mapView addSubview:self.searchController.searchBar];
////  self.definesPresentationContext = YES;
  
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  
  if ([CLLocationManager locationServicesEnabled]) {
    
    [self.locationManager requestWhenInUseAuthorization];
    
//    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
//      self.mapView.showsUserLocation = YES;
//      [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(self.locationManager.location.coordinate, initialMapViewDistance, initialMapViewDistance) animated:YES];
//    } else {
//      CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.622152, -122.312965);
//      [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(coordinate, initialMapViewDistance, initialMapViewDistance) animated:NO];
//    }
    
  } else {

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.622152, -122.312965);
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(coordinate, initialMapViewDistance, initialMapViewDistance) animated:NO];
  }
  
  
  [BackendService fetchMapPointsForArea:CGRectZero completionHandler:^(NSArray *mapPoints, NSError *error) {
    [self.mapView addAnnotations:mapPoints];
  }];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  
  if ([annotation isKindOfClass:[MKUserLocation class]]) {
    return nil;
  }
  
  MKAnnotationView *annoView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"mapAnnotation"];
  
  if (!annoView) {
    annoView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"mapAnnotation"];
    annoView.image = [UIImage imageNamed:@"hinton_logo_map_pin_size"];
    annoView.canShowCallout = YES;
    annoView.draggable = NO;
    annoView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
  }
  
  return annoView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {  
  
  [self.view addSubview:self.restaurantDetail.view];
  [self.restaurantDetail didMoveToParentViewController:self];
  [self addChildViewController:self.restaurantDetail];
  self.restaurantDetail.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.header.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height);
  self.restaurantDetail.annotation = view.annotation;
  
  [UIView animateWithDuration:dismissViewAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
    self.restaurantDetail.view.frame = CGRectMake(0, self.mapView.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height - self.header.frame.size.height - [UIApplication sharedApplication].statusBarFrame.size.height);
  } completion:^(BOOL finished) {

  }];
}

#pragma mark - CloseBannerDelegate

-(void)userDidTapCloseButton {
  [UIView animateWithDuration:dismissViewAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
    
  self.restaurantDetail.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.header.frame.size.height);
  
  } completion:^(BOOL finished) {
    [self.restaurantDetail.view removeFromSuperview];
    [self.restaurantDetail didMoveToParentViewController:nil];
    [self.restaurantDetail removeFromParentViewController];
  }];
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
  self.mapView.showsUserLocation = YES;
  
  if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(manager.location.coordinate, initialMapViewDistance, initialMapViewDistance) animated:YES];
  } else {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.622152, -122.312965);
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(coordinate, initialMapViewDistance, initialMapViewDistance) animated:NO];
  }
}

#pragma mark - UISearchBarDelegate




#pragma mark - Custom Property Getters/Setters

-(RestaurantDetailViewController *)restaurantDetail {
  if (_restaurantDetail) {
    return _restaurantDetail;
  }
  _restaurantDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"RestaurantDetailVC"];
  return _restaurantDetail;
}

#pragma mark - My Methods
- (IBAction)userLocationButtonPressed:(id)sender {
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(self.locationManager.location.coordinate, initialMapViewDistance, initialMapViewDistance) animated:YES];
}





@end
