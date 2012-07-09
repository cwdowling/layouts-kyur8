//
//  AppView.m
//  Layouts
//
//  Created by Conor Dowling on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppView.h"

@implementation AppView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event 
{	
    NSLog(@"passing");
    [self.nextResponder touchesEnded: touches withEvent:event]; 
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
