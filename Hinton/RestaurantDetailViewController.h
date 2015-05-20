//
//  RestaurantDetailViewController.h
//  Hinton
//
//  Created by Brandon Roberts on 5/19/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MapPoint;

@protocol RestaurantDetailDelegate <NSObject>

-(void)userDidTapCloseButton;

@end

@interface RestaurantDetailViewController : UIViewController

@property (weak, nonatomic) id<RestaurantDetailDelegate> delegate;
@property (strong, nonatomic) MapPoint *annotation;

@end
