//
//  RestaurantMapTableViewCell.m
//  Hinton
//
//  Created by Brandon Roberts on 5/19/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "RestaurantMapTableViewCell.h"
#import "MapPoint.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface RestaurantMapTableViewCell () <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation RestaurantMapTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setMapPoint:(MapPoint *)mapPoint {
  CLLocationManager *manager = [[CLLocationManager alloc] init];
  
  [self.mapView removeAnnotations:self.mapView.annotations];
  self.mapView.showsUserLocation = YES;
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(mapPoint.coordinate, 1000, 1000)];
  [self.mapView addAnnotation:mapPoint];
  
  MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:self.mapPoint.coordinate addressDictionary:@{}];
  
  MKMapItem *userLocMapItem = [MKMapItem mapItemForCurrentLocation];
//  MKMapItem *userLocMapItem = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:manager.location.coordinate addressDictionary:nil]];
  MKMapItem *destinationLocMapItem = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];
//  MKMapItem *destinationLocMapItem = [MKMapItem mapItemForCurrentLocation];
  
  MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
  request.source = userLocMapItem;
  request.destination = destinationLocMapItem;
  
  MKDirections *direction = [[MKDirections alloc] initWithRequest:request];
  
  if (!direction.calculating) {
    [direction calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
      
      if (!error) {
        NSLog(@"MKDirResp: %@", response);
        MKRoute *route = response.routes.firstObject;
        MKPolyline *routePolyline = route.polyline;
        [self.mapView addOverlay:routePolyline];
      } else {
        NSLog(@"Error: %@", error);
      }
      
    }];
  }
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
  MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
  return renderer;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Point"];
  return annotationView;
}

@end
