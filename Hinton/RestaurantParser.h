//
//  RestaurantParser.h
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Restaurant;

@interface RestaurantParser : NSObject

+(Restaurant *)restaurantFromJSONData:(NSData *)jsonData;

@end
