//
//  RestaurantParser.m
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "RestaurantParser.h"
#import "Restaurant.h"
#import "Hours.h"
#import "Address.h"
#import "MenuItemPhoto.h"

@implementation RestaurantParser

+(Restaurant *)restaurantFromJSONDictionary:(NSDictionary *)jsonDictionary {
  
  Restaurant *newRestaurant = [[Restaurant alloc] init];
  
  newRestaurant.restaurantId = jsonDictionary[@"r_id"];
  newRestaurant.name = jsonDictionary[@"name"];
  newRestaurant.phone = jsonDictionary[@"phone"];
  newRestaurant.genre = jsonDictionary[@"genre"];
  newRestaurant.pricePoint = jsonDictionary[@"price"];
  newRestaurant.recipes = jsonDictionary[@"menu_item"];
  newRestaurant.blogURL = [NSURL URLWithString:jsonDictionary[@"blog_link"]];
  newRestaurant.mainURL = [NSURL URLWithString:jsonDictionary[@"r_site"]];
  newRestaurant.menuURL = [NSURL URLWithString:jsonDictionary[@"menu_link"]];

  NSDictionary *hoursInfo = jsonDictionary[@"hours"];
  NSString *monday = hoursInfo[@"mon"];
  NSString *tuesday = hoursInfo[@"tue"];
  NSString *wednesday = hoursInfo[@"wed"];
  NSString *thursday = hoursInfo[@"thu"];
  NSString *friday = hoursInfo[@"fri"];
  NSString *saturday = hoursInfo[@"sat"];
  NSString *sunday = hoursInfo[@"sun"];
  Hours *hours = [[Hours alloc] initWithMonday:monday Tuesday:tuesday Wednesday:wednesday Thursday:thursday Friday:friday Saturday:saturday Sunday:sunday];
  newRestaurant.hours = hours;
  
  NSDictionary *addressInfo = jsonDictionary[@"address"];
  NSString *addressNumber = addressInfo[@"number"];
  NSString *addressStreet = addressInfo[@"street"];
  NSString *addressCity = addressInfo[@"city"];
  NSString *addressState = addressInfo[@"state"];
  NSString *addressZip = addressInfo[@"zip"];
  Address *address = [[Address alloc] initWithStreetNumber:addressNumber streetName:addressStreet city:addressCity state:addressState zip:addressZip];
  newRestaurant.address = address;
  
  NSArray *menuPhotos = jsonDictionary[@"photos"];
  NSMutableArray *newPhotos = [NSMutableArray array];
  for (NSDictionary *photoInfo in menuPhotos) {
    NSString *photoID = photoInfo[@"id"];
    NSString *caption = photoInfo[@"caption"];
    NSData *photoData = photoInfo[@"data"];
    
    MenuItemPhoto *photo = [[MenuItemPhoto alloc] initWithID:photoID caption:caption data:photoData];
    [newPhotos addObject:photo];
  }
  newRestaurant.menuPhotoURLs = newPhotos;
  
  return newRestaurant;
  
}

@end
