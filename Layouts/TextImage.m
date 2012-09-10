//
//  TextImage.m
//  Layouts
//
//  Created by Conor Dowling on 8/28/12.
//
//

#import "TextImage.h"

@implementation TextImage

@synthesize image = _image;
@synthesize blendMode = _blendMode;
@synthesize alpha = _alpha;

-(id)initwithImage:(UIImage *)image blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha {
    [self init];
    self.image = image;
    self.blendMode = blendMode;
    self.alpha = alpha;
    return self;
}

@end
