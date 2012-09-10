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
#import <CoreText/CoreText.h>
#import "VerticallyAlignedLabel.h"
#import "AdjustableUILabel.h"
#import "TextImage.h"

@interface Filters ()
-(UIImage *)endPhoto:(UIImage *)image;
-(UIImage *)textShadow:(UILabel *)text;

-(UILabel *)ScrawlText:(NSString *)title;
-(UIImage *)YBTextGradient;
@property(strong,nonatomic) UIImage *YBTextGradient;

-(UILabel *)Str8upText:(NSString *)title;

-(UIImage *)changeWhiteColorTransparent:(UIImage *)image;
-(NSArray *)textDivider:(NSString *)text;
-(CGFloat)getFontSize:(NSString *)text forWidth:(NSInteger)width withMax:(CGFloat)maxSize Font:(UIFont *)font;

@end

@implementation Filters

@synthesize YBTextGradient = _YBTextGradient;
/* Color Dodges Changed to Normal
 Bitchin
*/
/*  QUESTIONS
Same gradient overlays on pictures
Banding from 3+ color gradients
PinSoftLight Blend Mode not supported
ThornRose not right because of fill on rainbow filter in original psd file
 
Rainbow requires angle gradient - fixed by adding image in library
 
    TO DO
fix the old CAGradientLayers
add textures with pinlight somehow
*/

int WIDTH = 320;
int HEIGHT = 480;

-(UIImage *)getImage:(UIImage *)image withFilter:(Filter)filter {
    switch (filter) {
        case Bacon:
            return [self Bacon:image];
            break;
        case Bitchin:
            return [self Bitchin:image];
            break;
        case Buhloo:
            return [self Buhloo:image];
            break;
        case Clean:
            return [self Clean:image];
            break;
        case CutUp:
            return [self CutUp:image];
            break;
        case Downer:
            return [self Downer:image];
            break;
        case DropLeft:
            return [self DropLeft:image];
            break;
        case DropRight:
            return [self DropRight:image];
            break;
        case Fluffy:
            return [self Fluffy:image];
            break;
        case JustRight:
            return [self JustRight:image];
            break;
        case Labels:
            return [self Labels:image];
            break;
        case LiteRite:
            return [self LiteRite:image];
            break;
        case Longwash:
            return [self Longwash:image];
            break;
        case PTA:
            return [self PTA:image];
            break;
        case Purplicious:
            return [self Purplicious:image];
            break;
        case Rainbow:
            return [self Rainbow:image];
            break;
        case Rugged:
            return [self Rugged:image];
            break;
        case Scrawl:
            return [self Scrawl:image];
            break;
        case Str8up:
            return [self Str8up:image];
            break;
        case WashedOut:
            return [self WashedOut:image];
            break;
        case YelloMello:
            return [self YelloMello:image];
            break;
    
        default:
            break;
    }
}

-(TextImageView *)getText:(NSString *)title forFilter:(Filter)filter End:(BOOL)end {
    switch (filter) {
        case Bacon:
            return [self BaconText:title End:end];
            break;
        case Bitchin:
            return [self BitchinText:title End:end];
            break;
        case Buhloo:
            return [self BuhlooText:title End:end];
            break;
        case Clean:
            return [self CleanText:title End:end];
            break;
        case CutUp:
            return [self CutUpText:title End:end];
            break;
        case Downer:
            return [self DownerText:title End:end];
            break;
        case DropLeft:
            return [self DropLeftText:title End:end];
            break;
        case DropRight:
            return [self DropRightText:title End:end];
            break;
        case Fluffy:
            return [self FluffyText:title End:end];
            break;
        case JustRight:
            return [self JustRightText:title End:end];
            break;
        case Labels:
            return [self LabelsText:title End:end];
            break;
        case LiteRite:
            return [self LiteRiteText:title End:end];
            break;
        case Longwash:
            return [self LongwashText:title End:end];
            break;
        case PTA:
            return [self PTAText:title End:end];
            break;
        case Purplicious:
            return [self PurpliciousText:title End:end];
            break;
        case Rainbow:
            return [self RainbowText:title End:end];
            break;
        case Rugged:
            return [self RuggedText:title End:end];
            break;
        case Scrawl:
            return [self ScrawlText:title end:end];
            break;
        case Str8up:
            return [self Str8upText:title End:end];
            break;
        case WashedOut:
            return [self WashedOutText:title End:end];
            break;
        case YelloMello:
            return [self YelloMelloText:title End:end];
            break;
        default:
            break;
    }
}

-(TextImageView *)getTopViews:(Filter)filter {
    switch (filter) {
        case Bacon:
            return nil;
            break;
        case Bitchin:
            return nil;
            break;
        case Buhloo:
            return nil;
            break;
        case Clean:
            return nil;
            break;
        case CutUp:
            return nil;
            break;
        case Downer:
            return nil;
            break;
        case DropLeft:
            return nil;
            break;
        case DropRight:
            return nil;
            break;
        case Fluffy:
            return nil;
            break;
        case JustRight:
            return nil;
            break;
        case Labels:
            return nil;
            break;
        case LiteRite:
            return nil;
            break;
        case Longwash:
            return [self LongwashTop];
            break;
        case PTA:
            return nil;
            break;
        case Purplicious:
            return nil;
            break;
        case Rainbow:
            return nil;
            break;
        case Rugged:
            return [self RuggedTop];
            break;
        case Scrawl:
            return nil;
            break;
        case Str8up:
            return nil;
            break;
        case WashedOut:
            return [self WashedOutTop];
            break;
        case YelloMello:
            return nil;
            break;
            
        default:
            break;
    }
}

-(UIImage *)endPhoto:(UIImage *)image {
    //GPUImageGaussianBlurFilter *filter = [[GPUImageGaussianBlurFilter alloc] init];
    //return [filter imageByFilteringImage:image];
}

-(UIImage *)Bacon:(UIImage *)image {    
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

    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSoftLight alpha:0.64];
    [texture drawInRect:CGRectMake(0, 0, WIDTH, HEIGHT) blendMode:kCGBlendModeHardLight alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)BaconText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *image;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"FINIS." SizeRules:None LineRules:OneLine Font:@"Baskerville-Bold" FontSize:50.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:NO Uppercase:YES Color:[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:239.0/255.0 alpha:1.0] LineHeight:0.7 Width:180.0];
        rect = CGRectMake((WIDTH-image.size.width)/2, 200, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:LargestWord LineRules:TextDivider Font:@"Baskerville-Bold" FontSize:300 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:239.0/255.0 alpha:1.0] LineHeight:0.7 Width:WIDTH-20];
        rect = CGRectMake((WIDTH-image.size.width)/2, 30, image.size.width, image.size.height);
    }
    TextImageView *view = [self NormalViewFactory:image];
    view.frame = rect;
    return view;
}

-(UIImage *)Bitchin:(UIImage *)image {
        
    /*shadow
     changed from color dodge to normal
    UIImage *shadowImage = [self textShadow:text];
    UIGraphicsBeginImageContext(shadowImage.size);
    CGContextRotateCTM (UIGraphicsGetCurrentContext(), 0.025);
    [shadowImage drawInRect:CGRectMake(0, 0, 320, 480)];
    shadowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
     */
        
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
    //[textImage drawInRect:CGRectMake(0, 50 + 160*(lastPicture), 320, 480) blendMode:kCGBlendModeNormal alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(TextImageView *)BitchinText:(NSString *)title End:(BOOL)lastPicture {
    TextImageView *view;
    CGRect rect;
    if(lastPicture) {
        view = [self ColorDodgeFactory:@"THE END" SizeRules:None LineRules:OneLine Font:@"Journal" FontSize:70.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:213.0/255.0 green:153.0/255.0 blue:125.0/255.0 alpha:1.0] LineHeight:0.7 Width:200.0 ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-view.frame.size.width)/2, 200, view.frame.size.width, view.frame.size.height);
    } else {
         view = [self ColorDodgeFactory:title SizeRules:LargestWord LineRules:TextDivider Font:@"Journal" FontSize:300 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:213.0/255.0 green:153.0/255.0 blue:125.0/255.0 alpha:1.0] LineHeight:0.7 Width:WIDTH-20 ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-view.frame.size.width)/2, 20, view.frame.size.width, view.frame.size.height);
    }
    view.frame = rect;
    return view;
    /*
    if(lastPicture) {
    } else {
    }
    
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"Journal" size:60];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    if(lastPicture) {
        [text setText:@"THE END"];
        text.textAlignment = UITextAlignmentCenter;
    } else {
        [text setText:upperTitle];
        text .textAlignment = UITextAlignmentLeft;
    }
    text.lineHeight = 60;
    [text setFont:font];
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
    text.verticalAlignment = VerticalAlignmentTop;
    text.textColor = [UIColor colorWithRed:213.0/255.0 green:153.0/255.0 blue:125.0/255.0 alpha:1.0];
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];
    
    return text;
     */
}

