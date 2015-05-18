//
//  BackendService.m
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "BackendService.h"
#import "MapPointParser.h"
#import "RestaurantParser.h"

@implementation BackendService

+(NSArray *)mapPointsForArea:(CGRect)area {
  
  NSURL *url = [[NSBundle mainBundle] URLForResource:@"sample_map_point_json" withExtension:@"json"];
  NSData *jsonData = [NSData dataWithContentsOfURL:url];
  
  return [MapPointParser mapPointsFromJSONData:jsonData];
}

+(Restaurant *)restaurantForID:(NSString *)restaurantID {
  
  NSURL *url = [[NSBundle mainBundle] URLForResource:@"sample_restaurant_json" withExtension:@"json"];
  NSData *jsonData = [NSData dataWithContentsOfURL:url];
  
  return [RestaurantParser restaurantFromJSONData:jsonData];
}

@end
