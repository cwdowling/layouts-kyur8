//
//  AppSlider.m
//  Layouts
//
//  Created by Conor Dowling on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppSlider.h"
#import "AppScrollView.h"

@interface AppSlider() 

@end

@implementation AppSlider

@synthesize topBorder = _topBorder;
@synthesize bottomBorder = _bottomBorder;
@synthesize leftBorder = _leftBorder;
@synthesize rightBorder = _rightBorder;

@synthesize topSlider = _topSlider;
@synthesize botSlider = _botSlider;
@synthesize leftSlider = _leftSlider;
@synthesize rightSlider = _rightSlider;

@synthesize lastValue = _lastValue;


-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.topBorder = [[NSMutableArray alloc] init];
    self.bottomBorder = [[NSMutableArray alloc] init];
    self.leftBorder = [[NSMutableArray alloc] init];
    self.rightBorder = [[NSMutableArray alloc] init];
    
    UIImage *sliderMinimum = [[UIImage imageNamed:@"cleartrack.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    [self setMinimumTrackImage:sliderMinimum forState:UIControlStateNormal];
    UIImage *sliderMaximum = [[UIImage imageNamed:@"cleartrack.png"] stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    [self setMaximumTrackImage:sliderMaximum forState:UIControlStateNormal];
    
    return self;

}

- (void) valueChanged {
    @synchronized(self) {
        float change = self.lastValue - self.value;
        self.lastValue = self.value;
        for(UIView *pic in self.topBorder) {
            pic.frame = CGRectMake(pic.frame.origin.x, pic.frame.origin.y+change, pic.frame.size.width, pic.frame.size.height-change);
        }
        for(UIView *pic in self.bottomBorder) {
            pic.frame = CGRectMake(pic.frame.origin.x, pic.frame.origin.y, pic.frame.size.width, pic.frame.size.height+change);
        }
        for(UIView *pic in self.leftBorder) {
            pic.frame = CGRectMake(pic.frame.origin.x-change, pic.frame.origin.y, pic.frame.size.width+change, pic.frame.size.height);
        }
        for(UIView *pic in self.rightBorder) {
            pic.frame = CGRectMake(pic.frame.origin.x, pic.frame.origin.y, pic.frame.size.width-change, pic.frame.size.height);
        }
        
        if(self.maximumValue == self.value) {
            if(self.topSlider) {
                if(self.topSlider.minimumValue != self.topSlider.value) {
                    float change = self.topSlider.value - self.topSlider.minimumValue;
                    if(self.topSlider.value == self.topSlider.maximumValue) {
                        --change;
                    }
                    self.topSlider.frame = CGRectMake(self.topSlider.frame.origin.x, self.topSlider.frame.origin.y, self.topSlider.frame.size.width, self.topSlider.frame.size.height-change);
                    self.topSlider.minimumValue +=change;
                
                    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y-change, self.frame.size.width, self.frame.size.height+change);
                    self.maximumValue +=change;
                }
            }
            if(self.rightSlider) {
                if(self.rightSlider.minimumValue != self.rightSlider.value) {
                    float change = self.rightSlider.value - self.rightSlider.minimumValue;
                    if(self.rightSlider.value == self.rightSlider.maximumValue) {
                        --change;
                    }
                    self.rightSlider.frame = CGRectMake(self.rightSlider.frame.origin.x+change, self.rightSlider.frame.origin.y, self.rightSlider.frame.size.width-change, self.rightSlider.frame.size.height);
                    self.rightSlider.minimumValue +=change;
                
                    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width+change, self.frame.size.height);
                    self.maximumValue +=change;
                }
            }
        } else if(self.minimumValue == self.value) {
            if(self.botSlider) {
                if(self.botSlider.maximumValue != self.botSlider.value) {
                    float change = self.botSlider.maximumValue - self.botSlider.value;
                    if(self.botSlider.value == self.botSlider.minimumValue) {
                        --change;
                    }
                    self.botSlider.frame = CGRectMake(self.botSlider.frame.origin.x, self.botSlider.frame.origin.y+change, self.botSlider.frame.size.width, self.botSlider.frame.size.height-change);
                    self.botSlider.maximumValue += -change;
                
                    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height+change);
                    self.minimumValue += -change;
                }
            }
            if(self.leftSlider) {
                if(self.leftSlider.maximumValue != self.leftSlider.value) {
                    float change = self.leftSlider.maximumValue - self.leftSlider.value;
                    if(self.leftSlider.value == self.leftSlider.minimumValue) {
                        --change;
                    }
                    self.leftSlider.frame = CGRectMake(self.leftSlider.frame.origin.x, self.leftSlider.frame.origin.y, self.leftSlider.frame.size.width-change, self.leftSlider.frame.size.height);
                    self.leftSlider.maximumValue += -change;
                
                    self.frame = CGRectMake(self.frame.origin.x-change, self.frame.origin.y, self.frame.size.width+change, self.frame.size.height);
                    self.minimumValue += -change;
                }
            }
        }
        
    }
}

@end
