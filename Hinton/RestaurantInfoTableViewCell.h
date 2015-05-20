//
//  RestaurantInfoTableViewCell.h
//  Hinton
//
//  Created by Brandon Roberts on 5/19/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Restaurant;

@interface RestaurantInfoTableViewCell : UITableViewCell

@property (strong, nonatomic) Restaurant *restaurantToDisplay;

@end
