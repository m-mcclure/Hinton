//
//  Restaurant.h
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Address;

@interface Restaurant : NSObject

@property (strong, nonatomic) NSString *restaurantId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) Address *address;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *genre;
@property (strong, nonatomic) NSNumber *pricePoint;
@property (strong, nonatomic) NSString *recipe;
@property (strong, nonatomic) NSURL *blogURL;
@property (strong, nonatomic) NSURL *mainURL;
@property (strong, nonatomic) NSURL *menuURL;

@end
