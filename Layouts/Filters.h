//
//  Filters.h
//  Layouts
//
//  Created by Conor Dowling on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Filters : NSObject

-(UIImage *)Bacon:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//use softLight instead of pin light. Changed Font because .ttf file was not working
-(UIImage *)Bitchin:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//used journal because Jellyka_Estrya_Handwriting would not work
-(UIImage *)Buhloo:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//use lighten instead of lighter color
-(UIImage *)Clean:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)CutUp:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)Downer:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)DropLeft:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)DropRight:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)Fluffy:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)JustRight:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)Knockout:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//replaced irving-bold with optima-extrablack
-(UIImage *)Labels:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)LiteRite:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)Longwash:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)PTA:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)Purplicious:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)Radsurf:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)Rainbow:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//Pass Through not a supported blend mode in ios
-(UIImage *)Rugged:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)Scrawl:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//text is not visible using colordodge
-(UIImage *)Str8up:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)ThornRose:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)WashedOut:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
-(UIImage *)YelloMello:(UIImage *)image Text:(NSString *)title End:(BOOL)lastPicture;//
@end
