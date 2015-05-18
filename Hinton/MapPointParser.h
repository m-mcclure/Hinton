//
//  MapPointParser.h
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapPointParser : NSObject

+(NSArray *)mapPointsFromJSONData:(NSData *)jsonData;

@end
