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
#import "VerticallyAlignedLabel.h"
#import "VerticallyAlignedLabel.h"

@interface Filters ()
-(UIImage *)endPhoto:(UIImage *)image;
-(UIImage *)textShadow:(UILabel *)text;

-(UILabel *)BaconText:(NSString *)title End:(BOOL)lastPicture;
-(UILabel *)BitchinText:(NSString *)title End:(BOOL)lastPicture;
-(UILabel *)BuhlooText:(NSString *)title End:(BOOL)lastPicture;
-(UILabel *)CleanText:(NSString *)title End:(BOOL)lastPicture;
-(UILabel *)CutUpText:(NSString *)title End:(BOOL)lastPicture;
-(UILabel *)DownerText:(NSString *)title End:(BOOL)lastPicture;
-(UILabel *)FluffyText:(NSString *)title End:(BOOL)lastPicture;
-(UILabel *)LabelsText:(NSString *)title End:(BOOL)lastPicture;

-(UILabel *)ScrawlText:(NSString *)title;
-(UIImage *)YBTextGradient;
@property(strong,nonatomic) UIImage *YBTextGradient;

-(UILabel *)Str8upText:(NSString *)title;

-(UIImage *)changeWhiteColorTransparent:(UIImage *)image;
@end

@implementation Filters

@synthesize YBTextGradient = _YBTextGradient;
/* Text Completed
 DropLeft
 DropRight


/*  QUESTIONS
Same gradient overlays on pictures
Longwash mask. original picture not visible at all
Banding from 3+ color gradients
PinSoftLight Blend Mode not supported
ThornRose not right because of fill on rainbow filter in original psd file
 
Rainbow requires angle gradient - fixed by adding image in library
 
    TO DO
fix the old CAGradientLayers
add textures with pinlight somehow
take out possible extra gradients
*/

-(CGRect)textRect {
    return CGRectMake(0, 0, 320, 480);
}

-(UIImage *)endPhoto:(UIImage *)image {
    //GPUImageGaussianBlurFilter *filter = [[GPUImageGaussianBlurFilter alloc] init];
    //return [filter imageByFilteringImage:image];
}



-(UIImage *)Bacon:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    UILabel *text = [self BaconText:title End:lastPicture];
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //texture
    UIImage *texture = [UIImage imageNamed:@"Texture_1"];
    
    //rainbow filter
    CGFloat rainbowComponents[8] = {186.0/255.0, 144.0/255.0, 89.0/255.0, 1.0, 204.0/255.0, 185.0/255.0, 135.0/255.0, 1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0.0, 480.0);
    CGPoint end = CGPointMake(73.0, -0.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();  

    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:0.64];
    [texture drawInRect:CGRectMake(0, 0, image.size.width, image.size.width) blendMode:kCGBlendModeHardLight alpha:0.4];
    [textImage drawInRect:CGRectMake(0, 50 + 180*(lastPicture), 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;

}
-(UILabel *)BaconText:(NSString *)title End:(BOOL)lastPicture {
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"AppleGothic" size:60];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    if(lastPicture) {
        [text setText:@"FINIS."];
        text.textAlignment = UITextAlignmentCenter;
    } else {
        [text setText:upperTitle];
        text.textAlignment = UITextAlignmentLeft;
    }
    text.verticalAlignment = VerticalAlignmentTop;
    [text setFont:font];
    text.lineHeight = 60;
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.textColor = [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:239.0/255.0 alpha:1.0];
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];   
    
    return text;    
}

