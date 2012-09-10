//
//  TextImageView.m
//  Layouts
//
//  Created by Conor Dowling on 8/28/12.
//
//

#import "TextImageView.h"

@implementation TextImageView

- (id)initWithFrame:(CGRect)frame Images:(NSArray *)array
{
    self = [super initWithFrame:frame];
    self.images = array;
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame Image:(TextImage *)image
{
    self = [super initWithFrame:frame];
    self.images = [[NSArray alloc] initWithObjects:image, nil ];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"trying");
    NSLog(@"number of pictures %d",[self.images count]);
    for(TextImage *image in self.images) {
        NSLog(@"going");
        UIGraphicsGetCurrentContext();
        [image.image drawInRect:CGRectMake(self.frame.origin.x, self.frame.origin.y, image.image.size.width, image.image.size.height) blendMode:(image.blendMode) alpha:image.alpha];
    }
}

@end