-(UIImage *)Buhloo:(UIImage *)image {
    //TextImageView *textImage = [self BuhlooText:title End:lastPicture];

    /* shadow
     changed from lighten to normal
    UIImage *shadowImage = [self textShadow:text];
    */

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
    [texture drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeLighten alpha:0.8];
    [texture drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeDarken alpha:0.8];
    //[textImage drawRect:CGRectMake(0, 0, textImage.frame.size.width, textImage.frame.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(TextImageView *)BuhlooText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *image;
    UIImage *shadow;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"THE END" SizeRules:None LineRules:OneLine Font:@"Minotaur" FontSize:60.0 Alignment:UITextAlignmentCenter Rotation:0.0262 SizeToFit:NO Uppercase:YES Color:[UIColor colorWithRed:125.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0] LineHeight:0.63 Width:250 ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:@"THE END" SizeRules:None LineRules:OneLine Font:@"Minotaur" FontSize:60.0 Alignment:UITextAlignmentCenter Rotation:0.0262 SizeToFit:NO Uppercase:YES Color:[UIColor colorWithRed:125.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0] LineHeight:0.63 Width:250 ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH - image.size.width)/2, 180, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:SizeToFit LineRules:TextDivider Font:@"Minotaur" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:125.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0] LineHeight:0.63 Width:WIDTH ShadowColor:[UIColor clearColor]];
        image = [self adjustHeight:image Change:25];
        shadow = [self seperateShadow:title SizeRules:SizeToFit LineRules:TextDivider Font:@"Minotaur" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:125.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0] LineHeight:0.63 Width:WIDTH ShadowColor:[UIColor blackColor]];
        shadow = [self adjustHeight:shadow Change:25];
        rect = CGRectMake((WIDTH - image.size.width)/2, 0, image.size.width, image.size.height);

    }
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [[self YBTextGradient] drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSourceAtop alpha:1.0];
    UIImage *cutOut = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [cutOut drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeMultiply alpha:0.3];
    UIImage *finalText = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    TextImage *shadowImage = [[TextImage alloc] initwithImage:shadow blendMode:kCGBlendModeNormal alpha:1.0];
    TextImage *textImage = [[TextImage alloc] initwithImage:finalText blendMode:kCGBlendModeLighten alpha:1.0];
    TextImageView *view = [[TextImageView alloc] initWithFrame:rect Images:[[NSArray alloc] initWithObjects:textImage,shadowImage, nil]];
    return view;
}

-(UIImage *)Clean:(UIImage *)image {
    //Assemble Image
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //[textImage drawInRect:CGRectMake(0, 50 + 180*lastPicture, 320, 480) blendMode:kCGBlendModeColorDodge alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(TextImageView *)CleanText:(NSString *)title End:(BOOL)lastPicture {
    CGRect rect;
    TextImageView *view;
    if(lastPicture) {
        view = [self ColorDodgeFactory:@"FINIS" SizeRules:None LineRules:OneLine Font:@"HelveticaNeue-Bold" FontSize:60.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:213.0/255.0 green:153.0/255.0 blue:125.0/255.0 alpha:1.0] LineHeight:0.75 Width:WIDTH-20 ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-view.frame.size.width)/2, 200, view.frame.size.width, view.frame.size.height);
    } else {
        view = [self ColorDodgeFactory:title SizeRules:LargestWord LineRules:TextDivider Font:@"HelveticaNeue-Bold" FontSize:300 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:213.0/255.0 green:153.0/255.0 blue:125.0/255.0 alpha:1.0] LineHeight:0.75 Width:WIDTH-20 ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-view.frame.size.width)/2, 30, view.frame.size.width, view.frame.size.height);
    }
    view.frame = rect;
    return view;
}

-(UIImage *)CutUp:(UIImage *)image {
    //text
    //UIImage *textImage = [self CutUpText:title End:lastPicture];
        
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
    //[textImage drawInRect:CGRectMake(10, 20, textImage.size.width, textImage.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
-(TextImageView *)CutUpText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *image;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"THE END" SizeRules:None LineRules:OneWord Font:@"BlackCasper" FontSize:70 Alignment:UITextAlignmentCenter Rotation:0.0262-0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:255.0/255.0 green:254.0/255.0 blue:254.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH-20 ShadowColor:[UIColor blackColor] ExtraMargins:20.0];
        rect = CGRectMake((WIDTH-image.size.width)/2, 180, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:LargestWord LineRules:TextDivider Font:@"BlackCasper" FontSize:300 Alignment:UITextAlignmentCenter Rotation:0.0262-0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:255.0/255.0 green:254.0/255.0 blue:254.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH-20 ShadowColor:[UIColor blackColor] ExtraMargins:20.0];
        rect = CGRectMake((WIDTH-image.size.width)/2, 30, image.size.width, image.size.height);
    }
    TextImageView *view = [self NormalViewFactory:image];
    view.frame = rect;
    return view;
}


-(UIImage *)Downer:(UIImage *)image {
    //UIImage *textImage = [self DownerText:title End:lastPicture];
    
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
    //[textImage drawInRect:CGRectMake(0, 50 + 160*lastPicture, 320, 480)];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeHardLight alpha:0.4];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)DownerText:(NSString *)title End:(BOOL)lastPicture{
    UIImage *image;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"THE END." SizeRules:None LineRules:OneLine Font:@"FuturaBT-Bold" FontSize:60.0 Alignment:UITextAlignmentCenter Rotation:-0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:239.0/255.0 alpha:1.0] LineHeight:0.78 Width:WIDTH];
        rect = CGRectMake((WIDTH-image.size.width)/2, 200, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:None LineRules:OneWord Font:@"FuturaBT-Bold" FontSize:55.0 Alignment:UITextAlignmentLeft Rotation:-0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:239.0/255.0 alpha:1.0] LineHeight:0.78 Width:WIDTH];
        rect = CGRectMake((WIDTH-image.size.width)/2, 20, image.size.width, image.size.height);
    }
    TextImageView *view = [self NormalViewFactory:image];
    view.frame = rect;
    return view;
    /*
    NSString *upperTitle = [title uppercaseString];
    UIFont *font = [UIFont fontWithName:@"Futura-Bold" size:50];
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
    [[text layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];   

    return text;
     */
}

-(UIImage *)DropLeft:(UIImage *)image {    
    /*
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
    [[text layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[text layer] setShadowRadius:2.0];
    [[text layer] setShadowOpacity:1.0]; 
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    */
    
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
    //[textImage drawInRect:CGRectMake(5, 240, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)DropLeftText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *text;
    if(lastPicture) {
        text = [self TextMaker:@"THE END" SizeRules:LargestWord LineRules:OneWord Font:@"GillSans-Bold" FontSize:22 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.77 Width:100 ShadowColor:[UIColor clearColor]];
    } else {
        text = [self TextMaker:title SizeRules:LargestWord LineRules:OneWord Font:@"GillSans-Bold" FontSize:22 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.77 Width:100 ShadowColor:[UIColor clearColor]];
    }
    UIGraphicsBeginImageContext(CGSizeMake(115, 270));
    [[UIImage imageNamed:@"Texture_2"] drawInRect:CGRectMake(0, 0, 320, 480)];
    [text drawInRect:CGRectMake(0, 270-text.size.height + 120, text.size.width, text.size.height)];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    TextImage *image = [[TextImage alloc] initwithImage:finalImage blendMode:kCGBlendModeNormal alpha:1.0];
    return [[TextImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 240) Image:image];
}