-(UIImage *)Bitchin:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
        
    //text
    UILabel *text = [self BitchinText:title End:lastPicture];
    UIGraphicsBeginImageContext(text.frame.size);
    CGContextRotateCTM (UIGraphicsGetCurrentContext(), 0.025);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   
    
    //shadow
    UIImage *shadowImage = [self textShadow:text];
        
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
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:1.0];
    [textImage drawInRect:CGRectMake(0, 50 + 180*(lastPicture), 320, 480) blendMode:kCGBlendModeColorDodge alpha:1.0];
    [shadowImage drawInRect:CGRectMake(0, 50 + 180*(lastPicture), 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(UILabel *)BitchinText:(NSString *)title End:(BOOL)lastPicture {
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"Journal" size:60];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    if(lastPicture) {
        [text setText:@"THE END"];
        text.textAlignment = UITextAlignmentCenter;
    } else {
        [text setText:upperTitle];
        text.textAlignment = UITextAlignmentLeft;
    }
    text.lineHeight = 60;
    [text setFont:font];
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.verticalAlignment = VerticalAlignmentTop;
    text.textColor = [UIColor colorWithRed:213.0/255.0 green:153.0/255.0 blue:125.0/255.0 alpha:1.0];
    
    return text;
}

-(UIImage *)Buhloo:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    UILabel *text = [self BuhlooText:title End:lastPicture];
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   
    
    UIImage *shadowImage = [self textShadow:text];
    
    //texture
    UIImage *texture = [UIImage imageNamed:@"Texture_1"];
    
    //rainbow filter
    CGFloat rainbowComponents[12] = {244.0/255.0, 238.0/255.0, 235.0/255.0, 1.0, 24.0/255.0, 48.0/255.0, 153.0/255.0, 1.0, 
        10.0/255.0, 16.0/255.0, 41.0/255.0, 1.0};
    size_t rainbowNumLocations = 3;
    CGFloat rainbowLocations[5] = {0.0, 0.61, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0.0, 600.0);
    CGPoint end = CGPointMake(73.0, -120.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();  
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:1.0];
    [texture drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeLighten alpha:0.4];
    [textImage drawInRect:CGRectMake(0, 50 + 180*(lastPicture), 320, 480) blendMode:kCGBlendModeLighten alpha:1.0];
    //[shadowImage drawInRect:CGRectMake(0, 50 + 180*(lastPicture), 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(UILabel *)BuhlooText:(NSString *)title End:(BOOL)lastPicture {
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"Minotaur" size:80];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    if(lastPicture) {
        [text setText:@"THE END"];
        text.textAlignment = UITextAlignmentCenter;
    } else {
        [text setText:upperTitle];
        text.textAlignment = UITextAlignmentLeft;
    }
    text.lineHeight = 60;
    [text setFont:font];
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.textColor = [UIColor colorWithRed:125.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0];
    
    return text;
}

-(UIImage *)Clean:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    
    UILabel *text = [self CleanText:title End:(BOOL)lastPicture];
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   
    
    UIImage *shadowImage = [self textShadow:text];
    
    //Assemble Image
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [textImage drawInRect:CGRectMake(0, 50 + 180*lastPicture, 320, 480) blendMode:kCGBlendModeColorDodge alpha:1.0];
    //[shadowImage drawInRect:CGRectMake(0, 50 + 180*lastPicture, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(UILabel *)CleanText:(NSString *)title End:(BOOL)lastPicture {
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:80];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:[self textRect]];
    if(lastPicture) {
        [text setText:@"FINIS"];
        text.textAlignment = UITextAlignmentCenter;
    } else {
        [text setText:upperTitle];
        text.textAlignment = UITextAlignmentLeft;
    }
    text.lineHeight = 60;
    [text setFont:font];
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.textColor = [UIColor colorWithRed:213.0/255.0 green:153.0/255.0 blue:125.0/255.0 alpha:1.0];
    
    return text;
}

