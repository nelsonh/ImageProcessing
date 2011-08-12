//
//  ImageProcessingViewController.h
//  ImageProcessing
//
//  Created by Nelson on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageProcessingViewController : UIViewController {
    
    IBOutlet UIImageView *ImageContainer;
}

- (IBAction)ProcessImage:(id)sender;
- (IBAction)reset:(id)sender;

@end