-(UIImage *)DropRight:(UIImage *)image {
    /*
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
    [[text layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[text layer] setShadowRadius:2.0];
    [[text layer] setShadowOpacity:1.0]; 
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    */
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
    //[textImage drawInRect:CGRectMake(215, 150, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)DropRightText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *text;
    if(lastPicture) {
        text = [self TextMaker:@"THE END" SizeRules:LargestWord LineRules:OneWord Font:@"GillSans-Bold" FontSize:22 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.77 Width:100 ShadowColor:[UIColor clearColor]];
    } else {
        text = [self TextMaker:title SizeRules:LargestWord LineRules:OneWord Font:@"GillSans-Bold" FontSize:22 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.77 Width:100 ShadowColor:[UIColor clearColor]];
    }
    UIGraphicsBeginImageContext(CGSizeMake(110, 190));
    [[UIImage imageNamed:@"Texture_2"] drawInRect:CGRectMake(0, 0, 320, 480)];
    [text drawInRect:CGRectMake(0, 190-text.size.height + 120, text.size.width, text.size.height)];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    TextImage *image = [[TextImage alloc] initwithImage:finalImage blendMode:kCGBlendModeNormal alpha:1.0];
    return [[TextImageView alloc] initWithFrame:CGRectMake(210, 0, 100, 120) Image:image];

}

-(UIImage *)Fluffy:(UIImage *)image {
    /*
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
     */
    
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
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


-(TextImageView *)FluffyText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *gradient = [self YBTextGradient];
    UIGraphicsBeginImageContext(gradient.size);
    struct CGContext *currentContext = UIGraphicsGetCurrentContext();
    CGRect fillRect = CGRectMake(0,0,gradient.size.width,gradient.size.height);
    CGContextSetFillColorWithColor(currentContext, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(currentContext, fillRect);
    [gradient drawInRect:CGRectMake(0, 0, gradient.size.width, gradient.size.height) blendMode:kCGBlendModeNormal alpha:0.3];
    UIImage *textColor = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage *image;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"END." SizeRules:None LineRules:OneLine Font:@"Molot" FontSize:70.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithPatternImage:textColor] LineHeight:0.65 Width:WIDTH];
        rect = CGRectMake((WIDTH-image.size.width)/2, 180, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:SizeToFit LineRules:TextDivider Font:@"Molot" FontSize:300.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithPatternImage:textColor] LineHeight:0.65 Width:WIDTH];
        image = [self adjustHeight:image Change:-38];
        rect = CGRectMake((WIDTH-image.size.width)/2, 0, image.size.width, image.size.height);
    }
    TextImageView *view = [self NormalViewFactory:image];
    view.frame = rect;
    return view;
    
    /*
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
    [[text layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];   
    
    text.textColor = [UIColor colorWithPatternImage:self.YBTextGradient];
    
    return text;
     */
}

-(UIImage *)JustRight:(UIImage *)image {
    /*
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
    */
        
    //UIImage *textImage = [self JustRightText:title End:lastPicture];
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
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeLighten alpha:0.8];
    [texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeDarken alpha:0.8];
    //[textImage drawInRect:CGRectMake(0, 0, textImage.size.width, textImage.size.height) blendMode:kCGBlendModeColorDodge alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)JustRightText:(NSString *)title End:(BOOL)lastPicture {
    TextImageView *view;
    CGRect rect;
    if(lastPicture) {
        view = [self ColorDodgeFactory:@"THE END." SizeRules:None LineRules:OneLine Font:@"GillSans-Bold" FontSize:45.0 Alignment:UITextAlignmentLeft Rotation:0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:231.0/255.0 green:194.0/255.0 blue:82.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH-50 ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-view.frame.size.width)/2, 380, view.frame.size.width, view.frame.size.height);
    } else {
        view = [self ColorDodgeFactory:title SizeRules:LargestWord LineRules:OneWord Font:@"GillSans-Bold" FontSize:50.0 Alignment:UITextAlignmentRight Rotation:0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:231.0/255.0 green:194.0/255.0 blue:82.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-view.frame.size.width)/2, 20, view.frame.size.width, view.frame.size.height);
    }
    view.frame = rect;
    return view;
}
-(UIImage *)Knockout:(UIImage *)image {    
    /*
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
    */
    
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
    //[textImage drawInRect:CGRectMake(0, 50 + 160*lastPicture, 320, 480) blendMode:kCGBlendModeColorDodge alpha:1.0];
    //[shadowImage drawInRect:CGRectMake(0, 50 + 160*lastPicture, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)KnockoutText:(NSString *)title End:(BOOL)lastPicture {
    if(lastPicture) {
        return [self ColorDodgeFactory:@"PEACE OUT ;)" SizeRules:None LineRules:OneLine Font:@"Irving-KOBold" FontSize:50.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:213.0/255.0 green:153.0/255.0 blue:125.0/255.0 alpha:1.0] LineHeight:0.78 Width:WIDTH ShadowColor:[UIColor blackColor]];
    } else {
        return [self ColorDodgeFactory:title SizeRules:LargestWord LineRules:TextDivider Font:@"Irving-KOBold" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:213.0/255.0 green:153.0/255.0 blue:125.0/255.0 alpha:1.0] LineHeight:0.78 Width:WIDTH ShadowColor:[UIColor blackColor]];
    }
}

-(UIImage *)Labels:(UIImage *)image {
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
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)LabelsText:(NSString *)title End:(BOOL)lastPicture {
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
    
    UIImage *image;
    UIImage *shadow;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"FINIS." SizeRules:None LineRules:OneLine Font:@"ImpactLabel" FontSize:60.0 Alignment:UITextAlignmentCenter Rotation:0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithPatternImage:gradient] LineHeight:0.9 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:@"FINIS." SizeRules:None LineRules:OneLine Font:@"ImpactLabel" FontSize:60.0 Alignment:UITextAlignmentCenter Rotation:0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithPatternImage:gradient] LineHeight:0.9 Width:WIDTH ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 200, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:LargestWord LineRules:TextDivider Font:@"ImpactLabel" FontSize:300.0 Alignment:UITextAlignmentCenter Rotation:0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithPatternImage:gradient] LineHeight:0.9 Width:WIDTH-40 ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:title SizeRules:LargestWord LineRules:TextDivider Font:@"ImpactLabel" FontSize:300.0 Alignment:UITextAlignmentCenter Rotation:0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithPatternImage:gradient] LineHeight:0.9 Width:WIDTH-40 ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 30, image.size.width, image.size.height);
    }
    TextImage *shadowImage = [[TextImage alloc] initwithImage:shadow blendMode:kCGBlendModeNormal alpha:1.0];
    TextImage *textImage = [[TextImage alloc] initwithImage:image blendMode:kCGBlendModeNormal alpha:1.0];
    TextImageView *view = [[TextImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height) Images:[[NSArray alloc] initWithObjects:shadowImage, textImage, nil]];
    view.frame = rect;
    return view;
}

-(UIImage *)LiteRite:(UIImage *)image {
    /*
    //text
    UIImage *textImage;
    UIImage *shadowImage;
    
    if(lastPicture) {
        VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        UIFont *font = [UIFont fontWithName:@"GillSans-Light" size:50];
        [text setFont:font];
        [text setText:@" THE            END"];
        text.numberOfLines = 2;
        text.lineHeight = 40;
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
            UIFont *font = [UIFont fontWithName:@"GillSans-Light" size:40];
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
        CGContextRotateCTM (UIGraphicsGetCurrentContext(), 0.025);
        int line = 0;
        for(UIImage *word in wordImages) {
            [word drawInRect:CGRectMake(0, 50 + line*30, 320, 480)];
            ++line;
        }
        textImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        UIGraphicsBeginImageContext(image.size);
        CGContextRotateCTM (UIGraphicsGetCurrentContext(), 0.025);
        int shadowLine = 0;
        for(UIImage *word in wordImages) {
            UIImage *shadowWord = [self textShadow:word];
            [shadowWord drawInRect:CGRectMake(0, 50 + shadowLine*30, 320, 480)];
            ++line;
        }
        shadowImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    */
    
    //filter
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
    //[textImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeColorDodge alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;

}

