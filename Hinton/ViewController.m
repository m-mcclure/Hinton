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
#import "RestaurantDetailCollectionViewController.h"
#import "CloseBannerViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate, CloseBannerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CloseBannerViewController *closeBanner;
@property (strong, nonatomic) NSArray *mapPoints;

@end

CLLocationDistance initialMapViewDistance = 5000;

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.closeBanner.delegate = self;
  
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
  
  [self.view addSubview:self.closeBanner.view];
  [self.closeBanner didMoveToParentViewController:self];
  [self addChildViewController:self.closeBanner];
  
  self.closeBanner.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 50);
  
  [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
    self.closeBanner.view.frame = CGRectMake(0, self.mapView.frame.origin.y, self.closeBanner.view.frame.size.width, self.closeBanner.view.frame.size.height);
  } completion:^(BOOL finished) {
    self.closeBanner.isOnscreen = YES;
  }];
  
}

//-(void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered {
//  [self.mapView addAnnotations:self.mapPoints];
//}

//-(void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
//  [self.mapView addAnnotations:self.mapPoints];
//}
//
//-(void)mapViewWillStartRenderingMap:(MKMapView *)mapView {
//  [self.mapView addAnnotations:self.mapPoints];
//}

#pragma mark - CloseBannerDelegate

-(void)closeButtonPressed {
  //TODO: Dismiss the views
}

#pragma mark - Custom Property Getters/Setters

-(CloseBannerViewController *)closeBanner {
  if (_closeBanner) {
    return _closeBanner;
  }
  
  _closeBanner = [self.storyboard instantiateViewControllerWithIdentifier:@"CloseBannerVC"];
  return _closeBanner;

}


@end
