//
//  ImageProcessingViewController.m
//  ImageProcessing
//
//  Created by Nelson on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageProcessingViewController.h"
#import "ProcessingHelper.h"

@implementation ImageProcessingViewController

- (void)dealloc
{
    [ImageContainer release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [ImageContainer release];
    ImageContainer = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)ProcessImage:(id)sender {
    
    if(ImageContainer)
    {
       UIImage *image=[ProcessingHelper grayScale:ImageContainer.image];
        
        if(image)
        {
            [ImageContainer setImage:image];
        }
    }
}

- (IBAction)reset:(id)sender {
    
    if(ImageContainer)
    {
        [ImageContainer setImage:[UIImage imageNamed:@"image.png"]];
    }
}

@end
