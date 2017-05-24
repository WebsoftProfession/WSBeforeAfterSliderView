//
//  BeforeView.m
//  BeforeAfterSliderView
//
//  Created by LK on 23/05/2017.
//  Copyright © 2017 WebsoftProfession. All rights reserved.
//

#import "WSBeforeAfterSlider.h"

@implementation WSBeforeAfterSlider
{
    UIView *slider;
    BOOL isSliderTap;
    BOOL isDragMode;
    CGFloat scale;
}

@synthesize beforeImage;
@synthesize afterImage;

- (void)drawRect:(CGRect)rect {
    [beforeImage drawInRect:rect];
    if (!slider) {
        scale = afterImage.size.width/rect.size.width;
        isSliderTap = false;
        isDragMode = false;
        slider = [[UIView alloc] initWithFrame:CGRectMake((rect.size.width/2)-4, self.bounds.origin.y, 8, rect.size.height)];
        slider.backgroundColor = [UIColor colorWithRed:255.0f/255 green:255.0f/255 blue:255.0f/255 alpha:0.5];
        [self addSubview:slider];
        [[self getImageForRect:CGRectMake(0, 0, slider.frame.origin.x*scale, afterImage.size.height)] drawInRect:CGRectMake(0, slider.frame.origin.y, slider.frame.origin.x, slider.frame.size.height)];
    }
    
    if (isDragMode) {
        [[self getImageForRect:CGRectMake(0, 0, slider.frame.origin.x*scale, afterImage.size.height)] drawInRect:CGRectMake(0, slider.frame.origin.y, slider.frame.origin.x, slider.frame.size.height)];
    }
    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(slider.frame, touchPoint)) {
        isSliderTap = true;
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (isSliderTap) {
        isDragMode = true;
        UITouch *touch = [[touches allObjects] objectAtIndex:0];
        CGPoint touchPoint = [touch locationInView:self];
        if (touchPoint.x>self.bounds.origin.x-4 && touchPoint.x<self.frame.size.width-4) {
            slider.frame= CGRectMake(touchPoint.x, slider.frame.origin.y, 8, slider.frame.size.height);
            [self setNeedsDisplay];
        }
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    isDragMode = false;
    isSliderTap = false;
}

-(UIImage *)getImageForRect:(CGRect)rect{
    CGImageRef imageRef = CGImageCreateWithImageInRect([afterImage CGImage], rect);
    // or use the UIImage wherever you like
    UIImage *img = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return img;
}

@end
