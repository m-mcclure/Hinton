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

@interface RestaurantMapTableViewCell ()

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
  
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(manager.location.coordinate, 1000, 1000)];
  
  MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:self.mapPoint.coordinate addressDictionary:nil];
  
  MKMapItem *userLocMapItem = [MKMapItem mapItemForCurrentLocation];
  MKMapItem *destinationLocMapItem = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];
  
  MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
  request.source = userLocMapItem;
  request.destination = destinationLocMapItem;
  
  MKDirections *direction = [[MKDirections alloc] initWithRequest:request];
  [direction calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
    
    
    
  }];
}

@end
