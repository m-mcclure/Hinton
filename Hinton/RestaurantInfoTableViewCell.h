//
//  RestaurantInfoTableViewCell.h
//  Hinton
//
//  Created by Brandon Roberts on 5/19/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantInfoTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *restaurantPriceLabel;
@property (strong, nonatomic) IBOutlet UIButton *mainWebsiteButton;
@property (strong, nonatomic) IBOutlet UIButton *menuWebsiteButton;
@property (strong, nonatomic) IBOutlet UIButton *blogWebsiteButton;
@property (strong, nonatomic) IBOutlet UILabel *restaurantAddressLabel;
@property (strong, nonatomic) IBOutlet UILabel *restaurantHoursLabel;
@property (strong, nonatomic) IBOutlet UILabel *restaurantPhoneLabel;

@end