-(TextImageView *)LiteRiteText:(NSString *)title End:(BOOL)lastPicture {
    if(lastPicture) {
        TextImageView *view = [self ColorDodgeFactory:@"THE END" SizeRules:None LineRules:OneWord Font:@"GillSans-Light" FontSize:47.0 Alignment:UITextAlignmentCenter Rotation:0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:231.0/255.0 green:194.0/255.0 blue:82.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor blackColor]];
        view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y + 180, view.frame.size.width, view.frame.size.height);
        return view;
    } else {
        TextImageView *view = [self ColorDodgeFactory:title SizeRules:LargestWord LineRules:OneWord Font:@"GillSans-Light" FontSize:47.0 Alignment:UITextAlignmentRight Rotation:0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:231.0/255.0 green:194.0/255.0 blue:82.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor blackColor]];
        view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y + 25, view.frame.size.width, view.frame.size.height);
        return view;
    }
}

-(UIImage *)Longwash:(UIImage *)image {
    /*
    //text
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 250)];
    if(lastPicture) {
        [text setText:@"FINIS."];
        UIFont *font = [UIFont fontWithName:@"Futura-CondensedMedium" size:60];
        [text setFont:font];
    } else {
        UIFont *font = [UIFont fontWithName:@"Futura-CondensedMedium" size:300];
        NSString *upperTitle = [title uppercaseString];
        [text setText:upperTitle];
        [text setFont:font];
    }
    text.numberOfLines = 1;
    text.adjustsFontSizeToFitWidth = YES;
    text.backgroundColor = [UIColor clearColor];
    text.textAlignment = UITextAlignmentCenter;
    
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[text layer] setShadowRadius:3.0];
    [[text layer] setShadowOpacity:1.0];
     */
    //Texture
    //UIImage *texture = [UIImage imageNamed:@"Texture_2"];

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
    
    /*
    text.textColor = [UIColor colorWithPatternImage:textGradient];
    
    UIGraphicsBeginImageContext(image.size);
    CGContextRotateCTM (UIGraphicsGetCurrentContext(), -0.025);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    */ 
     
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [rainbowImage drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeColor alpha:0.5];
    /*
    if(!lastPicture) {
        [mask drawInRect:CGRectMake(0, 50, 320, 480)];
        [textImage drawInRect:CGRectMake(0, -115, 320, 480) blendMode:kCGBlendModeDarken alpha:1.0];
    } else {
        [textImage drawInRect:CGRectMake(0, 120, 320, 480) blendMode:kCGBlendModeNormal alpha:1.0];
    }
     */
    //[texture drawInRect:CGRectMake(0, 0, 320, 480) blendMode:kCGBlendModeScreen alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;    
}

-(TextImageView *)LongwashText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *image;
    UIImage *shadow;
    CGRect rect;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if(lastPicture) {
        image = [self TextMaker:@"FINIS." SizeRules:None LineRules:OneLine Font:@"Futura-CondensedMedium" FontSize:67.5 Alignment:UITextAlignmentCenter Rotation:-0.0262 SizeToFit:NO Uppercase:YES Color:[UIColor colorWithRed:45.0/255.0 green:50.0/255.0 blue:53.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:@"FINIS." SizeRules:None LineRules:OneLine Font:@"Futura-CondensedMedium" FontSize:67.5 Alignment:UITextAlignmentCenter Rotation:-0.0262 SizeToFit:NO Uppercase:YES Color:[UIColor colorWithRed:45.0/255.0 green:50.0/255.0 blue:53.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor whiteColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 190, image.size.width, image.size.height);
    } else {
        int heightChange = 45;
        
        if([[self backplateDivider:title Font:[UIFont fontWithName:@"Futura-CondensedMedium" size:100.0]] count] == 1) {
            heightChange += -10;
        }
        image = [self TextMaker:title SizeRules:BackplateSizer LineRules:BackplateLiner Font:@"Futura-CondensedMedium" FontSize:100.0 Alignment:UITextAlignmentLeft Rotation:-0.03 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:45.0/255.0 green:50.0/255.0 blue:53.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor clearColor]];
        image = [self adjustHeight:image Change:heightChange];
        shadow = [self seperateShadow:title SizeRules:BackplateSizer LineRules:BackplateLiner Font:@"Futura-CondensedMedium" FontSize:100.0 Alignment:UITextAlignmentLeft Rotation:-0.03 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:45.0/255.0 green:50.0/255.0 blue:53.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor whiteColor]];
        shadow = [self adjustHeight:shadow Change:heightChange];
        rect = CGRectMake(0, 0, WIDTH, image.size.height);
        
        UIGraphicsBeginImageContext(CGSizeMake(320, 480));
        [[UIImage imageNamed:@"Longwash_Mask"] drawInRect:CGRectMake(0, 56, 320, 480)];
        UIImage *smallerMask = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        TextImage *mask = [[TextImage alloc] initwithImage:smallerMask blendMode:kCGBlendModeNormal alpha:1.0];
        [array addObject:mask];
    }
    
    //gradient
    CGFloat rainbowComponents[8] = { 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(0.0, image.size.height);
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width, image.size.height));
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsBeforeStartLocation);
    UIImage *gradient = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradient drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSourceIn alpha:1.0];
    UIImage *next = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [next drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeOverlay alpha:1.0];
    UIImage *final = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    TextImage *text = [[TextImage alloc] initwithImage:final blendMode:kCGBlendModeDarken alpha:1.0];
    TextImage *shadowImage = [[TextImage alloc] initwithImage:shadow blendMode:kCGBlendModeNormal alpha:1.0];
    [array addObject:text];
    [array addObject:shadowImage];
    TextImageView *view = [[TextImageView alloc] initWithFrame:rect Images:array];
    return view;
}

-(TextImageView *)LongwashTop {
    TextImage *texture = [[TextImage alloc] initwithImage:[UIImage imageNamed:@"Texture_2"] blendMode:kCGBlendModeScreen alpha:1.0];
    return [[TextImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) Image:texture];
}

-(UIImage *)PTA:(UIImage *)image {
    //Diamond Gradient
    UIImage *gradient = [UIImage imageNamed:@"PTA_Gradient"];
        
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradient drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeLighten alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;  
}

-(TextImageView *)PTAText:(NSString *)title End:(BOOL)lastPicture {    
    UIImage *image;
    UIImage *shadow;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"THE END" SizeRules:None LineRules:OneLine Font:@"MyriadPro-BoldCond" FontSize:100.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.70 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:@"THE END" SizeRules:None LineRules:OneLine Font:@"MyriadPro-BoldCond" FontSize:100.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.70 Width:WIDTH ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 180, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:LargestWord LineRules:SizeToFit Font:@"MyriadPro-BoldCond" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.70 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:title SizeRules:LargestWord LineRules:SizeToFit Font:@"MyriadPro-BoldCond" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.70 Width:WIDTH ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 20, image.size.width, image.size.height);
    }

    UIImage *gradient = [self YBTextGradient];
    UIGraphicsBeginImageContext(gradient.size);
    struct CGContext *currentContext = UIGraphicsGetCurrentContext();
    CGRect fillRect = CGRectMake(0,0,gradient.size.width,gradient.size.height);
    CGContextSetFillColorWithColor(currentContext, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(currentContext, fillRect);
    [gradient drawInRect:CGRectMake(0, 0, gradient.size.width, gradient.size.height) blendMode:kCGBlendModeNormal alpha:0.3];
    UIImage *textColor = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [textColor drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSourceIn alpha:1.0];
    [shadow drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    UIImage *text = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    TextImageView *view = [self NormalViewFactory:text];
    view.frame = rect;
    return view;
}

-(UIImage *)Purplicious:(UIImage *)image {
    /*
    //text
    NSString *upperTitle = [title uppercaseString];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
    UIFont *font = [UIFont fontWithName:@"Journal" size:100];
    [text setFont:font];
    if(lastPicture) {
        [text setText:@"the end."];
    } else {
        [text setText:upperTitle];
    }
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
    [[text layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];
    
    UIGraphicsBeginImageContext(image.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *textImage2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    */
    //UIImage *textImage = [self PurpliciousText:title End:lastPicture];
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
    //[textImage2 drawInRect:CGRectMake(0, 50 + 140*lastPicture, 320, 480)];
    //[textImage drawInRect:CGRectMake(0, 0, textImage.size.width, textImage.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;  
}
-(TextImageView *)PurpliciousText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *image;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"the end" SizeRules:None LineRules:OneLine Font:@"Journal" FontSize:100.0 Alignment:UITextAlignmentCenter Rotation:-0.0262 SizeToFit:YES Uppercase:NO Color:[UIColor whiteColor] LineHeight:0.7 Width:WIDTH];
        rect = CGRectMake((WIDTH-image.size.width)/2, 150, image.size.width, image.size.height);
        
    } else {
        image = [self TextMaker:title SizeRules:SizeToFit LineRules:TextDivider Font:@"Journal" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:-0.0262 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.7 Width:WIDTH-20];
        image = [self adjustHeight:image Change:-50];
        rect = CGRectMake((WIDTH-image.size.width)/2, 10, image.size.width, image.size.height);
    }
    TextImageView *view = [self NormalViewFactory:image];
    view.frame = rect;
    return view;
    
}

