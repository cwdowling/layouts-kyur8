//
//  Preview.m
//  Layouts
//
//  Created by Conor Dowling on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Preview.h"
#import "Filters.h"
#import <QuartzCore/QuartzCore.h>

@interface Preview()

@property (nonatomic, weak) Filters *filter;
@end

@implementation Preview

@synthesize pictureFrame = _pictureFrame;
@synthesize picture = _picture;
@synthesize filter = _filter;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{ 
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    NSMutableArray *fontNames = [[NSMutableArray alloc] init];
    NSArray *fontFamilyNames = [UIFont familyNames];
    for(NSString *familyName in fontFamilyNames) {
        NSLog(@"font family name = %@", familyName);
        NSArray *names = [UIFont fontNamesForFamilyName:familyName];
        NSLog(@"Font Names = %@",fontNames);
        [fontNames addObjectsFromArray:names];
    }
    [super viewDidLoad];  
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    self.navigationController.navigationBar.hidden = YES;
    Filters *filter = [[Filters alloc] init];
    [self.pictureFrame setImage:[filter Labels:self.picture Text:@"Accidental Chinese Pandas" End:YES]];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