-(UIImage *)CutUp:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    UILabel *text = [self CutUpText:title End:(BOOL)lastPicture];
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();   
        
    //rainbow filter
    CGFloat rainbowComponents[28] = {183.0/255.0, 21.0/255.0, 27.0/255.0, 1.0, 230.0/255.0, 65.0/255.0, 75.0/255.0, 1.0, 
        233.0/255.0, 137.0/255.0, 123.0/255.0, 1.0,
        124.0/255.0, 120.0/255.0, 184.0/255.0, 1.0,
        0.0, 176.0/255.0, 176.0/255.0, 1.0,
        123.0/255.0, 118.0/255.0, 182.0/255.0, 1.0,
        231.0/255.0, 50.0/255.0, 47.0/255.0, 1.0 };
    size_t rainbowNumLocations = 7;
    CGFloat rainbowLocations[7] = {0.0, 0.15, 0.30, 0.47, 0.64, 0.79, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(150.0, -480.0);
    CGPoint end = CGPointMake(0.0, 960.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();  
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:1.0];
    [textImage drawInRect:CGRectMake(0, 50 + 120*lastPicture, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(UILabel *)CutUpText:(NSString *)title End:(BOOL)lastPicture {
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"BlackCasper" size:80];    
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    if(lastPicture) {
        [text setText:@"THE END"];
        text.textAlignment = UITextAlignmentCenter;
    } else {
        [text setText:upperTitle];
        text.textAlignment = UITextAlignmentLeft;
    }
    text.lineHeight = 80;
    [text setFont:font];
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.textColor = [UIColor colorWithRed:255.0/255.0 green:254.0/255.0 blue:254.0/255.0 alpha:1.0];
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];
    
    return text;
}

-(UIImage *)Downer:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    UILabel *text = [self DownerText:title End:(BOOL)lastPicture];
    UIGraphicsBeginImageContext(text.frame.size);
    CGContextRotateCTM (UIGraphicsGetCurrentContext(), -0.025);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //texture
    UIImage *texture = [UIImage imageNamed:@"Texture_1"];
    
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
    
    //Assemble Image
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:0.5];
    [textImage drawInRect:CGRectMake(0, 50 + 160*lastPicture, 320, 480)];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeHardLight alpha:0.4];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UILabel *)DownerText:(NSString *)title End:(BOOL)lastPicture{
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:50];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 240, 480)];
    if(lastPicture) {
        [text setText:@"THE END."];
        text.textAlignment = UITextAlignmentCenter;
    } else {
        [text setText:upperTitle];
        text.textAlignment = UITextAlignmentLeft;
    }
    text.lineHeight = 40;
    text.verticalAlignment = VerticalAlignmentTop;
    [text setFont:font];
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.textColor = [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:239.0/255.0 alpha:1.0];
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];   

    return text;
}

