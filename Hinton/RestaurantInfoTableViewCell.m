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
    case 1:
      priceRepresentation = @"$";
      break;
    case 2:
      priceRepresentation = @"$$";
      break;
    case 3:
      priceRepresentation = @"$$$";
      break;
    case 4:
      priceRepresentation = @"$$$$";
      break;
      
    default:
      priceRepresentation = @"Variable Pricing";
      break;
  }
  
  self.restaurantPriceLabel.text = priceRepresentation;
}

-(void)setRestaurantGenre:(NSString *)restaurantGenre {
  _restaurantGenre = restaurantGenre;
  self.restaurantGenreLabel.text = restaurantGenre;
}

-(void)setMainWebsiteURL:(NSURL *)mainWebsiteURL {
  _mainWebsiteURL = mainWebsiteURL;
}

-(void)setMenuWebsiteURL:(NSURL *)menuWebsiteURL {
  _menuWebsiteURL = menuWebsiteURL;
}

-(void)setBlogWebsiteURL:(NSURL *)blogWebsiteURL {
  _blogWebsiteURL = blogWebsiteURL;
}

-(void)setRestaurantPhone:(NSString *)restaurantPhone {
  _restaurantPhone = restaurantPhone;
  self.restaurantPhoneLabel.text = restaurantPhone;
}

-(void)setRestaurantAddress:(Address *)restaurantAddress {
  _restaurantAddress = restaurantAddress;
  
  NSString *addressString = [NSString string];
  
  addressString = [addressString stringByAppendingString:restaurantAddress.streetNumber];
  addressString = [addressString stringByAppendingString:@" "];
  addressString = [addressString stringByAppendingString:restaurantAddress.streetName];
  addressString = [addressString stringByAppendingString:@", "];
  addressString = [addressString stringByAppendingString:restaurantAddress.city];
  addressString = [addressString stringByAppendingString:@", "];
  addressString = [addressString stringByAppendingString:restaurantAddress.state];
  addressString = [addressString stringByAppendingString:@" "];
  addressString = [addressString stringByAppendingString:restaurantAddress.zip];
  
  self.restaurantAddressLabel.text = addressString;
}

-(void)setRestaurantHours:(Hours *)restaurantHours {
  _restaurantHours = restaurantHours;
#warning Incomplete
  self.restaurantHoursLabel.text = restaurantHours.mondayHours;
}

- (IBAction)mainWebsiteButtonPressed:(id)sender {
  [[UIApplication sharedApplication] openURL:self.restaurantToDisplay.mainURL];
}
- (IBAction)menuWebsiteButtonPressed:(id)sender {
  [[UIApplication sharedApplication] openURL:self.restaurantToDisplay.menuURL];
}
- (IBAction)blogWebsiteButtonPressed:(id)sender {
  [[UIApplication sharedApplication] openURL:self.restaurantToDisplay.blogURL];
}

@end
