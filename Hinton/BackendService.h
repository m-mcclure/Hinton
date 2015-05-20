//
//  BackendService.h
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Restaurant;

@interface BackendService : NSObject

+(void)fetchMapPointsForArea:(CGRect)area completionHandler:(void(^)(NSArray *mapPoints, NSError *error))completionHandler;
+(void)fetchRestaurantForID:(NSString *)restaurantID completionHandler:(void(^)(Restaurant *restaurant, NSError *error))completionHandler;
+(void)fetchGenresList:(void(^)(NSArray *genresList, NSError *error))completion;
+(void)fetchMapPointsForGenre:(NSString *)genre completionHandler:(void(^)(NSArray *mapPoints, NSError *error))completionHandler;

@end
