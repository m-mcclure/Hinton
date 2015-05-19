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
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSArray *mapPoints;

@end

CLLocationDistance initialMapViewDistance = 5000;

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.mapView.delegate = self;
  self.mapPoints = [BackendService mapPointsForArea:CGRectZero];

  MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//  MapPoint *mapPoint = self.mapPoints[0];
  point.coordinate = CLLocationCoordinate2DMake(47.622152, -122.312965);
  point.title = @"test";
  
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(point.coordinate, initialMapViewDistance, initialMapViewDistance) animated:YES];
  
//  [self.mapView addAnnotation:point];
  [self.mapView addAnnotations:self.mapPoints];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  
  if ([annotation isKindOfClass:[MKUserLocation class]]) {
    return nil;
  }
  
  MKAnnotationView *annoView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"mapAnnotation"];
  
  if (!annoView) {
    annoView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"mapAnnotation"];
    annoView.image = [UIImage imageNamed:@"hinton_logo_annotation_size"];
    annoView.canShowCallout = YES;
    annoView.draggable = NO;
  }
  
  return annoView;
}

@end
