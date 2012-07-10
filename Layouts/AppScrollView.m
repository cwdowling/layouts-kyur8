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
@synthesize viewController = _viewController;

- (id)initWithFrame:(CGRect)frame 
{
    self.blendTag = NO;
    return [super initWithFrame:frame];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event 
{	
    // If not dragging, send event to next responder
    if (!self.dragging) {
        [self.viewController touchesEnded: touches withEvent:event from:self];
    } else
        [super touchesEnded: touches withEvent: event];
}


@end
