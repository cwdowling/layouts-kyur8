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

@property(nonatomic,strong) CIContext *context;
@property(nonatomic,strong) CIImage *beginImage;
@property(nonatomic,strong) CIFilter *filter;

@end

@implementation Filters

@synthesize context;
@synthesize beginImage;
@synthesize filter;

-(UIImage *)twoColorLinearGradient {
    filter = [CIFilter filterWithName:@"CILinearGradient" keysAndValues:@"inputPoint0",[CIVector vectorWithX:0 Y:0], @"inputPoint1",[CIVector vectorWithX:320 Y:480],@"inputcolor0",[CIColor colorWithRed:255 green:0 blue:0 alpha:0], @"inputcolor1",[CIColor colorWithRed:0 green:0 blue:255 alpha:0], nil];
     CIImage *outputImage =[filter outputImage];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

/*
-(CIImage *)createGradient:(CGContextRef *)context Rect:(CGRect)rect StartColor:(CGColorRef *)startColor EndColor:(
CGColorRef *)endColor {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = [NSArray arrayWithObjects:(id)startColor, (id)endColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, 
                                                        (CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    
}
 
 
-(CIImage *)blendGradient:(CIImage *)base {
    filter = [CIFilter filterWithName:@"CIScreenBlendMode"];
    [filter setValue:base forKey:@"inputImage"];
    
    
}

*/

-(UIImage *)Bacon:(UIImage *)image {
    
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];

    //base image

    //rainbow filter
        //
    
    //texture
        //gradient overlay
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)Bitchin:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    

    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)Clean:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
        //gradient overlay
    filter = [CIFilter filterWithName:@"CIScreenBlendMode"];
    [filter setValue:image forKey:@"inputImage"];
    
    //CIImage *gradient = [self createGradient];

    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    CGImageRelease(cgimg);
    return newImg;
}

-(UIImage *)Downer:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)DropLeft:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)DropRight:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)Fluffy:(UIImage *)image Text:(NSString *)title {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    
    //Text
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:100];
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
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
    UIColor *green = [UIColor colorWithRed:202.0/255.0 green:227.0/255.0 blue:204.0/255/0 alpha:1.0];
    NSArray *rainbowColors = [NSArray arrayWithObjects:(id)red.CGColor, green.CGColor, nil];
    rainbowFilter.colors = rainbowColors;

    NSNumber *begin = [NSNumber numberWithFloat:0.0];
    NSNumber *end = [NSNumber numberWithFloat:1.0];
    NSArray *rainbowLocations = [NSArray arrayWithObjects:begin, end, nil];
    rainbowFilter.locations = rainbowLocations;
    
    [rainbowFilter setStartPoint:CGPointMake(-0.5, -0.5)];
    [rainbowFilter setEndPoint:CGPointMake(1.0, 1.0)];
    rainbowFilter.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    UIGraphicsBeginImageContext(image.size);
    [rainbowFilter renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Main Image
    
    //gradient overlay (Blend Mode = Screen)
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
    
    [gradientOverlay setStartPoint:CGPointMake(-0.25, 1.25)];
    [gradientOverlay setEndPoint:CGPointMake(4.0 ,-3.0)];
    gradientOverlay.frame = CGRectMake(0, 0, 320, 480);
    
    UIGraphicsBeginImageContext(image.size);
    [gradientOverlay renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientOverlayImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradientOverlayImage drawInRect:CGRectMake(0,0,image.size.width,image.size.height) blendMode:kCGBlendModeScreen alpha:0.4];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeNormal alpha:0.5];
    [viewImage drawInRect:CGRectMake(0, 0, 320, 150)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
    //Assemble

    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)JustRight:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)Knockout:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)LiteRite:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)Longwash:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)PTA:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)Purplicious:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)Radsurf:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)Rainbow:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)Rugged:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)Str8up:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)ThornRose:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)WashedOut:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}

-(UIImage *)YelloMello:(UIImage *)image {
    beginImage = [CIImage imageWithCGImage:[image CGImage]];
    context = [CIContext contextWithOptions:nil];
    
    //base image
    
    //rainbow filter
    //
    
    //texture
    //gradient overlay
    
    
    
    filter = [CIFilter filterWithName:@"CISepiaTone" 
                        keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", 
              [NSNumber numberWithFloat:0.8], nil];
    
    
    
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    UIImage *newImg = [UIImage imageWithCGImage:cgimg];    
    
    CGImageRelease(cgimg);
    
    return newImg;
}


@end

