//
//  CloseBannerViewController.h
//  Hinton
//
//  Created by Brandon Roberts on 5/19/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CloseBannerDelegate <NSObject>

-(void)closeButtonPressed;

@end

@interface CloseBannerViewController : UIViewController

@property (nonatomic) BOOL isOnscreen;
@property (weak, nonatomic) id<CloseBannerDelegate> delegate;

@end