-(UIImage *)DropLeft:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {    
    //text
    NSString *upperTitle = [title uppercaseString];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 240)];
    text.lineHeight = 20;
    UIFont *font = [UIFont fontWithName:@"GillSans-Bold" size:20];
    [text setFont:font];
    if(lastPicture) {
        [text setText:@"THE END"];
    } else {
        [text setText:upperTitle];
    }
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentLeft;
    text.verticalAlignment = VerticalAlignmentBottom;
    text.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:2.0];
    [[text layer] setShadowOpacity:1.0]; 
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
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
    if([title length]>0) {
        UIImage *mask = [UIImage imageNamed:@"DropLeft_Mask"];
        [mask drawInRect:CGRectMake(0, 56, 320, 480)];
    }
    [textImage drawInRect:CGRectMake(5, 240, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)DropRight:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    NSString *upperTitle = [title uppercaseString];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 160)];
    text.lineHeight = 20;
    UIFont *font = [UIFont fontWithName:@"GillSans-Bold" size:20];
    [text setFont:font];
    if(lastPicture) {
        [text setText:@"THE END"];
    } else {
        [text setText:upperTitle];
    }
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentLeft;
    text.verticalAlignment = VerticalAlignmentBottom;
    text.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:2.0];
    [[text layer] setShadowOpacity:1.0]; 
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
        
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
    if([title length]>0) {
        UIImage *mask = [UIImage imageNamed:@"DropRight_Mask"];
        [mask drawInRect:CGRectMake(0, 56, 320, 480)];
    }
    [textImage drawInRect:CGRectMake(215, 150, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)Fluffy:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    UIImage *textImage;
    if(lastPicture) {
        UILabel *text = [self FluffyText:title End:lastPicture];
        UIGraphicsBeginImageContext(image.size);
        [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
        textImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    } else {
        VerticallyAlignedLabel *divider = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        [divider setFont:[UIFont fontWithName:@"Molot" size:80]];
        NSArray *lines = [divider stringsFromText:title];
        NSLog(@"%d",[lines count]);
        
        NSMutableArray *labels = [[NSMutableArray alloc] init];
        for(NSString *line in lines) {
            UIGraphicsBeginImageContext(image.size);
            UILabel *text = [self FluffyText:line End:(BOOL)lastPicture];
            [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
            [labels addObject:UIGraphicsGetImageFromCurrentImageContext()];
            UIGraphicsEndImageContext();
        }
        
        UIGraphicsBeginImageContext(image.size);
        int line = 0;
        for(UIImage *labelImage in labels) {
            [labelImage drawInRect:CGRectMake(0, 50+60*line, 320, 480)];
            ++line;
        }
        textImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
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
    
    //Assemble Image
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeLighten alpha:0.5];
    [textImage drawInRect:CGRectMake(0, 0 + 210*lastPicture, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


-(UILabel *)FluffyText:(NSString *)title End:(BOOL)lastPicture {
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"Molot" size:100];
    UILabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [text setFont:font];
    if(lastPicture) {
        [text setText:@"END."];
    } else {
        [text setText:upperTitle];
    }
    text.numberOfLines = 1;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    text.textColor = [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:239.0/255.0 alpha:1.0];
    text.adjustsFontSizeToFitWidth = YES;
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];   
    
    text.textColor = [UIColor colorWithPatternImage:self.YBTextGradient];
    
    return text;
}

-(UIImage *)JustRight:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    UIImage *textImage;
    UIImage *shadowImage;
    UIGraphicsBeginImageContext(image.size);
    CGContextRotateCTM (UIGraphicsGetCurrentContext(), 0.025);
    if(lastPicture) {
        VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        UIFont *font = [UIFont fontWithName:@"GillSans-Bold" size:50];
        [text setFont:font];
        [text setText:@"THE END."];
        text.numberOfLines = 1;
        text.backgroundColor = [UIColor clearColor];
        text.textAlignment = UITextAlignmentCenter;
        text.verticalAlignment = VerticalAlignmentTop;
        text.textColor = [UIColor colorWithRed:231.0/255.0 green:194.0/255.0 blue:82.0/255.0 alpha:1.0];
        
        UIGraphicsBeginImageContext(image.size);
        CGContextRotateCTM (UIGraphicsGetCurrentContext(), 0.025);
        [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
        textImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();

        shadowImage = [self textShadow:text];


    } else {
        NSMutableArray *stringsArray = [[title componentsSeparatedByString:@" "] mutableCopy];
        NSMutableArray *wordImages = [[NSMutableArray alloc] init];
        for(NSString *word in stringsArray) {
            NSString *upperTitle = [word uppercaseString];
            VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
            UIFont *font = [UIFont fontWithName:@"GillSans-Bold" size:35];
            [text setFont:font];
            [text setText:upperTitle];
            text.numberOfLines = 1;
            text.backgroundColor = [UIColor clearColor];
            text.textAlignment = UITextAlignmentRight;
            text.verticalAlignment = VerticalAlignmentTop;
            text.textColor = [UIColor colorWithRed:231.0/255.0 green:194.0/255.0 blue:82.0/255.0 alpha:1.0];
            text.adjustsFontSizeToFitWidth = YES;
            UIGraphicsBeginImageContext(image.size);
            [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
            [wordImages addObject:UIGraphicsGetImageFromCurrentImageContext()];
            UIGraphicsEndImageContext();
        }
        UIGraphicsBeginImageContext(image.size);
        int line = 0;
        for(UIImage *word in wordImages) {
            [word drawInRect:CGRectMake(0, 50 + line*30, 320, 480)];
            ++line;
        }
        textImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
        
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
    [textImage drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeColorDodge alpha:1.0]; 
    //[shadowImage drawInRect:CGRectMake(0, 0, 320, 480)]; 
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)Knockout:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {    
    //text
    NSString *upperTitle = [title uppercaseString];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    if(lastPicture) {
        [text setText:@"PEACE OUT ;)"];
        [text setFont:[UIFont fontWithName:@"Optima-ExtraBlack" size:30]];
        text.textAlignment = UITextAlignmentCenter;
    } else { 
        [text setText:upperTitle];
        [text setFont:[UIFont fontWithName:@"Optima-ExtraBlack" size:50]];
        text.textAlignment = UITextAlignmentLeft;
    }
    text.lineHeight = 40;
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.textColor = [UIColor colorWithRed:213.0/255.0 green:153.0/255.0 blue:125.0/255.0 alpha:1.0];
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *shadowImage = [self textShadow:text];
    
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
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeHardLight alpha:0.2];
    [textImage drawInRect:CGRectMake(0, 50 + 160*lastPicture, 320, 480) blendMode:kCGBlendModeColorDodge alpha:1.0];
    //[shadowImage drawInRect:CGRectMake(0, 50 + 160*lastPicture, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)Labels:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    UILabel *text = [self LabelsText:title End:(BOOL)lastPicture];
    UIGraphicsBeginImageContext(text.frame.size);
    CGContextRotateCTM (UIGraphicsGetCurrentContext(), 0.02);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
        
    //rainbow filter
    CGFloat rainbowComponents[28] = {183.0/255.0, 21.0/255.0, 27.0/255.0, 1.0, 230.0/255.0, 65.0/255.0, 75.0/255.0, 1.0, 
        233.0/255.0, 137.0/255.0, 123.0/255.0, 1.0,
        124.0/255.0, 120.0/255.0, 184.0/255.0, 1.0,
        0.0, 176.0/255.0, 176.0/255.0, 1.0,
        123.0/255.0, 118.0/255.0, 182.0/255.0, 1.0,
        231.0/255.0, 50.0/255.0, 47.0/255.0, 1.0 };
    size_t rainbowNumLocations = 7;
    CGFloat rainbowLocations[7] = {0.0, 0.15, 0.30, 0.47, 0.64, 0.79, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();

    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);

    CGPoint start = CGPointMake(150.0, -480.0);
    CGPoint end = CGPointMake(0.0, 960.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();  
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:1.0];
    [textImage drawInRect:CGRectMake(0, 65 + 160*lastPicture, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(VerticallyAlignedLabel *)LabelsText:(NSString *)title End:(BOOL)lastPicture {
    //Text
    UIFont *font = [UIFont fontWithName:@"ImpactLabel" size:60];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [text setFont:font];
    if(lastPicture) {
        [text setText:@"FINIS."];
    } else {
        [text setText:title];
    }
    text.lineHeight = 60;
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];
    
    //gradient
    CGFloat rainbowComponents[8] = { 1.0, 1.0, 1.0, 1.0, 0.8, 0.8, 0.8, 1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(320.0, 0.0);
    
    UIGraphicsBeginImageContext(CGSizeMake(320, 480));
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsBeforeStartLocation);
    UIImage *gradient = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();  
    
    text.textColor = [UIColor colorWithPatternImage:gradient];
    
    return text;
}

-(UIImage *)LiteRite:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    NSString *upperTitle = [title uppercaseString];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 240, 480)];
    text.lineHeight = 30;
    UIFont *font = [UIFont fontWithName:@"GillSans-Light" size:40];
    [text setFont:font];
    [text setText:upperTitle];
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentRight;
    text.verticalAlignment = VerticalAlignmentTop;
    text.textColor = [UIColor colorWithRed:231.0/255.0 green:194.0/255.0 blue:82.0/255.0 alpha:1.0];
    
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *shadowImage = [self textShadow:text];

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
    [textImage drawInRect:CGRectMake(0, 50, image.size.width, image.size.height) blendMode:kCGBlendModeColorDodge alpha:1.0];
    [shadowImage drawInRect:CGRectMake(0, 50, image.size.width, image.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;

}

-(UIImage *)Longwash:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    NSString *upperTitle = [title uppercaseString];
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 250)];
    UIFont *font = [UIFont fontWithName:@"Futura-CondensedMedium" size:300];
    [text setFont:font];
    [text setText:upperTitle];
    text.numberOfLines = 1;
    text.adjustsFontSizeToFitWidth = YES;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:3.0];
    [[text layer] setShadowOpacity:1.0];

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
    
    //text Gradient
    CGPoint textStart = CGPointMake(0, 300);
    CGPoint textEnd = CGPointMake(0, 100);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, textStart, textEnd, kCGGradientDrawsAfterEndLocation);
    UIImage *textGradient = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    text.textColor = [UIColor colorWithPatternImage:textGradient];
    
    UIGraphicsBeginImageContext(image.size);
    CGContextRotateCTM (UIGraphicsGetCurrentContext(), -0.025);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeColor alpha:0.5];
    [mask drawInRect:CGRectMake(0, 50, 320, 480)];
    [textImage drawInRect:CGRectMake(0, -115, 320, 480) blendMode:kCGBlendModeDarken alpha:1.0];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeScreen alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;    
}

