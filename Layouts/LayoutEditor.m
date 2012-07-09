//
//  LayoutEditor.m
//  Layouts
//
//  Created by Conor Dowling on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LayoutEditor.h"
#import "AppSlider.h"
#import "AppView.h"
#import "DividerWidthSlider.h"
#import "Preview.h"
#import "BlendSwitch.h"
#import <QuartzCore/QuartzCore.h>

@interface LayoutEditor()

@property (weak, nonatomic) IBOutlet UILabel *instruction;
@property (weak, nonatomic) IBOutlet UIButton *preview;
@property (weak, nonatomic) IBOutlet UIButton *next;
@property (weak, nonatomic) IBOutlet AppView *pictureSpace;
@property (weak, nonatomic) DividerWidthSlider *dividerSlider;
- (UIImage *) takePicture;
- (IBAction)sliderChanged:(id)sender;


@end

@implementation LayoutEditor
@synthesize layoutNum = _layoutNum;
@synthesize zine = _zine;
@synthesize preview;
@synthesize next;
@synthesize instruction;
@synthesize pictureSpace;
@synthesize dividerSlider;

const int FRAME_ORIGIN_X = 50;
const int FRAME_ORIGIN_Y= 20;
const int FRAME_HEIGHT = 330;
const int FRAME_WIDTH = 220;
const float CONVERSION_RATIO = 480.0/330.0;
const int IPHONE_SCREEN = 480*320*4;

-(CGRect)getRightSlider {
    return CGRectMake(FRAME_ORIGIN_X + FRAME_WIDTH - FRAME_HEIGHT/2 - 10, FRAME_ORIGIN_Y+FRAME_HEIGHT/2 - 15, FRAME_HEIGHT+20, 30); 
}

-(CGRect)getLeftSlider {
    return CGRectMake(FRAME_ORIGIN_X - FRAME_HEIGHT/2 -10, FRAME_ORIGIN_Y+FRAME_HEIGHT/2-15, FRAME_HEIGHT+20, 30);
}

-(CGRect)getTopSlider {
    return CGRectMake(FRAME_ORIGIN_X-10, FRAME_ORIGIN_Y - 15, FRAME_WIDTH+20, 30);
}

-(CGRect)getBottomSlider {
    return CGRectMake(FRAME_ORIGIN_X-10, FRAME_ORIGIN_Y + FRAME_HEIGHT -15, FRAME_WIDTH+20, 30);
}

-(CGRect)getControlSliderLeft {
    return CGRectMake(FRAME_ORIGIN_X/2 - 50, 250, 100, 30);
}

-(CGRect)getControlSliderRight {
    return CGRectMake(320 - 50 - FRAME_ORIGIN_X/2, 250, 100, 30);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)configureImage:(AppScrollView *)frame {
    frame.delegate = self;
    frame.minimumZoomScale = .2;
    frame.maximumZoomScale = 5;
    frame.showsHorizontalScrollIndicator = NO;
    frame.showsVerticalScrollIndicator = NO;
    [pictureSpace addSubview:frame];
    [pictureSpace bringSubviewToFront:frame];
    UIImageView *pic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add"]];
    pic.frame = CGRectMake(0, 0, frame.frame.size.width, frame.frame.size.height);
    frame.pic = pic;
    [frame addSubview:pic];
    [frame setZoomScale:1.0/CONVERSION_RATIO];
}

