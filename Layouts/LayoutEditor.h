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
@property (nonatomic, strong) NSMutableArray *metadataArray;
-(void)unpackLayout:(struct metadata_layout)metadata;

@end
