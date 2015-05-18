//
//  MapPoint.m
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

-(instancetype)initWithLatitude:(NSNumber *)latitude longitude:(NSNumber *)longitude caption:(NSString *)caption restaurantID:(NSString *)restaurantID {
  if (self = [super init]) {
    self.latitude = latitude;
    self.longitude = longitude;
    self.caption = caption;
    self.restaurantId = restaurantID;
  }
  return self;
}

@end