-(UIImage *)PTA:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    NSString *upperTitle = [title uppercaseString];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
    UIFont *font = [UIFont fontWithName:@"MyriadPro-Cond" size:120];
    [text setFont:font];
    [text setText:upperTitle];
    text.numberOfLines = 0;
    text.lineHeight = 90;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentLeft;
    
    CGFloat textComponents[20] = {
        246.0/255.0,241.0/255.0,178.0/255.0,0.3, 
        202.0/255.0,227.0/255.0,204.0/255.0,0.3,
        152.0/255.0,216.0/255.0,227.0/255.0,0.3,
        106.0/255.0,182.0/255.0,203.0/255.0,0.3,
        69.0/255.0,153.0/255.0,177.0/255.0,0.3 };
    size_t textNumLocations = 5;
    CGFloat textLocations[5] = {0.0, 0.31, 0.60, 0.80, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, textComponents, textLocations, textNumLocations);
    
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(0.0, 300.0);
    
    UIGraphicsBeginImageContext(CGSizeMake(320, 200));
    [[UIColor whiteColor] setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, 320, 300));
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *textGradient = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    text.textColor = [UIColor colorWithPatternImage:textGradient];
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];

    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //Diamond Gradient
    UIImage *gradient = [UIImage imageNamed:@"PTA_Gradient"];
        
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradient drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeLighten alpha:1.0];
    [textImage drawInRect:CGRectMake(0, 50, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;  
}

-(UIImage *)Purplicious:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    NSString *upperTitle = [title uppercaseString];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
    UIFont *font = [UIFont fontWithName:@"Journal" size:100];
    [text setFont:font];
    [text setText:upperTitle];
    text.numberOfLines = 0;
    text.lineHeight = 60;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    text.verticalAlignment = VerticalAlignmentTop;
    
    text.textColor = [UIColor whiteColor];
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor colorWithRed:229.0/255.0 green:184.0/255.0 blue:251.0/255.0 alpha:1.0] CGColor]];
    [[text layer] setShadowRadius:3.0];
    [[text layer] setShadowOpacity:1.0];
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //texture
    UIImage *texture = [UIImage imageNamed:@"Texture_4"];
    
    //filter
    CGFloat rainbowComponents[20] = {
        122.0/255.0,54.0/255.0,161.0/255.0,1.0, 
        152.0/255.0,92.0/255.0,186.0/255.0,1.0,
        120.0/255.0,94.0/255.0,135.0/255.0,1.0,
        166.0/255.0,60.0/255.0,227.0/255.0,1.0,
        237.0/255.0,235.0/255.0,190.0/255.0,1.0 };
    size_t rainbowNumLocations = 5;
    CGFloat rainbowLocations[5] = {0.0, 0.25, 0.46, 0.67, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(100.0, 120.0);
    CGFloat end = 360;
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawRadialGradient(UIGraphicsGetCurrentContext(), rainbow, start, 0, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeHardLight alpha:1.0];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeSoftLight alpha:1.0];
    [textImage2 drawInRect:CGRectMake(0, 50, 320, 480)];
    [textImage1 drawInRect:CGRectMake(0, 50, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;  
}

-(UIImage *)Rainbow:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    NSString *upperTitle = [title uppercaseString];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 240, 480)];
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:50];
    [text setFont:font];
    [text setText:upperTitle];
    text.numberOfLines = 0;
    text.lineHeight = 40;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentLeft;
    text.verticalAlignment = VerticalAlignmentTop;
    
    text.textColor = [UIColor blackColor];
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor whiteColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *gradient = [UIImage imageNamed:@"Rainbow_Gradient"];
 
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradient drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeLighten alpha:1.0];
    [textImage drawInRect:CGRectMake(0, 50, 320, 480) blendMode:kCGBlendModeNormal alpha:0.70];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)Rugged:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 250)];
    UIFont *font = [UIFont fontWithName:@"Baskerville-Bold" size:300];
    [text setFont:font];
    [text setText:title];
    text.numberOfLines = 1;
    text.adjustsFontSizeToFitWidth = YES;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    
    text.textColor = [UIColor colorWithRed:114.0/255.0 green:111.0/255.0 blue:105.0/255.0 alpha:1.0];
    
    UIGraphicsBeginImageContext(image.size);
    CGContextRotateCTM (UIGraphicsGetCurrentContext(), -0.025);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *shadowImage = [self textShadow:text];
    
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
    [mask drawInRect:CGRectMake(0, 50, 320, 480)];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeSoftLight alpha:1.0];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:1.0];
    [textImage drawInRect:CGRectMake(0, -115, 320, 480) blendMode:kCGBlendModeColorBurn alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)Scrawl:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    UILabel *text = [self ScrawlText:title];
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *shadowImage = [self textShadow:text];
    
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
    [textImage drawInRect:CGRectMake(0, 50, 320, 480) blendMode:kCGBlendModeHardLight alpha:1.0];
    [textImage drawInRect:CGRectMake(0, 50, 320, 480) blendMode:kCGBlendModeNormal alpha:1.0];

    //[shadowImage drawInRect:CGRectMake(0, 50, 320, 480) blendMode:kCGBlendModeNormal alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;    
}

