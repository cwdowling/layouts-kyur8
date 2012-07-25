//
//  Filters.m
//  Layouts
//
//  Created by Conor Dowling on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Filters.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreFoundation/CoreFoundation.h>


@interface Filters ()

@end

@implementation Filters

/*  QUESTIONS
Same gradient overlays on pictures
Longwash mask. original picture not visible at all
Banding from 3+ color gradients
PinSoftLight Blend Mode not supported
ThornRose not right because of fill on rainbow filter in original psd file
Rainbow requires angle gradient
 
    TO DO
fix the old CAGradientLayers
add textures with pinlight somehow
take out possible extra gradients
*/

-(UIImage *)Bacon:(UIImage *)image Text:(NSString *)title {
    
    //rainbow filter
    CGFloat rainbowComponents[20] = {160.0/255.0, 134.0/255.0, 87.0/255.0, 1.0, 178.0/255.0, 143.0/255.0, 90.0/255.0, 1.0, 188.0/255.0, 147.0/255.0, 89.0/255.0, 1.0, 203.0/255.0, 183.0/255.0, 133.0/255.0, 1.0, 237.0/255.0, 235.0/255.0, 190.0/255.0, 1.0 };
    size_t rainbowNumLocations = 5;
    CGFloat rainbowLocations[5] = {0.0, 0.25, 0.46, 0.67, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0.0, 600.0);
    CGPoint end = CGPointMake(73.0, -120.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();  

    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;

}

-(UIImage *)Bitchin:(UIImage *)image Text:(NSString *)title {
    //Text
    if([title length]!=0) {
        
        
    }
    
    //rainbow filter
    CGFloat rainbowComponents[20] = {250.0/255.0, 229.0/255.0, 177.0/255.0, 1.0, 244.0/255.0, 190.0/255.0, 178.0/255.0, 1.0, 238.0/255.0, 149.0/255.0, 172.0/255.0, 1.0, 182.0/255.0, 125.0/255.0, 173.0/255.0, 1.0, 132.0/255.0, 106.0/255.0, 175.0/255.0, 1.0 };
    size_t rainbowNumLocations = 5;
    CGFloat rainbowLocations[5] = {0.0, 0.25, 0.50, 0.75, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0.0, 480.0);
    CGPoint end = CGPointMake(0.0, 0.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //Main Image
    
    //ASK WHETHER GRADIENT OVERLAY SHOULD BE HERE
    //gradient overlay
    CGFloat components[28] = {1,0,0,1,1,1,0,1,0,1,0,1,0,1,1,1,0,0,1,1,1,0,1,1,1,0,0,1};
    size_t numLocations = 7;
    CGFloat locations[7] = {0.0, 0.17, 0.33, 0.5, 0.67, 0.83, 1.0};
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, components, locations, numLocations);
    
    CGPoint startCenter = CGPointMake(1500, -500);
    CGFloat endRadius = 2000;
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawRadialGradient(UIGraphicsGetCurrentContext(), gradient, startCenter, 0, startCenter, endRadius, nil);
    UIImage *gradientOverlayImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradientOverlayImage drawInRect:CGRectMake(0,0,image.size.width,image.size.height) blendMode:kCGBlendModeScreen alpha:0.4];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:1.0];
    //[viewImage drawInRect:CGRectMake(0, 0, 320, 150) blendMode:kCGBlendModeColorDodge alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)Clean:(UIImage *)image Text:(NSString *)title {
    //Text
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:100];
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    [text setFont:font];
    [text setText:title];
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    text.textColor = [UIColor clearColor];
    text.adjustsFontSizeToFitWidth = YES;    
        
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(0,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];
    
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *shadowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   
    
    
    //base image
    //gradient overlay
    CGFloat components[28] = {1,0,0,1,1,1,0,1,0,1,0,1,0,1,1,1,0,0,1,1,1,0,1,1,1,0,0,1};
    size_t numLocations = 7;
    CGFloat locations[7] = {0.0, 0.17, 0.33, 0.5, 0.67, 0.83, 1.0};
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, components, locations, numLocations);
    
    CGPoint startCenter = CGPointMake(1500, -500);
    CGFloat endRadius = 2000;
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawRadialGradient(UIGraphicsGetCurrentContext(), gradient, startCenter, 0, startCenter, endRadius, nil);
    UIImage *gradientOverlayImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Assemble Image
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradientOverlayImage drawInRect:CGRectMake(0,0,image.size.width,image.size.height) blendMode:kCGBlendModeScreen alpha:0.4];
    [viewImage drawInRect:CGRectMake(0, 0, 320, 150) blendMode:kCGBlendModeColorDodge alpha:1.0];
    [shadowImage drawInRect:CGRectMake(0,0,320,150)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

-(UIImage *)Downer:(UIImage *)image Text:(NSString *)title {
    
    //text
    UIFont *font = [UIFont fontWithName:@"Futura-Bold" size:100];
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    [text setFont:font];
    [text setText:title];
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentLeft;
    text.textColor = [UIColor whiteColor];
    text.adjustsFontSizeToFitWidth = NO;    
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(0,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:24.0];
    [[text layer] setShadowOpacity:1.0];
    
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   

    
    //rainbow filter
    CGFloat rainbowComponents[20] = {94.0/255.0, 80.0/255.0, 56.0/255.0, 1.0, 173.0/255.0, 113.0/255.0, 22.0/255.0, 1.0, 214.0/255.0, 237.0/255.0, 20.0/255.0, 1.0, 250.0/255.0, 189.0/255.0, 4.0/255.0, 1.0, 237.0/255.0, 235.0/255.0, 190.0/255.0, 1.0 };
    size_t rainbowNumLocations = 5;
    CGFloat rainbowLocations[5] = {0.0, 0.25, 0.46, 0.67, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();

    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(500.0, -960.0);
    CGPoint end = CGPointMake(0.0, 1200.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //main image
    //gradient overlay
    CGFloat components[28] = {1,0,0,1,1,1,0,1,0,1,0,1,0,1,1,1,0,0,1,1,1,0,1,1,1,0,0,1};
    size_t numLocations = 7;
    CGFloat locations[7] = {0.0, 0.17, 0.33, 0.5, 0.67, 0.83, 1.0};
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, components, locations, numLocations);
    
    CGPoint startCenter = CGPointMake(1500, -500);
    CGFloat endRadius = 2000;
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawRadialGradient(UIGraphicsGetCurrentContext(), gradient, startCenter, 0, startCenter, endRadius, kCGGradientDrawsAfterEndLocation);
    UIImage *gradientOverlayImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //texture
    
    
    //Assemble Image
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradientOverlayImage drawInRect:CGRectMake(0,0,image.size.width,image.size.height) blendMode:kCGBlendModeScreen alpha:0.4];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:0.5];
    [textImage drawInRect:CGRectMake(0, 0, 320, 150)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)DropLeft:(UIImage *)image Text:(NSString *)title {    
    //Mask
    UIImage *mask = [UIImage imageNamed:@"DropLeft_Mask"];
    
    //rainbow filter
    CGFloat rainbowComponents[8] = {0.0,0.0,0.0,1.0, 1.0,1.0,1.0,1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0, 0.0);
    CGPoint end = CGPointMake(320.0, 480.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeColor alpha:0.5];
    [mask drawInRect:CGRectMake(0, 0, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)DropRight:(UIImage *)image {
    //Mask
    UIImage *mask = [UIImage imageNamed:@"DropRight_Mask"];
    
    //rainbow filter
    CGFloat rainbowComponents[8] = {0.0,0.0,0.0,1.0, 1.0,1.0,1.0,1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0, 0.0);
    CGPoint end = CGPointMake(320.0, 480.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeColor alpha:0.5];
    [mask drawInRect:CGRectMake(0, 0, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)Fluffy:(UIImage *)image Text:(NSString *)title {
    
    //Text
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:100];
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    [text setFont:font];
    [text setText:title];
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    text.textColor = [UIColor whiteColor];
    text.adjustsFontSizeToFitWidth = YES;    
    
    //Gradient overlay
    CAGradientLayer *gradient = [CAGradientLayer layer];
    UIColor *colorOne = [UIColor colorWithRed:246.0/255.0 green:241.0/255.0 blue:178.0/255.0 alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:202.0/255.0 green:227.0/255.0 blue:204.0/255.0 alpha:1.0];
    UIColor *colorThree = [UIColor colorWithRed:152.0/255.0 green:216.0/255.0 blue:227.0/255.0 alpha:1.0]; 
    UIColor *colorFour = [UIColor colorWithRed:106.0/255.0 green:182.0/255.0 blue:203.0/255.0 alpha:1.0];
    UIColor *colorFive = [UIColor colorWithRed:69.0/255.0 green:153.0/255.0 blue:177.0/255.0 alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, colorThree.CGColor, colorFour.CGColor, colorFive.CGColor, nil];
    gradient.colors = colors;
    
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:0.31];
    NSNumber *stopThree = [NSNumber numberWithFloat:0.6];
    NSNumber *stopFour = [NSNumber numberWithFloat:0.8];
    NSNumber *stopFive = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, stopThree, stopFour, stopFive, nil];
    gradient.locations = locations;
    
    gradient.frame = text.bounds;

    UIGraphicsBeginImageContext(gradient.frame.size);
    [gradient renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    text.textColor = [UIColor colorWithPatternImage:gradientImage];
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(0,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:10.0];
    [[text layer] setShadowOpacity:0.89];
    
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   
        
    
    //rainbow filter
    
    CAGradientLayer *rainbowFilter = [CAGradientLayer layer];
    UIColor *red = [UIColor colorWithRed:225.0/255.0 green:0 blue:25/255.0 alpha:1.0];
    UIColor *green = [UIColor colorWithRed:0.0 green:96.0/255.0 blue:27.0/255.0 alpha:1.0];
    NSArray *rainbowColors = [NSArray arrayWithObjects:(id)red.CGColor, green.CGColor, nil];
    rainbowFilter.colors = rainbowColors;

    NSNumber *begin = [NSNumber numberWithFloat:0.0];
    NSNumber *end = [NSNumber numberWithFloat:1.0];
    NSArray *rainbowLocations = [NSArray arrayWithObjects:begin, end, nil];
    rainbowFilter.locations = rainbowLocations;
    
    [rainbowFilter setStartPoint:CGPointMake(-1.5, -1.5)];
    [rainbowFilter setEndPoint:CGPointMake(1.0, 1.0)];
    rainbowFilter.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    UIGraphicsBeginImageContext(image.size);
    [rainbowFilter renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Main Image
    
    //gradient overlay (Blend Mode = Screen)
    //CAGradientLayer *gradientOverlay = [self PurpleBlueGradientOverlay];
    
    CAGradientLayer *gradientOverlay = [CAGradientLayer layer];
    UIColor *overlayColorOne = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    UIColor *overlayColorTwo = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
    UIColor *overlayColorThree = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    UIColor *overlayColorFour = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    UIColor *overlayColorFive = [UIColor colorWithRed:0 green:1 blue:0 alpha:1];
    UIColor *overlayColorSix = [UIColor colorWithRed:1 green:1 blue:0 alpha:1];
    UIColor *overlayColorSeven = [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
    NSArray *overlayColors = [NSArray arrayWithObjects:(id) overlayColorOne.CGColor,overlayColorTwo.CGColor,overlayColorThree.CGColor,overlayColorFour.CGColor,overlayColorFive.CGColor,overlayColorSix.CGColor,overlayColorSeven.CGColor, nil];
    gradientOverlay.colors = overlayColors;
    
    NSNumber *overlayStopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *overlayStopTwo = [NSNumber numberWithFloat:0.17];
    NSNumber *overlayStopThree = [NSNumber numberWithFloat:0.33];
    NSNumber *overlayStopFour = [NSNumber numberWithFloat:0.50];
    NSNumber *overlayStopFive = [NSNumber numberWithFloat:0.67];
    NSNumber *overlayStopSix = [NSNumber numberWithFloat:0.83];
    NSNumber *overlayStopSeven = [NSNumber numberWithFloat:1.0];
    NSArray *overlayLocations = [NSArray arrayWithObjects:(id)overlayStopOne,overlayStopTwo,overlayStopThree,overlayStopFour,overlayStopFive,overlayStopSix,overlayStopSeven, nil];
    gradientOverlay.locations = overlayLocations;
    
    [gradientOverlay setStartPoint:CGPointMake(-1.5, 2.0)];
    [gradientOverlay setEndPoint:CGPointMake(5.0 ,-3.0)];
    gradientOverlay.frame = CGRectMake(0, 0, 320, 480);
    

    UIGraphicsBeginImageContext(image.size);
    [gradientOverlay renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientOverlayImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    //Assemble Image
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradientOverlayImage drawInRect:CGRectMake(0,0,image.size.width,image.size.height) blendMode:kCGBlendModeScreen alpha:0.4];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeLighten alpha:0.5];
    [viewImage drawInRect:CGRectMake(0, 0, 320, 150)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)JustRight:(UIImage *)image Text:(NSString *)title {
    //texture
    UIImage *texture = [UIImage imageNamed:@"Texture_1"];
    
    CGFloat rainbowComponents[8] = {20.0/255.0,237.0/255.0,183.0/255.0,1.0,
        250.0/255.0,56.0/255.0,4.0/255.0,1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(100, 0.0);
    CGPoint end = CGPointMake(0.0, 480.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:1.0];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeHardLight alpha:0.4];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeSoftLight alpha:0.4];    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)Knockout:(UIImage *)image Text:(NSString *)title {    
    
    //rainbow filter
    CGFloat rainbowComponents[16] = {249.0/255.0, 230.0/255.0, 0.0, 1.0, 111.0/255.0, 21.0/255.0, 108.0/255.0, 1.0, 253.0/255.0, 124.0/255.0, 0.0, 1.0, 0.0, 40.0/255.0, 116.0/255.0, 1.0 };
    size_t rainbowNumLocations = 4;
    CGFloat rainbowLocations[4] = {0.05, 0.35, 0.65, 0.95 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0, 720.0);
    CGPoint end = CGPointMake(0.0, 0.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeHardLight alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)LiteRite:(UIImage *)image Text:(NSString *)title {
    //base image
    
    //rainbow filter
    /* ORIGINAL GRADIENT
    CGFloat rainbowComponents[20] = {143.0/255.0, 71.0/255.0, 149.0/255.0, 1.0, 173.0/255.0, 113.0/255.0, 22.0/255.0, 1.0, 20.0/255.0, 237.0/255.0, 183.0/255.0, 1.0, 250.0/255.0, 56.0/255.0, 4.0/255.0, 1.0, 237.0/255.0, 235.0/255.0, 190.0/255.0, 1.0 };
    size_t rainbowNumLocations = 5;
    CGFloat rainbowLocations[5] = {0.0, 0.25, 0.46, 0.67, 1.0 };
    */
    CGFloat rainbowComponents[8] = { 20.0/255.0, 237.0/255.0, 183.0/255.0, 1.0, 250.0/255.0, 56.0/255.0, 4.0/255.0, 1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(73.0, -100.0);
    CGPoint end = CGPointMake(0.0, 480.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsBeforeStartLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;

}

-(UIImage *)Longwash:(UIImage *)image Text:(NSString *)title {
    //Texture
    UIImage *texture = [UIImage imageNamed:@"Texture_2"];
    UIImage *mask = [UIImage imageNamed:@"Longwash_Mask"];

    //rainbow filter
    CGFloat rainbowComponents[8] = {0.0,0.0,0.0,1.0, 1.0,1.0,1.0,1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0, 0.0);
    CGPoint end = CGPointMake(320.0, 480.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeColor alpha:0.5];
    [mask drawInRect:CGRectMake(0, 0, 320, 480)];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeScreen alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;    
}

-(UIImage *)PTA:(UIImage *)image {
    //Diamond Gradient
    //text with gradient
}

-(UIImage *)Purplicious:(UIImage *)image {
    //texture
    UIImage *texture = [UIImage imageNamed:@"Texture_4"];
    
    
}

-(UIImage *)Radsurf:(UIImage *)image Text:(NSString *)title {
    //texture
    UIImage *texture = [UIImage imageNamed:@"Texture_1"];
    
    //filter
    CGFloat rainbowComponents[20] = {
        160.0/255.0,134.0/255.0,87.0/255.0,1.0, 
        178.0/255.0,143.0/255.0,90.0/255.0,1.0,
        188.0/255.0,147.0/255.0,89.0/255.0,1.0,
        203.0/255.0,183.0/255.0,133.0/255.0,1.0,
        237.0/255.0,235.0/255.0,190.0/255.0,1.0 };
    size_t rainbowNumLocations = 5;
    CGFloat rainbowLocations[5] = {0.0, 0.25, 0.46, 0.67, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(100.0, 0.0);
    CGPoint end = CGPointMake(0.0, 720.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeOverlay alpha:0.5];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeHardLight alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;     
}

-(UIImage *)Rainbow:(UIImage *)image {

}

-(UIImage *)Rugged:(UIImage *)image Text:(NSString *)title {
    //Texture
    UIImage *texture = [UIImage imageNamed:@"Texture_3"];
    
    //Mask
    UIImage *mask = [UIImage imageNamed:@"Rugged_Mask"];
    
    //filter
    CGFloat rainbowComponents[8] = {20.0/255.0,237.0/255.0,183.0/255.0,1.0,
        250.0/255.0,56.0/255.0,4.0/255.0,1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(100, 0.0);
    CGPoint end = CGPointMake(0.0, 480.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [mask drawInRect:CGRectMake(0, 0, 320, 480)];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeSoftLight alpha:1.0];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)Scrawl:(UIImage *)image Text:(NSString *)title {
    //filter
    CGFloat components[20] = {250.0/255.0,229.0/255.0,177.0/255.0,1.0,
        244.0/255.0,190.0/255.0,178.0/255.0,1.0,
        238.0/255.0,149.0/255.0,172.0/255.0,1.0,
        182.0/255.0,125.0/255.0,173.0/255.0,1.0,
        132.0/255.0,106.0/255.0,175.0/255.0,1.0};
    size_t numLocations = 5;
    CGFloat locations[5] = {0.0,0.25,0.5,0.75,1.0};
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, components, locations, numLocations);
    
    CGPoint startCenter = CGPointMake(160, 240);
    CGFloat endRadius = 200;
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawRadialGradient(UIGraphicsGetCurrentContext(), gradient, startCenter, 0, startCenter, endRadius, kCGGradientDrawsAfterEndLocation);
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradientImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeOverlay alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;    
}

-(UIImage *)Str8up:(UIImage *)image Text:(NSString *)title {
    return image;
}

-(UIImage *)ThornRose:(UIImage *)image Text:(NSString *)title {
    //rainbow filter
    CGFloat rainbowComponents[8] = {41.0/255.0,10.0/255.0,89.0/255.0,1.0,
        1.0,124.0/255.0,0.0,1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0, 0.0);
    CGPoint end = CGPointMake(320.0, 480.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeLighten alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;

}

-(UIImage *)WashedOut:(UIImage *)image Text:(NSString *)title {
    //texture
    UIImage *texture = [UIImage imageNamed:@"Texture_2"];
    
    //rainbow filter
    CGFloat rainbowComponents[8] = {0.0,0.0,0.0,1.0, 1.0,1.0,1.0,1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0, 0.0);
    CGPoint end = CGPointMake(320.0, 480.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeColor alpha:0.5];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeScreen alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)YelloMello:(UIImage *)image Text:(NSString *)title {
    //Text
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:100];
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
    [text setFont:font];
    [text setText:title];
    text.numberOfLines = 1; 
    text.lineBreakMode = UILineBreakModeWordWrap;    
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    text.textColor = [UIColor colorWithRed:216.0/255.0 green:181.0/255.0 blue:39.0/255.0 alpha:1.0 ];
    text.adjustsFontSizeToFitWidth = YES;        
    
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Drop Shadow
    text.textColor = [UIColor clearColor];
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:20.0];
    [[text layer] setShadowOpacity:1.0];
    
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *shadowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();  
    
    //rainbow filter
    CGFloat rainbowComponents[20] = {1.0, 243.0/255.0, 59.0/255.0, 1.0, 
        209.0/255.0, 199.0/255.0, 117.0/255.0, 1.0, 
        159.0/255.0, 162.0/255.0, 144.0/255.0, 1.0, 
        106.0/255.0, 128.0/255.0, 164.0/255.0, 1.0,
        51.0/255.0, 103.0/255.0, 177.0/255.0, 1.0};
    size_t rainbowNumLocations = 5;
    CGFloat rainbowLocations[5] = {0.0, 0.28, 0.67, 0.89, 1.0};
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0, 480.0);
    CGPoint end = CGPointMake(0.0, 0.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //Assemble
    UIGraphicsBeginImageContext(image.size);
    //[image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeOverlay alpha:1.0];
    [textImage drawInRect:CGRectMake(0, 0, 320, 150) blendMode:kCGBlendModeLighten alpha:1.0];
    [shadowImage drawInRect:CGRectMake(0, 0, 320, 150)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
    
    
}


@end

