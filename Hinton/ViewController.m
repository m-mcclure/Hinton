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

@interface ViewController () <MKMapViewDelegate, RestaurantDetailDelegate>

@property (strong, nonatomic) IBOutlet UIView *header;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) RestaurantDetailViewController *restaurantDetail;
@property (strong, nonatomic) NSArray *mapPoints;

@end

CLLocationDistance initialMapViewDistance = 5000;
NSTimeInterval dismissViewAnimationDuration = 0.3;

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.restaurantDetail.delegate = self;
  [self.progressBar setProgress:0.0 animated:NO];
  
  self.mapView.delegate = self;
  self.mapPoints = [BackendService mapPointsForArea:CGRectZero];

  MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//  MapPoint *mapPoint = self.mapPoints[0];
  point.coordinate = CLLocationCoordinate2DMake(47.622152, -122.312965);
  point.title = @"test";
  
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(point.coordinate, initialMapViewDistance, initialMapViewDistance) animated:NO];
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

-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
  [self.mapView addAnnotations:self.mapPoints];
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
    NSLog(@"tableView height: %f", self.restaurantDetail.view.frame.size.height);
    NSLog(@"View Controller height: %f", self.view.frame.size.height);


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

#pragma mark - Custom Property Getters/Setters

-(RestaurantDetailViewController *)restaurantDetail {
  if (_restaurantDetail) {
    return _restaurantDetail;
  }
  _restaurantDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"RestaurantDetailVC"];
  return _restaurantDetail;
}


@end