-(UILabel *)ScrawlText:(NSString *)title {    
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"GoodDog" size:110];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [text setFont:font];
    [text setText:upperTitle];
    text.backgroundColor = [UIColor clearColor];
    text.verticalAlignment = VerticalAlignmentTop;
    text.textAlignment = UITextAlignmentCenter;
    text.lineHeight = 80;
    text.numberOfLines = 0;
    
    int linesNeeded = [[text stringsFromText:text.text] count];
    
    CGFloat textComponents[20] = {
        246.0/255.0,241.0/255.0,178.0/255.0,1.0, 
        202.0/255.0,227.0/255.0,204.0/255.0,1.0,
        152.0/255.0,216.0/255.0,227.0/255.0,1.0,
        106.0/255.0,182.0/255.0,203.0/255.0,1.0,
        69.0/255.0,153.0/255.0,177.0/255.0,1.0 };
    size_t textNumLocations = 5;
    CGFloat textLocations[5] = {0.0, 0.31, 0.60, 0.80, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, textComponents, textLocations, textNumLocations);
    
    CGPoint end = CGPointMake(0.0, 100.0 + text.lineHeight*linesNeeded);
    CGPoint start = CGPointMake(0.0, 0.0);
    
    UIGraphicsBeginImageContext(CGSizeMake(320, 100.0 + text.lineHeight*linesNeeded));
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *gradient = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(text.frame.size);
    [[UIColor colorWithRed:227.0/255.0 green:213.0/255.0 blue:233.0/255.0 alpha:1.0] setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), text.frame);
    [gradient drawInRect:CGRectMake(0, 0, text.frame.size.width, text.frame.size.height) blendMode:kCGBlendModeMultiply alpha:0.3];
    UIImage *textColor = UIGraphicsGetImageFromCurrentImageContext();
    CGContextFillRect(UIGraphicsGetCurrentContext(), text.frame);

    text.textColor = [UIColor colorWithPatternImage:textColor];

    return text;
    
}

