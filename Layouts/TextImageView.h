//
//  TextImageView.h
//  Layouts
//
//  Created by Conor Dowling on 8/28/12.
//
//

#import <UIKit/UIKit.h>
#import "TextImage.h"

@interface TextImageView : UIImageView

@property(nonatomic, strong) NSArray *images;
- (id)initWithFrame:(CGRect)frame Image:(TextImage *)image;
- (id)initWithFrame:(CGRect)frame Images:(NSArray *)array;

@end
