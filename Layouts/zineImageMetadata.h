//
//  zineImageMetadata.h
//  Layouts
//
//  Created by Conor Dowling on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface zineImageMetadata : NSObject

@property (nonatomic) NSInteger *layoutNum;
@property (nonatomic,strong) NSMutableArray *images;
@property (nonatomic,strong) NSMutableArray *sliders;

struct slider {
    float value;
};
struct image {
    char *url;
    int xOffset;
    int yOffset;
    float zoomLevel;
    
};

@end
