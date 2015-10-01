//
//  CustomLabel.m
//  LabelTest
//
//  Created by Andrei Zaharia on 10/1/15.
//  Copyright © 2015 Andrei Zaharia. All rights reserved.
//

#import "CustomLabel.h"

@interface CustomLabel ()
{
    double animationStartTime;
    double animationDuration;
    
    CGRect _initialFrame;
    CGRect _destinationFrame;
}

@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation CustomLabel


-(void) setAnimatedFrame:(CGRect)frame withDuration: (CGFloat) duration
{
    if (self.displayLink) {
        [self.displayLink invalidate];
    }
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector: @selector(animateFrame:)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode: NSDefaultRunLoopMode];
 
    animationDuration = duration;
    animationStartTime = CACurrentMediaTime();
    
    _initialFrame = self.frame;
    _destinationFrame = frame;
}

-(void) animateFrame: (CADisplayLink *) sender
{
    double currentTime = CACurrentMediaTime();
    double renderTime = currentTime - animationStartTime;
    
    if (renderTime < animationDuration) {
        double progress = renderTime / animationDuration;
        
        CGRect newFrame = CGRectMake(_initialFrame.origin.x + progress * (_destinationFrame.origin.x - _initialFrame.origin.x),
                                     _initialFrame.origin.y + progress * (_destinationFrame.origin.y - _initialFrame.origin.y),
                                     _initialFrame.size.width + progress * (_destinationFrame.size.width - _initialFrame.size.width),
                                     _initialFrame.size.height + progress * (_destinationFrame.size.height - _initialFrame.size.height));
        [self setFrame: newFrame];
    } else {
        [self.displayLink invalidate];
    }
}

@end
