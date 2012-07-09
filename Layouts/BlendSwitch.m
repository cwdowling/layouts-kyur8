//
//  BlendSwitch.m
//  Layouts
//
//  Created by Conor Dowling on 6/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BlendSwitch.h"

@interface BlendSwitch()

@property (weak, nonatomic) UIView *down;
@property (weak, nonatomic) UIView *up;

@end

@implementation BlendSwitch

@synthesize down = _down;
@synthesize up = _up;

- (id)initWithFrame:(CGRect)frame Up:(UIView *)up Down:(UIView *)down {
    self = [super initWithFrame:frame];
    if (self) {
        self.up = up;
        self.down = down;
    }
    return self;
}

- (void)valueChanged {
    if(self.on) {
        [self.up.superview bringSubviewToFront:self.up];
        self.up.alpha = .5;
        self.down.alpha = 1.0;
    } else {
        [self.down.superview bringSubviewToFront:self.down];
        self.up.alpha = 1.0;
        self.down.alpha = .5;
    }
}

@end

