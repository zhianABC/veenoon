//
//  CircleProgressView.m
//  test
//
//  Created by jack on 06/11/13.
//  Copyright (c) 2013 jack. All rights reserved.
//

#import "CircleProgressView.h"
#import <QuartzCore/QuartzCore.h>


@interface CircleProgressView ()
{
    float _startAngle;
    
    float _totalAngel;
}
@property (strong, nonatomic) UIColor *backColor;
@property (strong, nonatomic) UIColor *progressColor;
@property (assign, nonatomic) CGFloat lineWidth;
@property (assign, nonatomic) CGFloat currentProgress;


@end

@implementation CircleProgressView


#define SPEED_30 0.05

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
        self.backgroundColor =[UIColor clearColor];
       
        _progress = 0;
        self.currentProgress = 0;
         
        self.backColor = RGB(46, 105, 106);
        self.progressColor = RGB(242, 148, 20);
        self.lineWidth = 10;
        
        pL = [[UILabel alloc] initWithFrame:self.bounds];
        pL.backgroundColor = [UIColor clearColor];
        pL.font = [UIFont boldSystemFontOfSize:15];
        pL.textColor = RGB(242, 148, 20);
        pL.textAlignment = NSTextAlignmentCenter;
        [self addSubview:pL];
        
        _startAngle = - M_PI - M_PI/6.0;
        _totalAngel = 2*M_PI - M_PI_2 - M_PI/6.0;
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{
    //draw background circle
    UIBezierPath *backCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2)
                                                              radius:self.bounds.size.width / 2 - self.lineWidth / 2
                                                          startAngle:_startAngle
                                                            endAngle:_startAngle+_totalAngel
                                                           clockwise:YES];
    [self.backColor setStroke];
    backCircle.lineWidth = self.lineWidth;
    [backCircle stroke];
    
    if (self.currentProgress != 0) {
        //draw progress circle
        UIBezierPath *progressCircle = [UIBezierPath bezierPathWithArcCenter:
                                        CGPointMake(self.bounds.size.width / 2,self.bounds.size.height / 2)
                                                                      radius:self.bounds.size.width / 2 - self.lineWidth / 2
                                                                  startAngle:_startAngle
                                                                    endAngle:(CGFloat)(_startAngle + self.currentProgress * _totalAngel)
                                                                   clockwise:YES];
        [self.progressColor setStroke];
        progressCircle.lineWidth = self.lineWidth;
        [progressCircle stroke];
    }
}



- (void) setProgress:(float)progress{
    
    _progress = progress;
    
    pL.text = [NSString stringWithFormat:@"%d%%",(int)(_progress*100)];
    
    self.currentProgress = _progress;
    [self setNeedsDisplay];
    
}

- (void) updateOffest:(float)offset{
    
    _progress = offset;
    
    self.currentProgress = _progress;
    [self setNeedsDisplay];
}

- (void) smallRefreshMode{
    self.lineWidth = 1;
    self.backColor = [UIColor clearColor];
    
}

- (void) dealloc
{

    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
