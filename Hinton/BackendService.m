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
#import "AFNetworking.h"

@implementation BackendService

static NSString * const backendURL = @"http://mysterious-castle-8548.herokuapp.com/api/restaurant/all";

+(NSArray *)mapPointsForArea:(CGRect)area {
  
//  NSURL *url = [[NSBundle mainBundle] URLForResource:@"sample_map_point_json" withExtension:@"json"];
//  NSData *jsonData = [NSData dataWithContentsOfURL:url];
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:backendURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Response: %@", responseObject);

  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);

  }];
  
  
  return [NSArray new];
//  return [MapPointParser mapPointsFromJSONData:jsonData];
}

+(Restaurant *)restaurantForID:(NSString *)restaurantID {
  
  NSURL *url = [[NSBundle mainBundle] URLForResource:@"sample_restaurant_json" withExtension:@"json"];
  NSData *jsonData = [NSData dataWithContentsOfURL:url];
  
  return [RestaurantParser restaurantFromJSONData:jsonData];
}

+(void)fetchGenresList:(void(^)(NSArray *genresList, NSError *error))completion {
  
#warning Incomplete
  NSString *genresURL = @"";
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:genresURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
  }];
  
}

@end
