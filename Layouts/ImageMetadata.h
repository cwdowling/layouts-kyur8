//
//  ImageMetadata.h
//  Layouts
//
//  Created by Conor Dowling on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageMetadata : NSObject {
    int xOffset;
    int yOffset;
    float zoomLevel;
    NSString *url;
}

@end
