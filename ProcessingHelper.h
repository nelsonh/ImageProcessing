//
//  ProcessingHelper.h
//  ImageProcessing
//
//  Created by Nelson on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ProcessingHelper : NSObject {
    
}

+(id)grayScale:(UIImage*)inImage;
+(CGContextRef)createRGBABitmapContext:(CGImageRef)cgImage;

@end
