//
//  AdjustableUILabel.m
//  Layouts
//
//  Created by Conor Dowling on 8/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AdjustableUILabel.h"

@implementation AdjustableUILabel

@synthesize characterSpacing;
@synthesize verticalAlignment = verticalAlignment_;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentMiddleAdjustable;
    }
    return self;
}

- (void)setVerticalAlignment:(VerticalAlignmentAdjustable)verticalAlignment {
    verticalAlignment_ = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTopAdjustable:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottomAdjustable:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddleAdjustable:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

- (void)drawTextInRect:(CGRect)requestedRect
{    
    CGRect rect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    if (characterSpacing)
    {
        // Drawing code
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGFloat size = self.font.pointSize;
        
        CGContextSelectFont (context, [self.font.fontName UTF8String], size, kCGEncodingMacRoman);
        CGContextSetCharacterSpacing (context, characterSpacing);
        CGContextSetTextDrawingMode (context, kCGTextFill);
        
        // Rotate text to not be upside down
        CGAffineTransform xform = CGAffineTransformMake(1.0, 0.0, 0.0, -1.0, 0.0, 0.0);
        CGContextSetTextMatrix(context, xform);
        const char *cStr = [self.text UTF8String];
        CGContextShowTextAtPoint (context, rect.origin.x, rect.origin.y + size, cStr, strlen(cStr));
    }
    else
    {
        // no character spacing provided so do normal drawing
        [super drawTextInRect:rect];
    }
}

@end