-(UIImage *)Rainbow:(UIImage *)image {
    /*
    //text
    NSString *upperTitle = [title uppercaseString];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    if(lastPicture) {
        [text setText:@"THE             END"];
        text.textAlignment = UITextAlignmentCenter;
        UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:70];
        [text setFont:font];
        text.lineHeight = 52;

    } else {
        [text setText:upperTitle];
        text.textAlignment = UITextAlignmentLeft;
        UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:50];
        [text setFont:font];
        text.lineHeight = 40;
    }
    text.numberOfLines = 0;
    text.backgroundColor = [UIColor clearColor];
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
    */
    //UIImage *textImage = [self RainbowText:title End:lastPicture];
    UIImage *gradient = [UIImage imageNamed:@"Rainbow_Gradient"];
 
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradient drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeLighten alpha:1.0];
    //[textImage drawInRect:CGRectMake(0,  0, textImage.size.width, textImage.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)RainbowText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *image;
    UIImage *shadow;
    CGRect rect;
    if(lastPicture ) {
        image = [self TextMaker:@"THE END" SizeRules:None LineRules:OneWord Font:@"HelveticaNeue-CondensedBlack" FontSize:70.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:62.0/255.0 green:42.0/255.0 blue:79.0/255.0 alpha:1.0] LineHeight:0.75 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:@"THE END" SizeRules:None LineRules:OneWord Font:@"HelveticaNeue-CondensedBlack" FontSize:70.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:62.0/255.0 green:42.0/255.0 blue:79.0/255.0 alpha:1.0] LineHeight:0.75 Width:WIDTH ShadowColor:[UIColor whiteColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 160, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:LargestWord LineRules:TextDivider Font:@"HelveticaNeue-CondensedBlack" FontSize:100.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:62.0/255.0 green:42.0/255.0 blue:79.0/255.0 alpha:1.0] LineHeight:0.75 Width:WIDTH-20 ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:title SizeRules:LargestWord LineRules:TextDivider Font:@"HelveticaNeue-CondensedBlack" FontSize:100.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:62.0/255.0 green:42.0/255.0 blue:79.0/255.0 alpha:1.0] LineHeight:0.75 Width:WIDTH-20 ShadowColor:[UIColor whiteColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 20, image.size.width, image.size.height);
    }
    //gradient
    CGFloat rainbowComponents[8] = { 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(0.0, image.size.height);
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width, image.size.height));
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsBeforeStartLocation);
    UIImage *gradient = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradient drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSourceIn alpha:1.0];
    UIImage *next = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [next drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeOverlay alpha:1.0];
    UIImage *final = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    TextImage *textImage = [[TextImage alloc] initwithImage:final blendMode:kCGBlendModeMultiply alpha:1.0];
    TextImage *shadowImage = [[TextImage alloc] initwithImage:shadow blendMode:kCGBlendModeNormal alpha:1.0];
    TextImageView *view = [[TextImageView alloc] initWithFrame:rect Images:[[NSArray alloc] initWithObjects:shadowImage,textImage, nil]];
    view.frame = rect;
    return view;

}

-(UIImage *)Rugged:(UIImage *)image {
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)RuggedText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *image;
    UIImage *shadow;
    CGRect rect;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if(lastPicture) {
        image = [self TextMaker:@"the end" SizeRules:None LineRules:OneLine Font:@"Baskerville-Bold" FontSize:67.5 Alignment:UITextAlignmentCenter Rotation:-0.0262 SizeToFit:NO Uppercase:NO Color:[UIColor colorWithRed:114.0/255.0 green:111.0/255.0 blue:105.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:@"the end" SizeRules:None LineRules:OneLine Font:@"Baskerville-Bold" FontSize:67.5 Alignment:UITextAlignmentCenter Rotation:-0.0262 SizeToFit:NO Uppercase:NO Color:[UIColor colorWithRed:114.0/255.0 green:111.0/255.0 blue:105.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 180, image.size.width, image.size.height);
    } else {
        int heightChange = 45;
        
        if([[self backplateDivider:title Font:[UIFont fontWithName:@"Baskerville-Bold" size:100.0]] count] == 1) {
            heightChange += -10;
        }
        image = [self TextMaker:title SizeRules:BackplateSizer LineRules:BackplateLiner Font:@"Baskerville-Bold" FontSize:100.0 Alignment:UITextAlignmentLeft Rotation:-0.03 SizeToFit:YES Uppercase:NO Color:[UIColor colorWithRed:114.0/255.0 green:111.0/255.0 blue:105.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor clearColor]];
        image = [self adjustHeight:image Change:heightChange];
        shadow = [self seperateShadow:title SizeRules:BackplateSizer LineRules:BackplateLiner Font:@"Baskerville-Bold" FontSize:100.0 Alignment:UITextAlignmentLeft Rotation:-0.03 SizeToFit:YES Uppercase:NO Color:[UIColor colorWithRed:114.0/255.0 green:111.0/255.0 blue:105.0/255.0 alpha:1.0] LineHeight:0.8 Width:WIDTH ShadowColor:[UIColor blackColor]];
        shadow = [self adjustHeight:shadow Change:heightChange];
        rect = CGRectMake(0, 0, WIDTH, image.size.height);
        
        UIGraphicsBeginImageContext(CGSizeMake(320, 480));
        [[UIImage imageNamed:@"Rugged_Mask"] drawInRect:CGRectMake(0, 56, 320, 480)];
        UIImage *smallerMask = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        TextImage *mask = [[TextImage alloc] initwithImage:smallerMask blendMode:kCGBlendModeNormal alpha:1.0];
        [array addObject:mask];
    }
    
    TextImage *text = [[TextImage alloc] initwithImage:image blendMode:kCGBlendModeColorBurn alpha:1.0];
    TextImage *shadowImage = [[TextImage alloc] initwithImage:shadow blendMode:kCGBlendModeNormal alpha:1.0];
    [array addObject:text];
    [array addObject:shadowImage];
    TextImageView *view = [[TextImageView alloc] initWithFrame:rect Images:array];
    return view;
}

-(TextImageView *)RuggedTop {
    //Texture
    UIImage *texture = [UIImage imageNamed:@"Texture_3"];
    
    //filter
    CGFloat rainbowComponents[8] = {20.0/255.0,237.0/255.0,183.0/255.0,1.0,
        250.0/255.0,56.0/255.0,4.0/255.0,1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(100, 0.0);
    CGPoint end = CGPointMake(0.0, 480.0);
    
    UIGraphicsBeginImageContext(CGSizeMake(WIDTH, HEIGHT));
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *rainbowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    TextImage *textureImage = [[TextImage alloc] initwithImage:texture blendMode:kCGBlendModeSoftLight alpha:1.0];
    TextImage *gradientImage = [[TextImage alloc] initwithImage:rainbowImage blendMode:kCGBlendModeSoftLight alpha:1.0];
    TextImageView *view = [[TextImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) Images:[[NSArray alloc] initWithObjects:textureImage,gradientImage, nil]];
    return view;
}

-(UIImage *)Scrawl:(UIImage *)image {
        
    //UIImage *textImage = [self ScrawlText:title end:lastPicture];
    
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
    //[textImage drawInRect:CGRectMake(0, 0, textImage.size.width, textImage.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    //[textImage drawInRect:CGRectMake(0, 50 + 160*lastPicture, 320, 480) blendMode:kCGBlendModeNormal alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;    
}

-(TextImageView *)ScrawlText:(NSString *)title end:(BOOL)lastPicture {
    UIImage *image;
    UIImage *shadow;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"finis" SizeRules:None LineRules:OneLine Font:@"GoodDog" FontSize:90.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:227 green:213 blue:233 alpha:1.0] LineHeight:0.65 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:@"finis" SizeRules:None LineRules:OneLine Font:@"GoodDog" FontSize:90.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:227 green:213 blue:233 alpha:1.0] LineHeight:0.65 Width:WIDTH ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 180, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:LargestWord LineRules:SizeToFit Font:@"GoodDog" FontSize:300.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:227.0/255.0 green:213.0/255.0 blue:233.0/255.0 alpha:1.0] LineHeight:0.65 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:title SizeRules:LargestWord LineRules:SizeToFit Font:@"GoodDog" FontSize:300.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:227.0/255.0 green:213.0/255.0 blue:233.0/255.0 alpha:1.0] LineHeight:0.65 Width:WIDTH ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 20, image.size.width, image.size.height);
    }
    
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
    
    CGPoint end = CGPointMake(0.0, image.size.height);
    CGPoint start = CGPointMake(0.0, 0.0);
    
    UIGraphicsBeginImageContext(image.size);
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsAfterEndLocation);
    UIImage *gradient = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradient drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSourceAtop alpha:0.3];
    UIImage *final = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    TextImage *textImage = [[TextImage alloc] initwithImage:final blendMode:kCGBlendModeHardLight alpha:1.0];
    TextImage *shadowImage = [[TextImage alloc] initwithImage:shadow blendMode:kCGBlendModeNormal alpha:1.0];
    TextImageView *view = [[TextImageView alloc] initWithFrame:rect Images:[[NSArray alloc] initWithObjects:textImage,shadowImage, nil]];
    return view;
    
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
        
        CGPoint start = CGPointMake(0.0, 0.0);
        CGPoint end = CGPointMake(0.0, 100.0);
        
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

