//
//  AdjustableUILabel.h
//  Layouts
//
//  Created by Conor Dowling on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum VerticalAlignment {
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface AdjustableUILabel : UILabel {
    @private VerticalAlignment verticalAlignment_;
    CGFloat characterSpacing;
}

@property CGFloat characterSpacing;
@property (nonatomic, assign) VerticalAlignment verticalAlignment;

@end
