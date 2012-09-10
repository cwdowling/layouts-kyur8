//
//  TextImage.h
//  Layouts
//
//  Created by Conor Dowling on 8/28/12.
//
//

#import <UIKit/UIKit.h>

@interface TextImage : NSObject

@property(nonatomic, strong) UIImage *image;
@property(nonatomic) CGBlendMode blendMode;
@property(nonatomic) CGFloat alpha;

-(id)initwithImage:(UIImage *)image blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;

@end
