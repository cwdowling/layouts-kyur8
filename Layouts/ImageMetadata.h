//
//  ImageMetadata.h
//  Layouts
//
//  Created by Conor Dowling on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageMetadata : NSObject

@property (nonatomic) CGPoint offset;
@property (nonatomic) float zoomLevel;
@property (nonatomic, strong) NSString *url;

@end
