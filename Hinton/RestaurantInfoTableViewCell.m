//
//  RestaurantInfoTableViewCell.m
//  Hinton
//
//  Created by Brandon Roberts on 5/19/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "RestaurantInfoTableViewCell.h"
#import "Restaurant.h"
#import "Address.h"
#import "Hours.h"

@interface RestaurantInfoTableViewCell ()

@property (strong, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *restaurantPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *restaurantGenreLabel;
@property (strong, nonatomic) IBOutlet UIButton *mainWebsiteButton;
@property (strong, nonatomic) IBOutlet UIButton *menuWebsiteButton;
@property (strong, nonatomic) IBOutlet UIButton *blogWebsiteButton;
@property (strong, nonatomic) IBOutlet UILabel *restaurantPhoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *restaurantAddressLabel;
@property (strong, nonatomic) IBOutlet UILabel *restaurantHoursLabel;

@property (strong, nonatomic) NSString *restaurantName;
@property (strong, nonatomic) NSString *restaurantPrice;
@property (strong, nonatomic) NSString *restaurantGenre;
@property (strong, nonatomic) NSURL *mainWebsiteURL;
@property (strong, nonatomic) NSURL *menuWebsiteURL;
@property (strong, nonatomic) NSURL *blogWebsiteURL;
@property (strong, nonatomic) NSString *restaurantPhone;
@property (strong, nonatomic) Address *restaurantAddress;
@property (strong, nonatomic) Hours *restaurantHours;

@end

@implementation RestaurantInfoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setRestaurantToDisplay:(Restaurant *)restaurantToDisplay {
  _restaurantToDisplay = restaurantToDisplay;
  
  self.restaurantName = restaurantToDisplay.name;
  self.restaurantPrice = restaurantToDisplay.pricePoint;
  self.restaurantGenre = restaurantToDisplay.genre;
  self.mainWebsiteURL = restaurantToDisplay.mainURL;
  self.menuWebsiteURL = restaurantToDisplay.menuURL;
  self.blogWebsiteURL = restaurantToDisplay.blogURL;
  self.restaurantPhone = restaurantToDisplay.phone;
  self.restaurantAddress = restaurantToDisplay.address;
  self.restaurantHours = restaurantToDisplay.hours;
}

-(void)setRestaurantName:(NSString *)restaurantName {
  _restaurantName = restaurantName;
  self.restaurantNameLabel.text = restaurantName;
}

-(void)setRestaurantPrice:(NSString *)restaurantPrice {
  _restaurantPrice = restaurantPrice;
  
  NSInteger price = restaurantPrice.integerValue;
  NSString *priceRepresentation = [NSString string];
  
  switch (price) {
    case <#constant#>:
      <#statements#>
      break;
      
    default:
      break;
  }
}

-(void)setRestaurantGenre:(NSString *)restaurantGenre {
  
}

-(void)setMainWebsiteURL:(NSURL *)mainWebsiteURL {
  
}

-(void)setMenuWebsiteURL:(NSURL *)menuWebsiteURL {
  
}

-(void)setBlogWebsiteURL:(NSURL *)blogWebsiteURL {
  
}

-(void)setRestaurantPhone:(NSString *)restaurantPhone {

}

-(void)setRestaurantAddress:(Address *)restaurantAddress {
  
}

-(void)setRestaurantHours:(Hours *)restaurantHours {
  
}

@end
