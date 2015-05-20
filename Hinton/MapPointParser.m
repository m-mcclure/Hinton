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

+(NSArray *)mapPointsFromJSONDictionary:(NSDictionary *)jsonDictionary {
  NSMutableArray *returnArray = [NSMutableArray array];
  
  for (NSDictionary *mapPointInfo in jsonDictionary) {
    NSString *restaurantID = mapPointInfo[@"_id"];
    
    NSDictionary *mapInfo = mapPointInfo[@"map"];
    NSString *caption = mapInfo[@"caption"];
    
    NSDictionary *locInfo = mapPointInfo[@"loc"];
    NSNumber *lat = locInfo[@"lat"];
    NSNumber *lon = locInfo[@"long"];
    
    MapPoint *newMapPoint = [[MapPoint alloc] initWithLatitude:lat longitude:lon title:caption restaurantID:restaurantID];
    
    [returnArray addObject:newMapPoint];
    
  }
  
  return returnArray;
}

@end
