//
//  ImageProcessingAppDelegate.h
//  ImageProcessing
//
//  Created by Nelson on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageProcessingViewController;

@interface ImageProcessingAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ImageProcessingViewController *viewController;

@end