-(UIImage *)Str8up:(UIImage *)image {
    //UIImage *textImage = [self Str8upText:title End:lastPicture];
    
    //Assemble
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //[textImage drawInRect:CGRectMake(0, 0, textImage.size.width, textImage.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)Str8upText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *image;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"THE END" SizeRules:None LineRules:OneWord Font:@"BebasNeue" FontSize:100.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.75 Width:WIDTH-100];
        rect = CGRectMake((WIDTH-image.size.width)/2, 120, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:LargestWord LineRules:SizeToFit Font:@"BebasNeue" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor whiteColor] LineHeight:0.75 Width:WIDTH-10];
        rect = CGRectMake((WIDTH-image.size.width)/2, 0, image.size.width, image.size.height);
    }
    TextImageView *view = [self NormalViewFactory:image];
    view.frame = rect;
    return view;
}

-(UIImage *)ThornRose:(UIImage *)image {
    //UIImage *textImage = [self ThornRoseText:title End:lastPicture];
    
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
    //[textImage drawInRect:CGRectMake(0, 0, textImage.size.width, textImage.size.height) blendMode:kCGBlendModeNormal alpha:0.5];
    //[textImage drawInRect:CGRectMake(0, 0, textImage.size.width, textImage.size.height) blendMode:kCGBlendModeColorDodge alpha:1.0];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;

}

-(UIImage *)ThornRoseText:(NSString *)title End:(BOOL)lastPicture {
    if(lastPicture) {
        return [self TextMaker:@"FINIS" SizeRules:None LineRules:OneLine Font:@"comesinhandy" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:199.0/255.0 green:32.0/255.0 blue:193.0/255.0 alpha:1.0] LineHeight:0.6 Width:WIDTH];
    } else {
        return [self TextMaker:title SizeRules:LargestWord LineRules:SizeToFit Font:@"comesinhandy" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:199.0/255.0 green:32.0/255.0 blue:193.0/255.0 alpha:1.0] LineHeight:0.6 Width:WIDTH];
    }
}

-(UIImage *)WashedOut:(UIImage *)image {
    //TextImageView *textImage = [self WashedOutText:title End:lastPicture];
    
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
    //[textImage drawRect:CGRectMake(0, 0, textImage.frame.size.width, textImage.frame.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)WashedOutText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *image;
    UIImage *shadow;
    CGRect rect;
    if(lastPicture) {
        image = [self TextMaker:@"THE END" SizeRules:None LineRules:OneWord Font:@"HelveticaNeue-CondensedBlack" FontSize:80.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:62.0/255.0 green:42.0/255.0 blue:79.0/255.0 alpha:1.0] LineHeight:0.75 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:@"THE END" SizeRules:None LineRules:OneWord Font:@"HelveticaNeue-CondensedBlack" FontSize:80.0 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:62.0/255.0 green:42.0/255.0 blue:79.0/255.0 alpha:1.0] LineHeight:0.75 Width:WIDTH ShadowColor:[UIColor whiteColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 140, image.size.width, image.size.height);
    } else {
        image = [self TextMaker:title SizeRules:LargestWord LineRules:TextDivider Font:@"HelveticaNeue-CondensedBlack" FontSize:100.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:62.0/255.0 green:42.0/255.0 blue:79.0/255.0 alpha:1.0] LineHeight:0.75 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:title SizeRules:LargestWord LineRules:TextDivider Font:@"HelveticaNeue-CondensedBlack" FontSize:100.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:62.0/255.0 green:42.0/255.0 blue:79.0/255.0 alpha:1.0]LineHeight:0.75 Width:WIDTH ShadowColor:[UIColor whiteColor]];
        rect = CGRectMake((WIDTH-image.size.width)/2, 10, image.size.width, image.size.height);
    }
    
    //gradient
    CGFloat rainbowComponents[8] = { 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 1.0 };
    size_t rainbowNumLocations = 2;
    CGFloat rainbowLocations[2] = {0.0, 1.0 };
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    
    CGGradientRef rainbow = CGGradientCreateWithColorComponents(rgb, rainbowComponents, rainbowLocations, rainbowNumLocations);
    
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(0.0, image.size.height);
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width, image.size.height));
    CGContextDrawLinearGradient(UIGraphicsGetCurrentContext(), rainbow, start, end, kCGGradientDrawsBeforeStartLocation);
    UIImage *gradient = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [gradient drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeSourceIn alpha:1.0];
    UIImage *next = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [next drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) blendMode:kCGBlendModeOverlay alpha:1.0];
    UIImage *final = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    TextImage *shadowView = [[TextImage alloc] initwithImage:shadow blendMode:kCGBlendModeNormal alpha:1.0];
    TextImage *gradientView = [[TextImage alloc] initwithImage:final blendMode:kCGBlendModeDarken alpha:1.0];
    TextImageView *view = [[TextImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height) Images:[[NSArray alloc] initWithObjects:shadowView, gradientView, nil]];
    view.frame = rect;
    return view;
}

-(TextImageView *)WashedOutTop {
    TextImage *texture = [[TextImage alloc] initwithImage:[UIImage imageNamed:@"Texture_2"] blendMode:kCGBlendModeScreen alpha:1.0];
    return [[TextImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) Image:texture];
}

