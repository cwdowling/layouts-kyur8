//
//  AdjustableUILabel.h
//  Layouts
//
//  Created by Conor Dowling on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum VerticalAlignmentAdjustable {
    VerticalAlignmentTopAdjustable,
    VerticalAlignmentMiddleAdjustable,
    VerticalAlignmentBottomAdjustable,
} VerticalAlignmentAdjustable;

@interface AdjustableUILabel : UILabel {
    @private VerticalAlignmentAdjustable verticalAlignment_;
    CGFloat characterSpacing;
}

@property CGFloat characterSpacing;
@property (nonatomic, assign) VerticalAlignmentAdjustable verticalAlignment;

@end
