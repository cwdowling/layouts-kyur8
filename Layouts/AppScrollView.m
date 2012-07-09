//
//  AppScrollView.m
//  Layouts
//
//  Created by Conor Dowling on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppScrollView.h"


@implementation AppScrollView

@synthesize pic = _pic;
@synthesize blendTag = _blendTag;

- (id)initWithFrame:(CGRect)frame 
{
    self.blendTag = NO;
    return [super initWithFrame:frame];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event 
{	
    // If not dragging, send event to next responder
    if (!self.dragging) {
        UIImage *load = [UIImage imageNamed:@"test"];
        [self.pic setImage:load];
        self.contentSize = self.pic.image.size;
        self.pic.frame = CGRectMake(0, 0, load.size.width , load.size.height);
        [self.nextResponder touchesEnded: touches withEvent:event];
        self.zoomScale = 330.0/480.0;
    } else
        [super touchesEnded: touches withEvent: event];
}


@end
