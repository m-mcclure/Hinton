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

+(NSArray *)mapPointsForArea:(CGRect)area;
+(Restaurant *)restaurantForID:(NSString *)restaurantID;
+(void)fetchGenresList:(void(^)(NSArray *genresList, NSError *error))completion;

@end