-(void)configureSlider:(AppSlider *)slider {
    [self.view addSubview:slider];
    slider.minimumValue = -(slider.frame.size.width-20)/2;
    slider.maximumValue = (slider.frame.size.width-20)/2;
    slider.value = 0;
    [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
}

-(DividerWidthSlider *) configureDividerSlider:(CGRect) rect {
    DividerWidthSlider *slider = [[DividerWidthSlider alloc] initWithFrame:rect];
    slider.transform = CGAffineTransformRotate(slider.transform, 270.0/180*M_PI);
    [self.view addSubview:slider];
    slider.minimumValue = 0;
    slider.maximumValue = 10;
    slider.value = 0;
    [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    return slider;
}

- (void)addLayout:(int)layoutNum {
    //TODO
    //layouts 2
    //takePicture
    switch (layoutNum) {
        
        case 1: { 
            //A single image
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT)];
            [self configureImage:image1];
            break;
            
        } case 2: {
            //two images blended
            //up
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT)];
            [self configureImage:image1];
            image1.blendTag = YES;
            
            //down
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT)];
            [self configureImage:image2];
            image2.blendTag = YES;
            
            //blend switch
            BlendSwitch *flip = [[BlendSwitch alloc] initWithFrame:CGRectMake(-15, 300, 10, 20) Up:image1 Down:image2];
            flip.transform = CGAffineTransformRotate(flip.transform, 270.0/180*M_PI);
            [self.view addSubview:flip];
            [flip addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
            
            break;
            
        }case 3: { 
            //two images side by side
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //left image
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/2, FRAME_HEIGHT)];
            [self configureImage:image1];
            
            //right image
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, 0, FRAME_WIDTH/2, FRAME_HEIGHT)];
            [self configureImage:image2];
            
            //top gap slider
            AppSlider *topSlider = [[AppSlider alloc] initWithFrame:[self getTopSlider]];
            [self configureSlider:topSlider];
            [topSlider.rightBorder addObject:image1];
            [topSlider.leftBorder addObject:image2];
                        
            //width slider
            [self.dividerSlider.rightBorder addObject:image1];
            [self.dividerSlider.leftBorder addObject:image2];
            
            break;
            
        }case 4: {
            //two images stacked vertically
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //top image
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT/2)];
            [self configureImage:image1];
            
            //bottom image
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(0,FRAME_HEIGHT/2, FRAME_WIDTH, FRAME_HEIGHT/2)];
            [self configureImage:image2];
            
            //right gap slider
            AppSlider *rightSlider = [[AppSlider alloc] initWithFrame:[self getRightSlider]];
            [self configureSlider:rightSlider];
            rightSlider.transform = CGAffineTransformRotate(rightSlider.transform, 270.0/180*M_PI);

            [rightSlider.bottomBorder addObject:image1];
            [rightSlider.topBorder addObject:image2];

            //width slider
            [self.dividerSlider.bottomBorder addObject:image1];
            [self.dividerSlider.topBorder addObject:image2];
            
            break;
            
        }case 5: {
            //one image inside a larger image
            //large
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT)];
            [self configureImage:image1];
            
            //small
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(40, 60, FRAME_WIDTH-80, FRAME_HEIGHT-120)];
            [self configureImage:image2];

            break;
            
        }case 6: {
            //one image on top of two images side by side
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //top
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT/2)];
            [self configureImage:image1];
            //bottom left
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/2, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image2];
            //bottom right
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, FRAME_HEIGHT/2, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image3];
            
            //right gap slider
            AppSlider *rightSlider = [[AppSlider alloc] initWithFrame:[self getRightSlider]];
            [self configureSlider:rightSlider];
            rightSlider.transform = CGAffineTransformRotate(rightSlider.transform, 270.0/180*M_PI);
            [rightSlider.bottomBorder addObject:image1];
            [rightSlider.topBorder addObject:image2];
            [rightSlider.topBorder addObject:image3];
            
            //top gap slider
            AppSlider *bottomSlider = [[AppSlider alloc] initWithFrame:[self getBottomSlider]];
            [self configureSlider:bottomSlider];
            [bottomSlider.rightBorder addObject:image2];
            [bottomSlider.leftBorder addObject:image3];
            
            //width slider
            [self.dividerSlider.bottomBorder addObject:image1];            
            [self.dividerSlider.topBorder addObject:image2]; 
            [self.dividerSlider.topBorder addObject:image3];   
            [self.dividerSlider.rightBorder addObject:image2];   
            [self.dividerSlider.leftBorder addObject:image3];            

            break;
            
        }case 7: {
            //two images on top side by side with one image on bottom
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //top left
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image1];
            //top right
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, 0, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image2];
            //bottom
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/2, FRAME_WIDTH, FRAME_HEIGHT/2)];
            [self configureImage:image3];
            
            //right gap slider
            AppSlider *rightSlider = [[AppSlider alloc] initWithFrame:[self getRightSlider]];
            [self configureSlider:rightSlider];
            rightSlider.transform = CGAffineTransformRotate(rightSlider.transform, 270.0/180*M_PI);
            [rightSlider.bottomBorder addObject:image1];
            [rightSlider.bottomBorder addObject:image2];
            [rightSlider.topBorder addObject:image3];
            
            //top gap slider
            AppSlider *topSlider = [[AppSlider alloc] initWithFrame:[self getTopSlider]];
            [self configureSlider:topSlider];
            [topSlider.rightBorder addObject:image1];
            [topSlider.leftBorder addObject:image2];
            
            //width slider
            [self.dividerSlider.bottomBorder addObject:image1];            
            [self.dividerSlider.bottomBorder addObject:image2];
            [self.dividerSlider.leftBorder addObject:image2];
            [self.dividerSlider.rightBorder addObject:image1];
            [self.dividerSlider.topBorder addObject:image3];
            
            break;
            
        }case 8: {
            //one image on left with two images stacked vertically on right
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //left
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/2, FRAME_HEIGHT)];
            [self configureImage:image1];
            
            //top right
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, 0, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image2];
            
            //bottom right
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, FRAME_HEIGHT/2, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image3];
            
            //right gap slider
            AppSlider *rightSlider = [[AppSlider alloc] initWithFrame:[self getRightSlider]];
            [self configureSlider:rightSlider];
            rightSlider.transform = CGAffineTransformRotate(rightSlider.transform, 270.0/180*M_PI);
            [rightSlider.bottomBorder addObject:image2];
            [rightSlider.topBorder addObject:image3];

            //top gap slider
            AppSlider *topSlider = [[AppSlider alloc] initWithFrame:[self getTopSlider]];
            [self configureSlider:topSlider];
            [topSlider.rightBorder addObject:image1];
            [topSlider.leftBorder addObject:image2];
            [topSlider.leftBorder addObject:image3];
            
            //width divider
            [self.dividerSlider.bottomBorder addObject:image2];            
            [self.dividerSlider.topBorder addObject:image3];
            [self.dividerSlider.rightBorder addObject:image1];
            [self.dividerSlider.leftBorder addObject:image2];
            [self.dividerSlider.leftBorder addObject:image3];
            
            break;
            
            
        }case 9: {
            //two images stacked vertically on the left with one on the right
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderRight]];
            //top left
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image1];
            //bottom left
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/2, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image2];
            //right
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, 0, FRAME_WIDTH/2, FRAME_HEIGHT)];
            [self configureImage:image3];
            
            //top gap slider
            AppSlider *topSlider = [[AppSlider alloc] initWithFrame:[self getTopSlider]];
            [self configureSlider:topSlider];
            [topSlider.rightBorder addObject:image1];
            [topSlider.rightBorder addObject:image2];
            [topSlider.leftBorder addObject:image3];
            
            //left gap slider
            AppSlider *leftSlider = [[AppSlider alloc] initWithFrame:[self getLeftSlider]];
            [self configureSlider:leftSlider];
            leftSlider.transform = CGAffineTransformRotate(leftSlider.transform, 270.0/180*M_PI);
            [leftSlider.bottomBorder addObject:image1];
            [leftSlider.topBorder addObject:image2];
            
            //width slider
            [self.dividerSlider.bottomBorder addObject:image1];            
            [self.dividerSlider.topBorder addObject:image2];
            [self.dividerSlider.rightBorder addObject:image1];
            [self.dividerSlider.rightBorder addObject:image2];
            [self.dividerSlider.leftBorder addObject:image3];
            
            break;
            
        }case 10: {
            //3 images stacked vertically
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //top third
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT/3)];
            [self configureImage:image1];
            //middle third
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/3, FRAME_WIDTH, FRAME_HEIGHT/3)];
            [self configureImage:image2];
            //bottom third
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, (2*FRAME_HEIGHT)/3, FRAME_WIDTH, FRAME_HEIGHT/3)];
            [self configureImage:image3];
            
            //right gap sliders
            AppSlider *rightTopSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/2 + 20, FRAME_ORIGIN_Y+FRAME_HEIGHT/4-15 -5, FRAME_HEIGHT/2+10, 30)];
            [self configureSlider:rightTopSlider];
            rightTopSlider.value += -33;
            rightTopSlider.lastValue +=-33;
            rightTopSlider.transform = CGAffineTransformRotate(rightTopSlider.transform, 270.0/180*M_PI);
            
            AppSlider *rightBotSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/2 +20, FRAME_ORIGIN_Y+(3*FRAME_HEIGHT)/4-10, FRAME_HEIGHT/2+10, 30)];
            [self configureSlider:rightBotSlider];
            rightBotSlider.value += 33;
            rightBotSlider.lastValue += 33;
            rightBotSlider.transform = CGAffineTransformRotate(rightBotSlider.transform, 270.0/180*M_PI);
            
            [rightTopSlider.bottomBorder addObject:image1];
            [rightTopSlider.topBorder addObject:image2];
            
            [rightBotSlider.bottomBorder addObject:image2];
            [rightBotSlider.topBorder addObject:image3];
            
            rightTopSlider.botSlider = rightBotSlider;
            rightBotSlider.topSlider = rightTopSlider;
            
            //width slider
            [self.dividerSlider.bottomBorder addObject:image1];            
            [self.dividerSlider.topBorder addObject:image2];
            [self.dividerSlider.bottomBorder addObject:image2];
            [self.dividerSlider.topBorder addObject:image3];
            
            break;
            
        }case 11: {
            //3 images side by side
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //left
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/3, FRAME_HEIGHT)];
            [self configureImage:image1];
            //middle
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/3, 0, FRAME_WIDTH/3, FRAME_HEIGHT)];
            [self configureImage:image2];
            //right
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake((2*FRAME_WIDTH)/3, 0, FRAME_WIDTH/3, FRAME_HEIGHT)];
            [self configureImage:image3];
                    
            //top gap sliders
            AppSlider *topLeftSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X-10, FRAME_ORIGIN_Y-15,FRAME_WIDTH/2 +10, 30)];
            [self configureSlider:topLeftSlider];
            topLeftSlider.value += 23;
            topLeftSlider.lastValue = 23;
            
            AppSlider *topRightSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/2, FRAME_ORIGIN_Y-15, FRAME_WIDTH/2+10, 30)];
            [self configureSlider:topRightSlider];
            topRightSlider.value += -24;
            topRightSlider.lastValue = -24;
            
            [topLeftSlider.rightBorder addObject:image1];
            [topLeftSlider.leftBorder addObject:image2];
            
            [topRightSlider.rightBorder addObject:image2];
            [topRightSlider.leftBorder addObject:image3];
            
            topLeftSlider.rightSlider = topRightSlider;
            topRightSlider.leftSlider = topLeftSlider;
            
            //width slider
            [self.dividerSlider.rightBorder addObject:image1];            
            [self.dividerSlider.leftBorder addObject:image2];
            [self.dividerSlider.rightBorder addObject:image2];
            [self.dividerSlider.leftBorder addObject:image3];
            
            
            break;
            
        }case 12: {
            //2 images stacked vertically inside an image

            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT)];
            [self configureImage:image1];
            
            //small top
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(40, 60, FRAME_WIDTH-80, (FRAME_HEIGHT-120)/2)];
            [self configureImage:image2];
            
            //small bottom
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(40, FRAME_HEIGHT/2, FRAME_WIDTH-80, (FRAME_HEIGHT-120)/2)];
            [self configureImage:image3];
        
            break;
            
        }case 13: {
            //4 images in a 2x2 grid
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //top left
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image1];
            //top right
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, 0, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image2];
            //bottom left
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/2, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image3];
            //bottom right
            AppScrollView *image4 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, FRAME_HEIGHT/2, FRAME_WIDTH/2, FRAME_HEIGHT/2)];
            [self configureImage:image4];
            
            //right gap slider
            AppSlider *rightSlider = [[AppSlider alloc] initWithFrame:[self getRightSlider]];
            [self configureSlider:rightSlider];
            rightSlider.transform = CGAffineTransformRotate(rightSlider.transform, 270.0/180*M_PI);
            [rightSlider.bottomBorder addObject:image1];
            [rightSlider.bottomBorder addObject:image2];
            [rightSlider.topBorder addObject:image3];            
            [rightSlider.topBorder addObject:image4];
            
            //top gap slider
            AppSlider *topSlider = [[AppSlider alloc] initWithFrame:[self getTopSlider]];
            [self configureSlider:topSlider];
            [topSlider.rightBorder addObject:image1];
            [topSlider.rightBorder addObject:image3];
            [topSlider.leftBorder addObject:image2];
            [topSlider.leftBorder addObject:image4];
            
            //width slider
            [self.dividerSlider.rightBorder addObject:image1];            
            [self.dividerSlider.leftBorder addObject:image2];
            [self.dividerSlider.rightBorder addObject:image3];
            [self.dividerSlider.leftBorder addObject:image4];
            [self.dividerSlider.bottomBorder addObject:image1];            
            [self.dividerSlider.topBorder addObject:image3];
            [self.dividerSlider.bottomBorder addObject:image2];
            [self.dividerSlider.topBorder addObject:image4];
            
            break;
            
        }case 14: {
            //4 images side by side
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //left
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/4, FRAME_HEIGHT)];
            [self configureImage:image1];
            //left middle
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/4, 0, FRAME_WIDTH/4, FRAME_HEIGHT)];
            [self configureImage:image2];
            //right middle
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, 0, FRAME_WIDTH/4, FRAME_HEIGHT)];
            [self configureImage:image3];
            //right
            AppScrollView *image4 = [[AppScrollView alloc] initWithFrame:CGRectMake((3*FRAME_WIDTH)/4, 0, FRAME_WIDTH/4, FRAME_HEIGHT)];
            [self configureImage:image4];
            
            //top gap sliders
            AppSlider *topLeftSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X-10, FRAME_ORIGIN_Y-15,FRAME_WIDTH/3 +10, 30)];
            [self configureSlider:topLeftSlider];
            topLeftSlider.value += 23;
            topLeftSlider.lastValue = 23;
            
            AppSlider *topMiddleSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/3, FRAME_ORIGIN_Y-15, FRAME_WIDTH/3, 30)];
            [self configureSlider:topMiddleSlider];
            topMiddleSlider.value += 0;
            topMiddleSlider.lastValue = 0;
            
            AppSlider *topRightSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X + (2*FRAME_WIDTH)/3, FRAME_ORIGIN_Y-15, FRAME_WIDTH/3+10, 30)];
            [self configureSlider:topRightSlider];
            topRightSlider.value += -23;
            topRightSlider.lastValue += -23;
            
            [topLeftSlider.rightBorder addObject:image1];
            [topLeftSlider.leftBorder addObject:image2];
            
            [topMiddleSlider.rightBorder addObject:image2];
            [topMiddleSlider.leftBorder addObject:image3];
            
            [topRightSlider.rightBorder addObject:image3];
            [topRightSlider.leftBorder addObject:image4];
            
            topLeftSlider.rightSlider = topMiddleSlider;
            topMiddleSlider.leftSlider = topLeftSlider;
            topMiddleSlider.rightSlider = topRightSlider;
            topRightSlider.leftSlider = topMiddleSlider;
            
            //width slider
            [self.dividerSlider.rightBorder addObject:image1];            
            [self.dividerSlider.leftBorder addObject:image2];
            [self.dividerSlider.rightBorder addObject:image2];
            [self.dividerSlider.leftBorder addObject:image3];
            [self.dividerSlider.rightBorder addObject:image3];
            [self.dividerSlider.leftBorder addObject:image4];
            break;
            
        }case 15: {
            //4 images stacked vertically
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //top third
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT/4)];
            [self configureImage:image1];
            //top middle
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/4, FRAME_WIDTH, FRAME_HEIGHT/4+1)];
            [self configureImage:image2];
            //bottom middle
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/2, FRAME_WIDTH, FRAME_HEIGHT/4)];
            [self configureImage:image3];
            //bottom
            AppScrollView *image4 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, (3*FRAME_HEIGHT)/4, FRAME_WIDTH, FRAME_HEIGHT/4)];
            [self configureImage:image4];
            
            AppSlider *rightTopSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ 2*FRAME_WIDTH/3 + 15, FRAME_ORIGIN_Y+FRAME_HEIGHT/6-15 -5, FRAME_HEIGHT/3+10, 30)];
            [self configureSlider:rightTopSlider];
            rightTopSlider.value += -33;
            rightTopSlider.lastValue +=-33;
            rightTopSlider.transform = CGAffineTransformRotate(rightTopSlider.transform, 270.0/180*M_PI);
            
            AppSlider *rightMiddleSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ 2*FRAME_WIDTH/3 +20, FRAME_ORIGIN_Y+FRAME_HEIGHT/2 -15, FRAME_HEIGHT/3, 30)];
            [self configureSlider:rightMiddleSlider];
            rightMiddleSlider.value += 0;
            rightMiddleSlider.lastValue += 0;
            rightMiddleSlider.transform = CGAffineTransformRotate(rightMiddleSlider.transform, 270.0/180*M_PI);
            
            AppSlider *rightBotSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ 2*FRAME_WIDTH/3 +15, FRAME_ORIGIN_Y+(5*FRAME_HEIGHT)/6-10, FRAME_HEIGHT/3+10, 30)];
            [self configureSlider:rightBotSlider];
            rightBotSlider.value += 33;
            rightBotSlider.lastValue += 33;
            rightBotSlider.transform = CGAffineTransformRotate(rightBotSlider.transform, 270.0/180*M_PI);
            
            [rightTopSlider.bottomBorder addObject:image1];
            [rightTopSlider.topBorder addObject:image2];
            
            [rightMiddleSlider.bottomBorder addObject:image2];
            [rightMiddleSlider.topBorder addObject:image3];
            
            [rightBotSlider.bottomBorder addObject:image3];
            [rightBotSlider.topBorder addObject:image4];
            
            rightTopSlider.botSlider = rightMiddleSlider;
            rightMiddleSlider.topSlider = rightTopSlider;
            rightMiddleSlider.botSlider = rightBotSlider;
            rightBotSlider.topSlider = rightMiddleSlider;
            
            //width slider
            [self.dividerSlider.bottomBorder addObject:image1];            
            [self.dividerSlider.topBorder addObject:image2];
            [self.dividerSlider.bottomBorder addObject:image2];
            [self.dividerSlider.topBorder addObject:image3];
            [self.dividerSlider.bottomBorder addObject:image3];
            [self.dividerSlider.topBorder addObject:image4];
            
            break;
            
        }case 16: {
            //1 image on the left. 3 stacked vertically on the right
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //right top third
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, 0, FRAME_WIDTH/2, FRAME_HEIGHT/3)];
            [self configureImage:image1];
            //right middle third
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, FRAME_HEIGHT/3, FRAME_WIDTH/2, FRAME_HEIGHT/3)];
            [self configureImage:image2];
            //right bottom third
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, (2*FRAME_HEIGHT)/3, FRAME_WIDTH/2, FRAME_HEIGHT/3)];
            [self configureImage:image3];
            //left
            AppScrollView *image4 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/2, FRAME_HEIGHT)];
            [self configureImage:image4];
            
            //top gap slider
            AppSlider *topSlider = [[AppSlider alloc] initWithFrame:[self getTopSlider]];
            [self configureSlider:topSlider];
            [topSlider.leftBorder addObject:image4];
            [topSlider.rightBorder addObject:image1];
            [topSlider.rightBorder addObject:image2];
            [topSlider.rightBorder addObject:image3];
            
            //right gap sliders
            AppSlider *rightTopSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/2 + 20, FRAME_ORIGIN_Y+FRAME_HEIGHT/4-15 -5, FRAME_HEIGHT/2+10, 30)];
            [self configureSlider:rightTopSlider];
            rightTopSlider.value += -33;
            rightTopSlider.lastValue +=-33;
            rightTopSlider.transform = CGAffineTransformRotate(rightTopSlider.transform, 270.0/180*M_PI);
            
            AppSlider *rightBotSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/2 +20, FRAME_ORIGIN_Y+(3*FRAME_HEIGHT)/4-10, FRAME_HEIGHT/2+10, 30)];
            [self configureSlider:rightBotSlider];
            rightBotSlider.value += 33;
            rightBotSlider.lastValue += 33;
            rightBotSlider.transform = CGAffineTransformRotate(rightBotSlider.transform, 270.0/180*M_PI);
            
            [rightTopSlider.bottomBorder addObject:image1];
            [rightTopSlider.topBorder addObject:image2];
            
            [rightBotSlider.bottomBorder addObject:image2];
            [rightBotSlider.topBorder addObject:image3];
            
            rightTopSlider.botSlider = rightBotSlider;
            rightBotSlider.topSlider = rightTopSlider;
            
            //width slider
            [self.dividerSlider.bottomBorder addObject:image1];            
            [self.dividerSlider.topBorder addObject:image2];
            [self.dividerSlider.bottomBorder addObject:image2];
            [self.dividerSlider.topBorder addObject:image3];
            [self.dividerSlider.leftBorder addObject:image1];
            [self.dividerSlider.leftBorder addObject:image2];
            [self.dividerSlider.leftBorder addObject:image3];
            [self.dividerSlider.rightBorder addObject:image4];
            
            break;
            
        }case 17: {
            //3 images stacked vertically on the left. 1 image on the right.
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderRight]];
            //left top third
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/2, FRAME_HEIGHT/3)];
            [self configureImage:image1];
            //left middle third
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/3, FRAME_WIDTH/2, FRAME_HEIGHT/3)];
            [self configureImage:image2];
            //left bottom third
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, (2*FRAME_HEIGHT)/3, FRAME_WIDTH/2, FRAME_HEIGHT/3)];
            [self configureImage:image3];
            //right
            AppScrollView *image4 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/2, 0, FRAME_WIDTH/2, FRAME_HEIGHT)];
            [self configureImage:image4];
            
            //top gap slider
            AppSlider *topSlider = [[AppSlider alloc] initWithFrame:[self getTopSlider]];
            [self configureSlider:topSlider];
            [topSlider.leftBorder addObject:image4];
            [topSlider.rightBorder addObject:image1];
            [topSlider.rightBorder addObject:image2];
            [topSlider.rightBorder addObject:image3];
            
            //right gap sliders
            AppSlider *leftTopSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X- FRAME_WIDTH/2 + 20, FRAME_ORIGIN_Y+FRAME_HEIGHT/4-15 -5, FRAME_HEIGHT/2+10, 30)];
            [self configureSlider:leftTopSlider];
            leftTopSlider.value += -33;
            leftTopSlider.lastValue +=-33;
            leftTopSlider.transform = CGAffineTransformRotate(leftTopSlider.transform, 270.0/180*M_PI);
            
            AppSlider *leftBotSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X- FRAME_WIDTH/2 +20, FRAME_ORIGIN_Y+(3*FRAME_HEIGHT)/4-10, FRAME_HEIGHT/2+10, 30)];
            [self configureSlider:leftBotSlider];
            leftBotSlider.value += 33;
            leftBotSlider.lastValue += 33;
            leftBotSlider.transform = CGAffineTransformRotate(leftBotSlider.transform, 270.0/180*M_PI);
            
            [leftTopSlider.bottomBorder addObject:image1];
            [leftTopSlider.topBorder addObject:image2];
            
            [leftBotSlider.bottomBorder addObject:image2];
            [leftBotSlider.topBorder addObject:image3];
            
            leftTopSlider.botSlider = leftBotSlider;
            leftBotSlider.topSlider = leftTopSlider;
            
            //width slider
            [self.dividerSlider.bottomBorder addObject:image1];            
            [self.dividerSlider.topBorder addObject:image2];
            [self.dividerSlider.bottomBorder addObject:image2];
            [self.dividerSlider.topBorder addObject:image3];
            [self.dividerSlider.rightBorder addObject:image1];
            [self.dividerSlider.rightBorder addObject:image2];
            [self.dividerSlider.rightBorder addObject:image3];
            [self.dividerSlider.leftBorder addObject:image4];

            break;
            
        }case 18: {
            //3 images side by side on top with one image on bottom.
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //top left
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/3, FRAME_HEIGHT/2)];
            [self configureImage:image1];
            //top middle
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/3, 0, FRAME_WIDTH/3, FRAME_HEIGHT/2)];
            [self configureImage:image2];
            //top right
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake((2*FRAME_WIDTH)/3, 0, FRAME_WIDTH/3, FRAME_HEIGHT/2)];
            [self configureImage:image3];
            //bottom
            AppScrollView *image4 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/2, FRAME_WIDTH, FRAME_HEIGHT/2)];
            [self configureImage:image4];

            //top gap sliders
            AppSlider *topLeftSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X-10, FRAME_ORIGIN_Y-15,FRAME_WIDTH/2 +10, 30)];
            [self configureSlider:topLeftSlider];
            topLeftSlider.value += 23;
            topLeftSlider.lastValue = 23;
            
            AppSlider *topRightSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/2, FRAME_ORIGIN_Y-15, FRAME_WIDTH/2+10, 30)];
            [self configureSlider:topRightSlider];
            topRightSlider.value += -24;
            topRightSlider.lastValue = -24;
            
            [topLeftSlider.rightBorder addObject:image1];
            [topLeftSlider.leftBorder addObject:image2];
            
            [topRightSlider.rightBorder addObject:image2];
            [topRightSlider.leftBorder addObject:image3];
            
            topLeftSlider.rightSlider = topRightSlider;
            topRightSlider.leftSlider = topLeftSlider;
            
            //right gap slider
            AppSlider *rightSlider = [[AppSlider alloc] initWithFrame:[self getRightSlider]];
            [self configureSlider:rightSlider];
            rightSlider.transform = CGAffineTransformRotate(rightSlider.transform, 270.0/180*M_PI);
            [rightSlider.bottomBorder addObject:image1];
            [rightSlider.bottomBorder addObject:image2];
            [rightSlider.bottomBorder addObject:image3];            
            [rightSlider.topBorder addObject:image4];
            
            //width slider
            [self.dividerSlider.rightBorder addObject:image1];            
            [self.dividerSlider.leftBorder addObject:image2];
            [self.dividerSlider.rightBorder addObject:image2];
            [self.dividerSlider.leftBorder addObject:image3];
            [self.dividerSlider.bottomBorder addObject:image1];
            [self.dividerSlider.bottomBorder addObject:image2];
            [self.dividerSlider.bottomBorder addObject:image3];
            [self.dividerSlider.topBorder addObject:image4];
            
            break;

        }case 19: {
            //3 images side by side on bottom with one image on top
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //bottom left
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/2, FRAME_WIDTH/3, FRAME_HEIGHT/2)];
            [self configureImage:image1];
            //bottom middle
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/3, FRAME_HEIGHT/2, FRAME_WIDTH/3, FRAME_HEIGHT/2)];
            [self configureImage:image2];
            //bottom right
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake((2*FRAME_WIDTH)/3, FRAME_HEIGHT/2, FRAME_WIDTH/3, FRAME_HEIGHT/2)];
            [self configureImage:image3];
            //top
            AppScrollView *image4 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT/2)];
            [self configureImage:image4];
            
            AppSlider *botLeftSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X-10, FRAME_ORIGIN_Y+FRAME_HEIGHT-15,FRAME_WIDTH/2 +10, 30)];
            [self configureSlider:botLeftSlider];
            botLeftSlider.value += 23;
            botLeftSlider.lastValue = 23;
            
            AppSlider *botRightSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/2, FRAME_ORIGIN_Y+FRAME_HEIGHT-15, FRAME_WIDTH/2+10, 30)];
            [self configureSlider:botRightSlider];
            botRightSlider.value += -24;
            botRightSlider.lastValue = -24;
            
            [botLeftSlider.rightBorder addObject:image1];
            [botLeftSlider.leftBorder addObject:image2];
            
            [botRightSlider.rightBorder addObject:image2];
            [botRightSlider.leftBorder addObject:image3];
            
            botLeftSlider.rightSlider = botRightSlider;
            botRightSlider.leftSlider = botLeftSlider;
            
            //right gap slider
            AppSlider *rightSlider = [[AppSlider alloc] initWithFrame:[self getRightSlider]];
            [self configureSlider:rightSlider];
            rightSlider.transform = CGAffineTransformRotate(rightSlider.transform, 270.0/180*M_PI);
            [rightSlider.topBorder addObject:image1];
            [rightSlider.topBorder addObject:image2];
            [rightSlider.topBorder addObject:image3];            
            [rightSlider.bottomBorder addObject:image4];
            
            //width slider
            [self.dividerSlider.rightBorder addObject:image1];            
            [self.dividerSlider.leftBorder addObject:image2];
            [self.dividerSlider.rightBorder addObject:image2];
            [self.dividerSlider.leftBorder addObject:image3];
            [self.dividerSlider.topBorder addObject:image1];
            [self.dividerSlider.topBorder addObject:image2];
            [self.dividerSlider.topBorder addObject:image3];
            [self.dividerSlider.bottomBorder addObject:image4];
            break;

        }case 20: {
            //9 images in a 3x3 grid
            self.dividerSlider = [self configureDividerSlider:[self getControlSliderLeft]];
            //top left
            AppScrollView *image1 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH/3, FRAME_HEIGHT/3)];
            [self configureImage:image1];
            //top middle
            AppScrollView *image2 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/3, 0, FRAME_WIDTH/3, FRAME_HEIGHT/3)];
            [self configureImage:image2];
            //top right
            AppScrollView *image3 = [[AppScrollView alloc] initWithFrame:CGRectMake((2*FRAME_WIDTH)/3, 0, FRAME_WIDTH/3, FRAME_HEIGHT/3)];
            [self configureImage:image3];
            
            //middle left
            AppScrollView *image4 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, FRAME_HEIGHT/3, FRAME_WIDTH/3, FRAME_HEIGHT/3)];
            [self configureImage:image4];
            //middle middle
            AppScrollView *image5 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/3, FRAME_HEIGHT/3, FRAME_WIDTH/3, FRAME_HEIGHT/3)];
            [self configureImage:image5];
            //middle right
            AppScrollView *image6 = [[AppScrollView alloc] initWithFrame:CGRectMake((2*FRAME_WIDTH)/3, FRAME_HEIGHT/3, FRAME_WIDTH/3, FRAME_HEIGHT/3)];
            [self configureImage:image6];
            
            //bottom left
            AppScrollView *image7 = [[AppScrollView alloc] initWithFrame:CGRectMake(0, (2*FRAME_HEIGHT)/3, FRAME_WIDTH/3, FRAME_HEIGHT/3)];
            [self configureImage:image7];
            //bottom middle
            AppScrollView *image8 = [[AppScrollView alloc] initWithFrame:CGRectMake(FRAME_WIDTH/3, (2*FRAME_HEIGHT)/3, FRAME_WIDTH/3, FRAME_HEIGHT/3)];
            [self configureImage:image8];
            //bottom right
            AppScrollView *image9 = [[AppScrollView alloc] initWithFrame:CGRectMake((2*FRAME_WIDTH)/3, (2*FRAME_HEIGHT)/3, FRAME_WIDTH/3, FRAME_HEIGHT/3)];
            [self configureImage:image9];
            
            //top gap sliders
            AppSlider *topLeftSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X-10, FRAME_ORIGIN_Y-15,FRAME_WIDTH/2 +10, 30)];
            [self configureSlider:topLeftSlider];
            topLeftSlider.value += 23;
            topLeftSlider.lastValue = 23;
            
            AppSlider *topRightSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/2, FRAME_ORIGIN_Y-15, FRAME_WIDTH/2+10, 30)];
            [self configureSlider:topRightSlider];
            topRightSlider.value += -24;
            topRightSlider.lastValue = -24;
            
            [topLeftSlider.rightBorder addObject:image1];
            [topLeftSlider.rightBorder addObject:image4];
            [topLeftSlider.rightBorder addObject:image7];
            [topLeftSlider.leftBorder addObject:image2];            
            [topLeftSlider.leftBorder addObject:image5];
            [topLeftSlider.leftBorder addObject:image8];

            [topRightSlider.rightBorder addObject:image2];
            [topRightSlider.rightBorder addObject:image5];
            [topRightSlider.rightBorder addObject:image8];
            [topRightSlider.leftBorder addObject:image3];
            [topRightSlider.leftBorder addObject:image6];
            [topRightSlider.leftBorder addObject:image9];
            
            topLeftSlider.rightSlider = topRightSlider;
            topRightSlider.leftSlider = topLeftSlider;
            
            //right gap sliders
            AppSlider *rightTopSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/2 + 20, FRAME_ORIGIN_Y+FRAME_HEIGHT/4-15 -5, FRAME_HEIGHT/2+10, 30)];
            [self configureSlider:rightTopSlider];
            rightTopSlider.value += -33;
            rightTopSlider.lastValue +=-33;
            rightTopSlider.transform = CGAffineTransformRotate(rightTopSlider.transform, 270.0/180*M_PI);
            
            AppSlider *rightBotSlider = [[AppSlider alloc] initWithFrame:CGRectMake(FRAME_ORIGIN_X+ FRAME_WIDTH/2 +20, FRAME_ORIGIN_Y+(3*FRAME_HEIGHT)/4-10, FRAME_HEIGHT/2+10, 30)];
            [self configureSlider:rightBotSlider];
            rightBotSlider.value += 33;
            rightBotSlider.lastValue += 33;
            rightBotSlider.transform = CGAffineTransformRotate(rightBotSlider.transform, 270.0/180*M_PI);
            
            [rightTopSlider.bottomBorder addObject:image1];
            [rightTopSlider.bottomBorder addObject:image2];
            [rightTopSlider.bottomBorder addObject:image3];
            [rightTopSlider.topBorder addObject:image4];
            [rightTopSlider.topBorder addObject:image5];            
            [rightTopSlider.topBorder addObject:image6];
            
            [rightBotSlider.bottomBorder addObject:image4];
            [rightBotSlider.bottomBorder addObject:image5];
            [rightBotSlider.bottomBorder addObject:image6];
            [rightBotSlider.topBorder addObject:image7];
            [rightBotSlider.topBorder addObject:image8];
            [rightBotSlider.topBorder addObject:image9];
            
            rightTopSlider.botSlider = rightBotSlider;
            rightBotSlider.topSlider = rightTopSlider;
            
            //width slider
            [self.dividerSlider.rightBorder addObject:image1];
            [self.dividerSlider.rightBorder addObject:image2];
            [self.dividerSlider.rightBorder addObject:image4];
            [self.dividerSlider.rightBorder addObject:image5];
            [self.dividerSlider.rightBorder addObject:image7];
            [self.dividerSlider.rightBorder addObject:image8];
            
            [self.dividerSlider.leftBorder addObject:image2];
            [self.dividerSlider.leftBorder addObject:image3];
            [self.dividerSlider.leftBorder addObject:image5];
            [self.dividerSlider.leftBorder addObject:image6];
            [self.dividerSlider.leftBorder addObject:image8];
            [self.dividerSlider.leftBorder addObject:image9];
            
            [self.dividerSlider.bottomBorder addObject:image1];
            [self.dividerSlider.bottomBorder addObject:image2];
            [self.dividerSlider.bottomBorder addObject:image3];
            [self.dividerSlider.bottomBorder addObject:image4];
            [self.dividerSlider.bottomBorder addObject:image5];
            [self.dividerSlider.bottomBorder addObject:image6];
            
            [self.dividerSlider.topBorder addObject:image4];
            [self.dividerSlider.topBorder addObject:image5];
            [self.dividerSlider.topBorder addObject:image6];
            [self.dividerSlider.topBorder addObject:image7];
            [self.dividerSlider.topBorder addObject:image8];
            [self.dividerSlider.topBorder addObject:image9];

            break;
 
        }default: {
            break;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    preview.enabled = NO;
    next.enabled = NO;
    [self addLayout:self.layoutNum];
}

