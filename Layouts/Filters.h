//
//  Filters.h
//  Layouts
//
//  Created by Conor Dowling on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextImageView.h"

typedef enum SizeRule {
    SizeToFit,
    LargestWord,
    None,
    BackplateSizer
} SizeRule;

typedef enum LineRule {
    TextDivider,
    OneWord,
    OneLine,
    BackplateLiner,
} LineRule;

typedef enum Filter {
    Bacon,
    Bitchin,
    Buhloo,
    Clean,
    CutUp,
    Downer,
    DropLeft,
    DropRight,
    Fluffy,
    JustRight,
    Labels,
    LiteRite,
    Longwash,
    PTA,
    Purplicious,
    Rainbow,
    Rugged,
    Scrawl,
    Str8up,
    WashedOut,
    YelloMello
} Filter;


@interface Filters : NSObject

//TO DO
//fix fonts that have characters that go outside the label
//rugged texture and gradient on top?
//sizetofit vertical alignment problems real fix...
//font for PTA...better
//outer glow for purplicious
//emboss and bevel for cutup


//-(UIImage *)Bacon:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//use darken and lighten instead of pin light. Changed Font because Perpetua bold .ttf file was not working. DONE
//-(UIImage *)Bitchin:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//used journal because Jellyka_Estrya_Handwriting would not work. DONE
//-(UIImage *)Buhloo:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//use darken and lighten instead of pin light. MUST FIX
//-(UIImage *)Clean:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//Microsoft sans serif .ttf file not working. DONE
//-(UIImage *)CutUp:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//MUST FIX EXTRA MARGINS
//-(UIImage *)Downer:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//DONE
//-(UIImage *)DropLeft:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//looks good. ask about backplate? DONE
//-(UIImage *)DropRight:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//looks good ask about backplate? DONE
//-(UIImage *)Fluffy:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//Should be ok. MUST FIX
//-(UIImage *)JustRight:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//blend to be mix of colordodge and normal. Changed texture to ligthen and darken. DONE
//-(UIImage *)Labels:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//shadows on overlapping labels. MUST FIX MARGINS
//-(UIImage *)LiteRite:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//DONE
//-(UIImage *)Longwash:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//SKIPPED
//-(UIImage *)PTA:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//text not as thick as photoshop file
//-(UIImage *)Purplicious:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//Lacking outer glow. Did not include text gradient because it is not visible with color dodge used in photoshop file.
//-(UIImage *)Rainbow:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//Pass Through not a supported blend mode in ios. done but must implement margins for shadows.
-(UIImage *)Rugged:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
//-(UIImage *)Scrawl:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//DONE
//-(UIImage *)Str8up:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//DONE
//-(UIImage *)ThornRose:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//Deleted
//-(UIImage *)WashedOut:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//DONE
//-(UIImage *)YelloMello:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//DONE

-(UIImage *)TextMaker:(NSString *)title SizeRules:(SizeRule)sizeRules LineRules:(LineRule)lineRules Font:(NSString *)fontType FontSize:(CGFloat)fontSize Alignment:(UITextAlignment)alignment Rotation:(CGFloat)radians SizeToFit:(BOOL)sizeToFit Uppercase:(BOOL)uppercase Color:(UIColor *)color LineHeight:(CGFloat)lineRatio Width:(CGFloat)width;

-(TextImageView *)getText:(NSString *)title forFilter:(Filter)filter End:(BOOL)end;
-(UIImage *)getImage:(UIImage *)image withFilter:(Filter)filter;
-(TextImageView *)getTopViews:(Filter)filter;
@end
