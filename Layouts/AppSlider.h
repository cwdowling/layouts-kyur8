//
//  AppSlider.h
//  Layouts
//
//  Created by Conor Dowling on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppSlider : UISlider

@property (retain, nonatomic) NSMutableArray *topBorder;
@property (retain, nonatomic) NSMutableArray *bottomBorder;
@property (retain, nonatomic) NSMutableArray *leftBorder;
@property (retain, nonatomic) NSMutableArray *rightBorder;

@property (retain, nonatomic) UISlider *topSlider;
@property (retain, nonatomic) UISlider *botSlider;
@property (retain, nonatomic) UISlider *leftSlider;
@property (retain, nonatomic) UISlider *rightSlider;

@property (nonatomic) float lastValue;

-(void)valueChanged;

@end
