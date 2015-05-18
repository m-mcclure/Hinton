//
//  MapPointParser.m
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "MapPointParser.h"
#import "MapPoint.h"

@implementation MapPointParser

+(NSArray *)mapPointsFromJSONData:(NSData *)jsonData {
  NSError *error;
  NSArray *mapPoints = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
  if (error) {
    NSLog(@"JSON Error: %@", error);
    return nil;
  }
  
  NSMutableArray *returnArray = [NSMutableArray array];
  
  for (NSDictionary *mapPointInfo in mapPoints) {
    NSNumber *lat = mapPointInfo[@"loc"][@"lat"];
    NSNumber *lon = mapPointInfo[@"loc"][@"long"];
    NSString *caption = mapPointInfo[@"caption"];
    NSString *restaurantID = mapPointInfo[@"r_id"];

    MapPoint *newMapPoint = [[MapPoint alloc] initWithLatitude:lat longitude:lon caption:caption restaurantID:restaurantID];
    
    [returnArray addObject:newMapPoint];
    
  }
  
  return returnArray;
}

@end
