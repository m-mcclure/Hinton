//
//  MapPoint.m
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

-(instancetype)initWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude title:(NSString *)title restaurantID:(NSString *)restaurantID {
  if (self = [super init]) {
    self.coordinate = CLLocationCoordinate2DMake(latitude.doubleValue, longitude.doubleValue);
    self.title = title;
    self.restaurantId = restaurantID;
  }
  return self;
}

@end
