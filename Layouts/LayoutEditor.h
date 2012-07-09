//
//  LayoutEditor.h
//  Layouts
//
//  Created by Conor Dowling on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppScrollView.h"

@interface LayoutEditor : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic) NSInteger layoutNum;
@property (nonatomic, strong) NSMutableArray *zine;
@property (nonatomic, strong) NSMutableArray *metadata;
-(void)unpackLayout:(struct metadata_layout)metadata;



struct metadata_layout {
    int layoutNum;
    char sliders;
    char images;
    int filters;
};

struct metadata_slider {
    float value;
};
struct metadata_image {
    char *url;
    int xOffset;
    int yOffset;
    float zoomLevel;
    
};
@end
