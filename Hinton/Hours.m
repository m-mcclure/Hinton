//
//  Hours.m
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "Hours.h"

@implementation Hours

-(instancetype)initWithMonday:(NSString *)monday Tuesday:(NSString *)tuesday Wednesday:(NSString *)wednesday Thursday:(NSString *)thursday Friday:(NSString *)friday Saturday:(NSString *)saturday Sunday:(NSString *)sunday {
  
  if (self = [super init]) {
    self.mondayHours = monday;
    self.tuesdayHours = tuesday;
    self.wednesdayHours = wednesday;
    self.thursdayHours = thursday;
    self.fridayHours = friday;
    self.saturdayHours = saturday;
    self.sundayHours = sunday;
  }
  
  return self;
}

@end
