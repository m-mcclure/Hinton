//
//  RestaurantMapTableViewCell.m
//  Hinton
//
//  Created by Brandon Roberts on 5/19/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "RestaurantMapTableViewCell.h"

@interface RestaurantMapTableViewCell ()

@property (strong, nonatomic) IBOutlet UIView *mapView;

@end

@implementation RestaurantMapTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setMapPoint:(MapPoint *)mapPoint {
  
}

@end