-(UIImage *)YelloMello:(UIImage *)image {
    /*
    //Text
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:60];
    VerticallyAlignedLabel *text = [[VerticallyAlignedLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [text setFont:font];
    if(lastPicture) {
        [text setText:@"THE END"];
    } else {
        [text setText:title];
    }
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
    */
    
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
    //[textImage drawInRect:CGRectMake(0, 50 + 160*lastPicture, 320, 480) blendMode:kCGBlendModeLighten alpha:1.0];
    //[shadowImage drawInRect:CGRectMake(0, 0, 320, 150)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(TextImageView *)YelloMelloText:(NSString *)title End:(BOOL)lastPicture {
    UIImage *text;
    UIImage *shadow;
    CGRect rect;
    if(lastPicture) {
        text = [self TextMaker:@"THE END" SizeRules:None LineRules:OneLine Font:@"HelveticaNeue-Bold" FontSize:52.5 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:216.0/255.0 green:181.0/255.0 blue:39.0/255.0 alpha:1.0 ] LineHeight:0.75 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:@"THE END" SizeRules:None LineRules:OneLine Font:@"HelveticaNeue-Bold" FontSize:52.5 Alignment:UITextAlignmentCenter Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:216.0/255.0 green:181.0/255.0 blue:39.0/255.0 alpha:1.0 ] LineHeight:0.75 Width:WIDTH ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-text.size.width)/2, 200, text.size.width, text.size.height);
    } else {
        text = [self TextMaker:title SizeRules:LargestWord LineRules:SizeToFit Font:@"HelveticaNeue-Bold" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:216.0/255.0 green:181.0/255.0 blue:39.0/255.0 alpha:1.0 ] LineHeight:0.75 Width:WIDTH ShadowColor:[UIColor clearColor]];
        shadow = [self seperateShadow:title SizeRules:LargestWord LineRules:SizeToFit Font:@"HelveticaNeue-Bold" FontSize:300.0 Alignment:UITextAlignmentLeft Rotation:0.0 SizeToFit:YES Uppercase:YES Color:[UIColor colorWithRed:216.0/255.0 green:181.0/255.0 blue:39.0/255.0 alpha:1.0 ] LineHeight:0.75 Width:WIDTH ShadowColor:[UIColor blackColor]];
        rect = CGRectMake((WIDTH-text.size.width)/2, 25, text.size.width, text.size.height);
    }
    TextImage *textImage = [[TextImage alloc] initwithImage:text blendMode:kCGBlendModeLighten alpha:1.0];
    TextImage *shadowImage = [[TextImage alloc] initwithImage:shadow blendMode:kCGBlendModeNormal alpha:1.0];
    TextImageView *view = [[TextImageView alloc] initWithFrame:rect Images:[[NSArray alloc] initWithObjects:textImage,shadowImage, nil]];
    return view;
}

