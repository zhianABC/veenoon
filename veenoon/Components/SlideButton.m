//
//  SlideButton.m
//  veenoon
//
//  Created by chen jack on 2017/12/17.
//  Copyright © 2017年 jack. All rights reserved.
//

#import "SlideButton.h"
#import "CircleProgressView.h"

@interface SlideButton ()
{
    UIImageView *_radioImgV;
    CircleProgressView *progress;
    
    CGPoint _beginPoint;
    
    float _vheight;
}
@end

@implementation SlideButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id) initWithFrame:(CGRect)frame
{
    
    if(self = [super initWithFrame:frame])
    {
        _radioImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slide_btn.png"]];
        [self addSubview:_radioImgV];
        _radioImgV.center = CGPointMake(CGRectGetWidth(frame)/2, CGRectGetHeight(frame)/2);
     
        
        progress = [[CircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 57, 57)];
        [self addSubview:progress];
        [progress setProgressBolder:4];
        
        progress._isShowingPoint = YES;
        [progress setProgress:0.1];
        progress.center = CGPointMake(CGRectGetWidth(frame)/2, 52);
        
        _vheight = frame.size.height;
        
    }
    
    return self;
}

- (void) changeButtonBackgroundImage:(UIImage *)image{
    
    _radioImgV.image = image;
}

- (void) setCircleValue:(float) value{
    
    [progress setProgress:value];
}


-(void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    
    CGPoint p = [[touches anyObject] locationInView:self];
    
    _beginPoint = p;
    
}

-(void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    
    NSSet *allTouches = [event allTouches];
    switch ([allTouches count])
    {
        case 1:
        {
            UITouch* touch = [touches anyObject];
            CGPoint previous = _beginPoint;
            CGPoint current = [touch locationInView:self];
            float pan = previous.y - current.y;
            float step = pan/_vheight;
            
            [progress stepProgress:step];
        }
            break;
    }
    
}

-(void) touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    
    [progress syncCurrentStepedValue];
    
}


@end