-(UIImage *)YBTextGradient {
    if(!_YBTextGradient) {
        CGFloat textComponents[20] = {
            246.0/255.0,241.0/255.0,178.0/255.0,1.0, 
            202.0/255.0,227.0/255.0,204.0/255.0,1.0,
            152.0/255.0,216.0/255.0,227.0/255.0,1.0,
            106.0/255.0,182.0/255.0,203.0/255.0,1.0,
            69.0/255.0,153.0/255.0,177.0/255.0,1.0 };
        size_t textNumLocations = 5;
        CGFloat textLocations[5] = {0.0, 0.31, 0.60, 0.80, 1.0 };
        CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
        
        CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, textComponents, textLocations, textNumLocations);
        
        CGPoint start = CGPointMake(0.0, 100.0);
        CGPoint end = CGPointMake(0.0, 0.0);
        
        UIGraphicsBeginImageContext(CGSizeMake(320, 100));
        CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
        _YBTextGradient = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    NSLog(@"uiimage created");    
    return _YBTextGradient;
    } else {
        return _YBTextGradient;
    }
}

-(UIImage *)Str8up:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    UILabel *text = [self Str8upText:title];
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [textImage drawInRect:CGRectMake(0, 50, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UILabel *)Str8upText:(NSString *)title {
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"BebasNeue" size:80];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    text.verticalAlignment = VerticalAlignmentTop;
    [text setFont:font];
    [text setText:upperTitle];
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    text.textColor = [UIColor whiteColor];
    text.numberOfLines = 0;
    text.lineHeight = 80;
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];   
    
    return text;
}

