//
//  ProcessingHelper.m
//  ImageProcessing
//
//  Created by Nelson on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ProcessingHelper.h"


@implementation ProcessingHelper

+(id)grayScale:(UIImage*)inImage
{
    //retrieve CGImage
    CGImageRef imageRef=[inImage CGImage];
    
    //create RGBA bitmap context
    CGContextRef bitmapContext=[self createRGBABitmapContext:imageRef];
    
    if(bitmapContext==NULL)
    {
        NSLog(@"create RGBA bitmap fail");
        return  nil;
    }
    
    size_t imageWidth=CGImageGetWidth(imageRef);
    size_t imageHeight=CGImageGetHeight(imageRef);
    CGRect drawingRect=CGRectMake(0, 0, imageWidth, imageHeight);
    
    //draw image context this will fill the context memory
    CGContextDrawImage(bitmapContext, drawingRect, imageRef);
    
    //get image data form context
    UInt8 *rawData=CGBitmapContextGetData(bitmapContext);
    
    
    //deal with raw data
    for(int i=0; i<(imageWidth*imageHeight)*4; i+=4)
    {
        /*
        NSLog(@"r:%i", rawData[i]);
        NSLog(@"g:%i", rawData[i+1]);
        NSLog(@"b:%i", rawData[i+2]);
        NSLog(@"a:%i", rawData[i+3]);
        NSLog(@"\n");
        */
       
        
        int outComponent=(rawData[i]+rawData[i+1]+rawData[i+2])/4;
        
        rawData[i]=outComponent;
        rawData[i+1]=outComponent;
        rawData[i+2]=outComponent;
        
        
        //rawData[i]=abs(rawData[i]-255);
        //rawData[i+1]=abs(rawData[i+1]-255);
        //rawData[i+2]=abs(rawData[i+2]-255);
        
    }
    
    CGImageRef outImage=CGBitmapContextCreateImage(bitmapContext);
    UIImage *image=[UIImage imageWithCGImage:outImage];
    
    //release
    CGContextRelease(bitmapContext);
    free(rawData);
    
    return image;
}

+(CGContextRef)createRGBABitmapContext:(CGImageRef)cgImage
{
    /**
     create bitmap context without fill image data and return 
     **/
    
    CGContextRef ctx;
    void *bitmapData;
    size_t bitmapWidth;
    size_t bitmapHeight;
    size_t bitsPerComponent;
    size_t bytePerRow;
    CGColorSpaceRef colorSpaces;
    
    //get bitmap width height
    bitmapWidth=CGImageGetWidth(cgImage);
    bitmapHeight=CGImageGetHeight(cgImage);
    
    //fill data for byte and bit
    bytePerRow=(bitmapWidth*4);
    bitsPerComponent=8;
    
    //fill data for color space
    colorSpaces=CGColorSpaceCreateDeviceRGB();
    
    if(colorSpaces==NULL)
    {
        NSLog(@"create color space fail");
        return NULL;
    }
    
    //allocate mem for bitmap context
    bitmapData=malloc(bitmapWidth*bitmapHeight*4);
    
    if(bitmapData==NULL)
    {
        CGColorSpaceRelease(colorSpaces);
        
        NSLog(@"can not allocate memory for bitmap context");
        return NULL;
    }
    
    //create bitmap context
    ctx=CGBitmapContextCreate(bitmapData, bitmapWidth, bitmapHeight, bitsPerComponent, bytePerRow, colorSpaces, kCGImageAlphaPremultipliedLast);
    
    if(ctx==NULL)
    {
        CGColorSpaceRelease(colorSpaces);
        free(bitmapData);
        
        NSLog(@"can not create bitmap context");
        return NULL;
        
    }
    
    //release color space
    CGColorSpaceRelease(colorSpaces);
    
    return ctx;
    
}

@end
