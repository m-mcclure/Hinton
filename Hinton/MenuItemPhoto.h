//
//  MenuItemPhoto.h
//  Hinton
//
//  Created by Brandon Roberts on 5/18/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItemPhoto : NSObject

@property (strong, nonatomic) NSString * photoId;
@property (strong, nonatomic) NSData * photoData;
@property (strong, nonatomic) NSString * caption;

@end
