//
//  ImageResizer.h
//  Hinton
//
//  Created by Brandon Roberts on 5/20/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageResizer : NSObject

+(UIImage *)resizedImageWithImage:(UIImage *)image size:(CGSize)size;

@end
