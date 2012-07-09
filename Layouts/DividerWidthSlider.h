//
//  DividerWidthSlider.h
//  Layouts
//
//  Created by Conor Dowling on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DividerWidthSlider : UISlider

@property (retain, nonatomic) IBOutletCollection(UIView) NSMutableArray *topBorder;
@property (retain, nonatomic) IBOutletCollection(UIView) NSMutableArray *bottomBorder;
@property (retain, nonatomic) IBOutletCollection(UIView) NSMutableArray *leftBorder;
@property (retain, nonatomic) IBOutletCollection(UIView) NSMutableArray *rightBorder;
-(void)valueChanged;
-(void)startup;

@end
