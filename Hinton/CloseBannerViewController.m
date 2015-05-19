//
//  CloseBannerViewController.m
//  Hinton
//
//  Created by Brandon Roberts on 5/19/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "CloseBannerViewController.h"

@interface CloseBannerViewController ()

@end

@implementation CloseBannerViewController

- (IBAction)closeButtonPressed:(id)sender {
  if ([self.delegate respondsToSelector:@selector(closeButtonPressed)]) {
    [self.delegate closeButtonPressed];
  }
}
@end