-(UIImage *)ThornRose:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"Journal" size:80];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    text.verticalAlignment = VerticalAlignmentTop;
    [text setFont:font];
    [text setText:upperTitle];
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentLeft;
    text.textColor = [UIColor colorWithRed:199.0/255.0 green:32.0/255.0 blue:193.0/255.0 alpha:1.0];
    text.numberOfLines = 0;
    text.lineHeight = 60;
    
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *shadowImage = [self textShadow:text];
    
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
    [textImage drawInRect:CGRectMake(0, 50, 320, 480) blendMode:kCGBlendModeColorDodge alpha:1.0];
    //[shadowImage drawInRect:CGRectMake(0, 50, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;

}

-(UIImage *)WashedOut:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //text
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:80];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    text.verticalAlignment = VerticalAlignmentTop;
    [text setFont:font];
    [text setText:upperTitle];
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentLeft;
    text.numberOfLines = 0;
    text.lineHeight = 60;
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor whiteColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0]; 
    
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
    
    //textGradient
    int linesNeeded = [[text stringsFromText:text.text] count];

    CGPoint textStart = CGPointMake(0.0, 100.0 + linesNeeded*text.lineHeight);
    CGPoint textEnd = CGPointMake(0, -200.0);
    
    UIGraphicsBeginImageContext(CGSizeMake(320, 100.0 + linesNeeded*text.lineHeight));
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, textStart, textEnd, kCGGradientDrawsAfterEndLocation);
    UIImage *textGradient = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    text.textColor = [UIColor colorWithPatternImage:textGradient];
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeColor alpha:0.5];
    [textImage drawInRect:CGRectMake(0, 50, 320, 480) blendMode:kCGBlendModeNormal alpha:1.0];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeScreen alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage *)YelloMello:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture {
    //Text
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:80];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [text setFont:font];
    [text setText:title];
    text.numberOfLines = 0;
    text.lineHeight = 60; 
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    text.verticalAlignment = VerticalAlignmentTop;
    text.textColor = [UIColor colorWithRed:216.0/255.0 green:181.0/255.0 blue:39.0/255.0 alpha:1.0 ];
    
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *shadowImage = [self textShadow:text];
    
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
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeOverlay alpha:1.0];
    [textImage drawInRect:CGRectMake(0, 50, 320, 480) blendMode:kCGBlendModeLighten alpha:1.0];
    //[shadowImage drawInRect:CGRectMake(0, 0, 320, 150)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
    
    
}

-(UIImage *)textShadow:(UILabel *)text {
    text.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor darkGrayColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];
    
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *shadowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *final = [self changeWhiteColorTransparent:shadowImage];
    return final;
}

-(UIImage *)changeWhiteColorTransparent: (UIImage *)image {
    /*
    CGImageRef rawImageRef=image.CGImage;
    
    const float colorMasking[6] = {222, 255, 222, 255, 222, 255};
    
    UIGraphicsBeginImageContext(image.size);
    CGImageRef maskedImageRef=CGImageCreateWithMaskingColors(rawImageRef, colorMasking);
    
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0.0, image.size.height);
    CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0, -1.0); 
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, image.size.width, image.size.height), maskedImageRef);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    CGImageRelease(maskedImageRef);
    UIGraphicsEndImageContext();    
    return result;
    */
     
    CGContextRef final;
    CGImageRef imageRef = [image CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *picData = malloc(height * width * 4);
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    
    CGContextRef context = CGBitmapContextCreate(picData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
 
    for(int i=0; i<width*height; i+=4) {
        if(picData[i] >= 222 && picData[i+1]>=222 && picData[i+2]>=222) {
            picData[i+3] = 0;
        }
    }
    
    final = CGBitmapContextCreate(picData, width, height, 8, 4*width, colorSpace, kCGImageAlphaPremultipliedLast);
    
    CGImageRef finalRef = CGBitmapContextCreateImage (final);
    
    UIImage* rawImage = [UIImage imageWithCGImage:finalRef];  
    
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(final); 
    free(picData);
    return rawImage;
}

@end

