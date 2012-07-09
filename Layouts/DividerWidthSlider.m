//
//  DividerWidthSlider.m
//  Layouts
//
//  Created by Conor Dowling on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DividerWidthSlider.h"
@interface DividerWidthSlider()

@property (nonatomic) float lastValue;

@end

@implementation DividerWidthSlider

@synthesize topBorder = _topBorder;
@synthesize bottomBorder = _bottomBorder;
@synthesize leftBorder = _leftBorder;
@synthesize rightBorder = _rightBorder;
@synthesize lastValue = _lastValue;

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.topBorder = [[NSMutableArray alloc] init];
    self.bottomBorder = [[NSMutableArray alloc] init];
    self.leftBorder = [[NSMutableArray alloc] init];
    self.rightBorder = [[NSMutableArray alloc] init];
    self.lastValue = 0.0;
    
    return self;
}

-(void)valueChanged {
    NSLog(@"passed to dividerslider class");
    float change = self.lastValue - self.value;
    self.lastValue = self.value;
    for(UIView *pic in self.topBorder) {
        pic.frame = CGRectMake(pic.frame.origin.x, pic.frame.origin.y-change, pic.frame.size.width, pic.frame.size.height+change);
    }
    for(UIView *pic in self.bottomBorder) {
        pic.frame = CGRectMake(pic.frame.origin.x, pic.frame.origin.y, pic.frame.size.width, pic.frame.size.height+change);
        
    }
    for(UIView *pic in self.leftBorder) {
        NSLog(@"left");
        pic.frame = CGRectMake(pic.frame.origin.x-change, pic.frame.origin.y, pic.frame.size.width+change, pic.frame.size.height);
    }
    for(UIView *pic in self.rightBorder) {
        NSLog(@"right");
        pic.frame = CGRectMake(pic.frame.origin.x, pic.frame.origin.y, pic.frame.size.width+change, pic.frame.size.height);
        
    }

    
}

@end