-(UIImage *)textShadow:(UILabel *)text {
    text.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    //Drop Shadow
    [[text layer] setShadowOffset:CGSizeMake(-1,1)];
    [[text layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[text layer] setShadowRadius:5.0];
    [[text layer] setShadowOpacity:1.0];
    
    UIGraphicsBeginImageContext(text.frame.size);
    [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *shadowImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return shadowImage;
    
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

-(NSArray *)textDivider:(NSString *)text {
    NSArray *words = [text componentsSeparatedByString:@" "];
    NSLog(@"%d",[words count]);
    NSMutableArray *lines = [[NSMutableArray alloc] init];
    int index = 0;
    while (index < [words count]) {
        NSString *next = [words objectAtIndex:index];
        if([next length] < 5) {
            NSString *second = [words objectAtIndex:index + 1];
            if([second length] < 5) {
                NSString *final = [next stringByAppendingString:[@" " stringByAppendingString:[words objectAtIndex:index+1]]];
                [lines addObject:final];
                index += 2;
            } else {
                [lines addObject:next];
                index += 1;
            }
        } else {
            [lines addObject:next];
            index += 1;
        }
    }
    NSLog(@"number of lines: %d",[lines count]);
    return lines;
}

-(NSArray *)backplateDivider:(NSString *)text Font:(UIFont *)font {
    NSArray *words = [text componentsSeparatedByString:@" "];
    NSMutableArray *lines = [[NSMutableArray alloc] init];
    if([self getFontSize:text forWidth:WIDTH withMax:100.0 Font:font]>=67.5) {
        NSLog(@"font size: %f",[self getFontSize:text forWidth:WIDTH withMax:100.0 Font:font]);
        NSLog(@"number of lines: 111111");
        return [[NSArray alloc] initWithObjects:text, nil];
    } else {
        NSMutableArray *lines = [[NSMutableArray alloc] init];
        NSString *first = @"";
        NSString *next = [words objectAtIndex:0];
        NSLog(next);
        int index = 0;
        while([self getFontSize:next forWidth:WIDTH withMax:100.0 Font:font] >= 37.5 && index<[words count]-1) {
            ++index;
            NSLog(next);
            first = next;
            next = [[first stringByAppendingString:@" "] stringByAppendingString:[words objectAtIndex:index]];
        }
        NSLog(@"first line...");
        NSLog(first);
        [lines addObject:first];
        if(index == [words count]) {
            NSLog(@"number of lines: %d",[lines count]);
            return lines;
        }
        NSString *second = @"";
        for(int i = index; i<[words count]; ++i) {
            second = [[second stringByAppendingString:@" "] stringByAppendingString:[words objectAtIndex:i]];
        }
        NSLog(@"reached here");
        NSLog(second);
        if([self getFontSize:second forWidth:WIDTH withMax:100.0 Font:font]>=37.5) {
            [lines addObject:second];
            NSLog(@"number of lines: %d",[lines count]);
            return lines;
        } else {
            NSString *ellipses = [second stringByAppendingString:@"..."];
            while([self getFontSize:ellipses forWidth:WIDTH withMax:100.0 Font:font]<37.5){
                second = [second substringToIndex:[second length] - 1];
                ellipses = [second stringByAppendingString:@"..."];
            }
            [lines addObject:ellipses];
            NSLog(@"number of lines: %d",[lines count]);
            return lines;
        }
    }
}

-(CGFloat)getFontSize:(NSString *)text forWidth:(NSInteger)width withMax:(CGFloat)maxSize Font:(UIFont *)font {    
    CGFloat actualFontSize = maxSize;
    CGSize  size = [text sizeWithFont:font minFontSize:1 actualFontSize:&actualFontSize forWidth:width lineBreakMode:UILineBreakModeTailTruncation];
    while (size.width > width) {
        CGSize  size = [text sizeWithFont:font minFontSize:10 actualFontSize:&actualFontSize forWidth:width lineBreakMode:UILineBreakModeTailTruncation];
        --actualFontSize;
    }
    return actualFontSize;
}

-(UIImage *)TextMaker:(NSString *)title SizeRules:(SizeRule)sizeRules LineRules:(LineRule)lineRules Font:(NSString *)fontType FontSize:(CGFloat)fontSize Alignment:(UITextAlignment)alignment Rotation:(CGFloat)radians SizeToFit:(BOOL)sizeToFit Uppercase:(BOOL)uppercase Color:(UIColor *)color LineHeight:(CGFloat)lineRatio Width:(CGFloat)width {
    return [self TextMaker:title SizeRules:sizeRules LineRules:lineRules Font:fontType FontSize:fontSize Alignment:alignment Rotation:radians SizeToFit:sizeToFit Uppercase:uppercase Color:color LineHeight:lineRatio Width:width ShadowColor:[UIColor blackColor]];
}

-(UIImage *)TextMaker:(NSString *)title SizeRules:(SizeRule)sizeRules LineRules:(LineRule)lineRules Font:(NSString *)fontType FontSize:(CGFloat)fontSize Alignment:(UITextAlignment)alignment Rotation:(CGFloat)radians SizeToFit:(BOOL)sizeToFit Uppercase:(BOOL)uppercase Color:(UIColor *)color LineHeight:(CGFloat)lineRatio Width:(CGFloat)width ShadowColor:(UIColor *)shadow {
    return [self TextMaker:(NSString *)title SizeRules:(SizeRule)sizeRules LineRules:(LineRule)lineRules Font:(NSString *)fontType FontSize:(CGFloat)fontSize Alignment:(UITextAlignment)alignment Rotation:(CGFloat)radians SizeToFit:(BOOL)sizeToFit Uppercase:(BOOL)uppercase Color:(UIColor *)color LineHeight:(CGFloat)lineRatio Width:(CGFloat)width ShadowColor:(UIColor *)shadow ExtraMargins:5.0];
}

-(UIImage *)TextMaker:(NSString *)title SizeRules:(SizeRule)sizeRules LineRules:(LineRule)lineRules Font:(NSString *)fontType FontSize:(CGFloat)fontSize Alignment:(UITextAlignment)alignment Rotation:(CGFloat)radians SizeToFit:(BOOL)sizeToFit Uppercase:(BOOL)uppercase Color:(UIColor *)color LineHeight:(CGFloat)lineRatio Width:(CGFloat)width ShadowColor:(UIColor *)shadow ExtraMargins:(CGFloat)margin {
    NSLog(@"margin: %f",margin);
    if(uppercase) {
        title = [title uppercaseString];
    }
    UIFont *font = [UIFont fontWithName:fontType size:fontSize];
    CGFloat largestSize = fontSize;
    NSArray *lines;
    if(lineRules == TextDivider) {
        lines = [self textDivider:title];
    } else if(lineRules == OneWord) {
        lines = [title componentsSeparatedByString:@" "];
    } else if(lineRules == OneLine ) {
        lines = [[NSArray alloc] initWithObjects:title, nil];
    } else if(lineRules == BackplateLiner) {
        lines = [self backplateDivider:title Font:font];
    }
    
    if(sizeRules == LargestWord) {
        for(NSString *word in lines) {
            CGFloat size = [self getFontSize:word forWidth:width withMax:fontSize Font:font];
            if(size<largestSize) {
                largestSize = size;
            }
        }
    }
    CGFloat lastFont = -1;
    CGFloat height = 0;
    
    UIGraphicsBeginImageContext(CGSizeMake(width +2*margin, HEIGHT));
    CGContextRef final = UIGraphicsGetCurrentContext();
    CGContextRotateCTM (UIGraphicsGetCurrentContext(), radians);
    
    for(int i=0; i<[lines count]; ++i) {
        //context for each label
        UIGraphicsBeginImageContext(CGSizeMake(width, HEIGHT));
        CGContextRef instance = UIGraphicsGetCurrentContext();
        
        NSString *line = [lines objectAtIndex:i];
        NSLog(@"next line is...");
        NSLog(line);
        AdjustableUILabel *text = [[AdjustableUILabel alloc] initWithFrame:CGRectMake(0, height, width, HEIGHT)];
        text.clipsToBounds = NO;
        [text setText:line];
        text.textAlignment = alignment;
        text.verticalAlignment = VerticalAlignmentTopAdjustable;
        [text setFont:font];
        text.numberOfLines = 1;
        text.adjustsFontSizeToFitWidth = sizeToFit;
        text.backgroundColor = [UIColor clearColor];
        text.textColor = color;
        
        //Drop Shadow
        [[text layer] setShadowOffset:CGSizeMake(-1,1)];
        [[text layer] setShadowColor:[shadow CGColor]];
        [[text layer] setShadowRadius:5.0];
        [[text layer] setShadowOpacity:1.0];
        
        //Size the Font
        CGFloat plusHeight;
        
        if(sizeRules == LargestWord) {
            [text setFont:[UIFont fontWithName:fontType size:largestSize]];
            plusHeight = largestSize*lineRatio;
        } else if(sizeRules == SizeToFit) {
            if ([line length] < 5) {
                if(lastFont == -1) {
                    if(i != [lines count]-1 && [[lines objectAtIndex:i+1] length] >= 5) {
                        CGFloat size = [self getFontSize:[lines objectAtIndex:i+1] forWidth:width withMax:fontSize Font:font];
                        lastFont = size;
                        [text setFont:[UIFont fontWithName:fontType size:lastFont]];
                        plusHeight = lastFont*lineRatio;
                    } else {
                        CGFloat size = [self getFontSize:[lines objectAtIndex:i+1] forWidth:width withMax:fontSize Font:font];
                        [text setFont:[UIFont fontWithName:fontType size:size]];
                        plusHeight = size*lineRatio;
                    }
                } else {
                    [text setFont:[UIFont fontWithName:fontType size:lastFont]];
                    plusHeight = lastFont*lineRatio;
                }
            } else {
                CGFloat size = [self getFontSize:line forWidth:width withMax:fontSize Font:font];
                lastFont = size;
                plusHeight = lastFont*lineRatio;
            }
        } else if(sizeRules == BackplateSizer) {
            if([lines count] == 1) {
                if([self getFontSize:line forWidth:width withMax:100.0 Font:font]>=67.5) {
                    [text setFont:[UIFont fontWithName:fontType size:67.5]];
                    plusHeight = 67.5*lineRatio;
                } else {
                    [text setFont:[UIFont fontWithName:fontType size:37.5]];
                    plusHeight = 37.5*lineRatio;
                }
            } else {
                [text setFont:[UIFont fontWithName:fontType size:37.5]];
                plusHeight = 37.5*lineRatio;
            }
        } else if(sizeRules == None) {
            CGFloat size = [self getFontSize:line forWidth:width withMax:fontSize Font:font];
            plusHeight = size * lineRatio;
        }
        
        [[text layer] renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *label = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        if(height==0) {
            height += plusHeight/2;
        } else {
            height += plusHeight;
        }
        NSLog(@"%f",height);
        [label drawInRect:CGRectMake(margin, height - (160*(sizeRules==SizeToFit)), width, HEIGHT)];
        
    }
    UIImage *big = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(CGSizeMake(width+2*margin,height+150));
    [big drawInRect:CGRectMake(0, 0, big.size.width, big.size.height)];
    UIImage*finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
    
}

-(UIImage *)seperateShadow:(NSString *)title SizeRules:(SizeRule)sizeRules LineRules:(LineRule)lineRules Font:(NSString *)fontType FontSize:(CGFloat)fontSize Alignment:(UITextAlignment)alignment Rotation:(CGFloat)radians SizeToFit:(BOOL)sizeToFit Uppercase:(BOOL)uppercase Color:(UIColor *)color LineHeight:(CGFloat)lineRatio Width:(CGFloat)width ShadowColor:(UIColor *)shadow
{
    UIImage *with = [self TextMaker:title SizeRules:sizeRules LineRules:lineRules Font:fontType FontSize:fontSize Alignment:alignment Rotation:radians SizeToFit:sizeToFit Uppercase:uppercase Color:color LineHeight:lineRatio Width:width ShadowColor:shadow];
    UIImage *without = [self TextMaker:title SizeRules:sizeRules LineRules:lineRules Font:fontType FontSize:fontSize Alignment:alignment Rotation:radians SizeToFit:sizeToFit Uppercase:uppercase Color:color LineHeight:lineRatio Width:width ShadowColor:[UIColor clearColor]];
    
    UIGraphicsBeginImageContext(with.size);
    [with drawInRect:CGRectMake(0, 0, with.size.width, with.size.height)];
    [without drawInRect:CGRectMake(0, 0, without.size.width, without.size.height) blendMode:kCGBlendModeDestinationOut alpha:1.0];
    UIImage *shadowImage = UIGraphicsGetImageFromCurrentImageContext();
    return shadowImage;
}

-(TextImageView *)NormalViewFactory:(UIImage *)text {
    TextImage *image = [[TextImage alloc] initwithImage:text blendMode:kCGBlendModeNormal alpha:1.0];
    return [[TextImageView alloc] initWithFrame:CGRectMake((WIDTH - text.size.width)/2, 0, text.size.width, text.size.height) Image:image];
}

-(TextImageView *)ColorDodgeFactory:(NSString *)title SizeRules:(SizeRule)sizeRules LineRules:(LineRule)lineRules Font:(NSString *)fontType FontSize:(CGFloat)fontSize Alignment:(UITextAlignment)alignment Rotation:(CGFloat)radians SizeToFit:(BOOL)sizeToFit Uppercase:(BOOL)uppercase Color:(UIColor *)color LineHeight:(CGFloat)lineRatio Width:(CGFloat)width ShadowColor:(UIColor *)shadow
{
    UIImage *text = [self TextMaker:title SizeRules:sizeRules LineRules:lineRules Font:fontType FontSize:fontSize Alignment:alignment Rotation:radians SizeToFit:sizeToFit Uppercase:uppercase Color:color LineHeight:lineRatio Width:width ShadowColor:shadow];
    TextImage *textImage = [[TextImage alloc] initwithImage:text blendMode:kCGBlendModeColorDodge alpha:1.0];
    
    UIImage *textShadow = [self seperateShadow:title SizeRules:sizeRules LineRules:lineRules Font:fontType FontSize:fontSize Alignment:alignment Rotation:radians SizeToFit:sizeToFit Uppercase:uppercase Color:color LineHeight:lineRatio Width:width ShadowColor:shadow];
    TextImage *shadowImage = [[TextImage alloc] initwithImage:textShadow blendMode:kCGBlendModeNormal alpha:1.0];
    
    TextImageView *view = [[TextImageView alloc] initWithFrame:CGRectMake(0, 0, text.size.width, text.size.height) Images:[[NSArray alloc] initWithObjects:textImage, shadowImage, nil]];
    
    return view;
}

-(UIImage *)adjustHeight:(UIImage *)image Change:(CGFloat)delta {
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, delta, image.size.width, image.size.height)];
    UIImage *new = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return new;
}

@end