- (void)viewDidUnload
{
    [self setInstruction:nil];
    [self setNext:nil];
    [self setPreview:nil];
    [self setDividerSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (UIView *)viewForZoomingInScrollView:(AppScrollView *)scrollView {
    NSLog(@"zooming");
    return scrollView.pic;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"tap gesture recognized");
    preview.enabled = YES;
    next.enabled = YES;
}

- (IBAction)sliderChanged:(id)sender {
    NSLog(@"valuechanged");
    [sender valueChanged];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"preview"]) {
        NSLog(@"preview");
        Preview *preview = segue.destinationViewController;
        UIImage *pass = [self takePicture];
        NSLog(@"width %f",pass.size.width);
        preview.picture = pass;
    } else if([segue.identifier isEqualToString:@"next"]) {
        NSLog(@"next");
    }
}

- (UIImage *) takePicture {
    CGContextRef final;
    unsigned char *rawData = malloc(IPHONE_SCREEN);

    NSArray *scrollviews = pictureSpace.subviews;
    NSLog(@"%d",[scrollviews count]);
    for(AppScrollView *view in scrollviews) {
        NSLog(@"trying to process a picture");
        UIImage *picture = view.pic.image ;
        CGImageRef imageRef = [picture CGImage];
        NSUInteger width = CGImageGetWidth(imageRef);
        NSLog(@"subpicture width %d",width);
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

        CGFloat zoom = view.zoomScale;
        NSLog(@"zoom level %f",zoom);
        CGFloat totalZoom = zoom * CONVERSION_RATIO;
        CGFloat xVal = view.contentOffset.x * zoom;
        NSLog(@" x offset %f",xVal);
        NSLog(@"content width %f",view.contentSize.width);
        CGFloat yVal = view.contentOffset.y * zoom;
        NSLog(@" y offset %f",yVal);
        
        float finalX = view.frame.origin.x * CONVERSION_RATIO;
        NSLog(@"final x %d",finalX);
        float finalY = view.frame.origin.y * CONVERSION_RATIO;
        NSLog(@"final y %d",finalY);
        int finalWidth = view.frame.size.width * CONVERSION_RATIO;
        NSLog(@"final width %d",finalWidth);
        int finalHeight = view.frame.size.height * CONVERSION_RATIO;
        NSLog(@"final height %d",finalHeight);
        int initialWidth = view.frame.size.width;
        NSLog(@"initial width %d",initialWidth);
        int initialHeight = view.frame.size.height;
        NSLog(@"initial height %d",initialHeight);
         
        int byte = ((finalY * 320) + finalX)*4;
        for(float y=0.0; y<finalHeight; ++y) {
            int yCoord = yVal + y*finalHeight / initialHeight;
            for(float x=0.0; x<finalWidth; ++x) {
                int xCoord = xVal + x*finalWidth/initialWidth;

                int copyByte = (yCoord * width * 4) + (xCoord * 4);
                for(int z=0; z<3; ++z) {
                    if(view.blendTag) {
                        rawData[byte+z] = (char)rawData[byte+z]+(picData[copyByte+z]/2);
                    } else {
                    rawData[byte+z] = (char)picData[copyByte+z];
                    }
                }
                rawData[byte+3] = (char)255;
                byte += 4;
            }
            byte += (320 - finalWidth)*4;
        }

    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    final = CGBitmapContextCreate(rawData, 320, 480, 8, 4*320, colorSpace, kCGImageAlphaPremultipliedLast);

    CGImageRef imageRef = CGBitmapContextCreateImage (final);

    UIImage* rawImage = [UIImage imageWithCGImage:imageRef];  
   
    CGContextRelease(final); 
    free(rawData);
    
    return rawImage;
    
}

@end
