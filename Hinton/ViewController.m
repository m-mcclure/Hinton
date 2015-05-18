//
//  ViewController.m
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "ViewController.h"
#import "BackendService.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSArray *mapPoints;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.mapView.mapType = MKMapTypeHybrid;
  self.mapView.delegate = self;
  self.mapPoints = [BackendService mapPointsForArea:CGRectZero];

  [self.mapView addAnnotation:self.mapPoints[0]];
//  [self.mapView addAnnotations:self.mapPoints];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  NSLog(@"annotation: %@", annotation);
  return nil;
}

@end
