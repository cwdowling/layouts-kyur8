//
//  ZineMetadata.h
//  Layouts
//
//  Created by Conor Dowling on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SliderMetadata.h"
#import "ImageMetadata.h"
#import "FilterMetadata.h"

@interface ZineMetadata : NSObject

@property (nonatomic) NSNumber *layoutNum;
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) NSMutableArray *sliders;
@property (nonatomic, strong) NSMutableArray *filters;

@end
