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
#import "GenreParser.h"
#import "AFNetworking.h"

@implementation BackendService

+(void)fetchMapPointsForArea:(CGRect)area completionHandler:(void (^)(NSArray *mapPoints, NSError *error))completionHandler {

  NSString *fetchAllURLString = @"http://hinton.herokuapp.com/api/restaurant/all";
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:fetchAllURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    NSLog(@"Response: %@", responseObject);
    NSArray *mapPoints = [MapPointParser mapPointsFromJSONDictionary:responseObject];
    completionHandler(mapPoints, nil);
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
    completionHandler(nil, error);
  }];
  
}

+(void)fetchRestaurantForID:(NSString *)restaurantID completionHandler:(void (^)(Restaurant *restaurant, NSError *error))completionHandler {
//  NSURL *url = [[NSBundle mainBundle] URLForResource:@"sample_restaurant_json" withExtension:@"json"];
//  NSData *jsonData = [NSData dataWithContentsOfURL:url];
  
  NSString *fetchRestaurantURLString = @"http://hinton.herokuapp.com/api/restaurant/";
  fetchRestaurantURLString = [fetchRestaurantURLString stringByAppendingString:restaurantID];
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:fetchRestaurantURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    Restaurant *restaurant = [RestaurantParser restaurantFromJSONDictionary:responseObject];
    completionHandler(restaurant, nil);
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
    completionHandler(nil, error);
  }];

}

+(void)fetchGenresList:(void(^)(NSArray *genresList, NSError *error))completion {
  
  NSString *genresURL = @"http://hinton.herokuapp.com/api/restaurant/genre/all";

  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:genresURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSArray *genres = [GenreParser genresFromJSONArray:responseObject];
    completion(genres, nil);
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
    completion(nil, error);
  }];
  
}

+(void)fetchMapPointsForGenre:(NSString *)genre completionHandler:(void (^)(NSArray *mapPoints, NSError *error))completionHandler {

  NSString *mapPointforGenreURL = @"http://hinton.herokuapp.com/api/restaurant/genre/";
  
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager GET:mapPointforGenreURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSArray *mapPoints = [MapPointParser mapPointsFromJSONDictionary:responseObject];
    completionHandler(mapPoints, nil);
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
    completionHandler(nil, error);
  }];
}

@end
