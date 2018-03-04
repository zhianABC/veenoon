//
//  YaXianQi_UIView.m
//  veenoon
//
//  Created by 安志良 on 2018/2/25.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "ZengYi_UIView.h"
#import "UIButton+Color.h"
#import "SlideButton.h"

@interface ZengYi_UIView() {
    
    UIButton *channelBtn;
    
    UIView   *contentView;
}
@property (nonatomic, strong) NSMutableArray *_channelBtns;

@end


@implementation ZengYi_UIView
@synthesize _channelBtns;
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        channelBtn = [UIButton buttonWithColor:RGB(0, 89, 118) selColor:nil];
        channelBtn.frame = CGRectMake(0, 50, 70, 36);
        channelBtn.clipsToBounds = YES;
        channelBtn.layer.cornerRadius = 5;
        channelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [channelBtn setTitle:@"In 1" forState:UIControlStateNormal];
        [channelBtn setTitleColor:YELLOW_COLOR forState:UIControlStateNormal];
        [self addSubview:channelBtn];
        
        int y = CGRectGetMaxY(channelBtn.frame)+20;
        contentView = [[UIView alloc] initWithFrame:CGRectMake(0, y, frame.size.width, 340)];
        [self addSubview:contentView];
        contentView.layer.cornerRadius = 5;
        contentView.clipsToBounds = YES;
        contentView.backgroundColor = RGB(0, 89, 118);
        
        [self layoutChannelBtns:16];
        [self contentViewComps];
        
        [self createContentViewBtns];
    }
    
    return self;
}

- (void) layoutChannelBtns:(int)num{
    
    self._channelBtns = [NSMutableArray array];
    
    float x = 0;
    int y = CGRectGetHeight(self.frame)-60;
    
    float spx = (CGRectGetWidth(self.frame) - num*50.0)/(num-1);
    if(spx > 10)
        spx = 10;
    for(int i = 0; i < num; i++)
    {
        UIButton *btn = [UIButton buttonWithColor:RGB(0, 89, 118) selColor:nil];
        btn.frame = CGRectMake(x, y, 50, 50);
        btn.clipsToBounds = YES;
        btn.layer.cornerRadius = 5;
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:[NSString stringWithFormat:@"%d", i+1] forState:UIControlStateNormal];
        btn.tag = i;
        [self addSubview:btn];
        
        if(i == 0)
        {
            [btn setTitleColor:YELLOW_COLOR forState:UIControlStateNormal];
            [btn setTitleColor:YELLOW_COLOR forState:UIControlStateHighlighted];
        }
        else
        {
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitleColor:YELLOW_COLOR forState:UIControlStateHighlighted];
        }
        
        [btn addTarget:self
                action:@selector(channelBtnAction:)
      forControlEvents:UIControlEventTouchUpInside];
        
        x+=50;
        x+=spx;
        
        [_channelBtns addObject:btn];
        
        
        UILongPressGestureRecognizer *longPress0 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed0:)];
        [btn addGestureRecognizer:longPress0];
        
    }
    
}

- (void) longPressed0:(UILongPressGestureRecognizer*)sender{
    
    UIView* view = sender.view;
    
    if([view isKindOfClass:[UIButton class]])
    {
        [self becomeFirstResponder];
        CGRect rect = [self convertRect:view.frame fromView:view.superview];
        
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        //初始化menu
        [menu setMenuItems:[self getLongTouchMessageCellMenuList]];
        [menu setTargetRect:rect inView:self];
        [menu setMenuVisible:YES animated:YES];

    }
    
}

- (NSArray<UIMenuItem *> *)getLongTouchMessageCellMenuList {
    UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"复制"
                                                      action:@selector(onCopyData:)];
    UIMenuItem *pasteItem =
    [[UIMenuItem alloc] initWithTitle:@"粘贴"
                               action:@selector(onPasteData:)];
    
    UIMenuItem *deleteItem =
    [[UIMenuItem alloc] initWithTitle:@"复位"
                               action:@selector(onClearData:)];
    
    
    
    return [NSArray arrayWithObjects:copyItem,pasteItem,deleteItem, nil];
}

// 用于UIMenuController显示，缺一不可
-(BOOL)canBecomeFirstResponder{

    return YES;
    
}
// 用于UIMenuController显示，缺一不可
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    
    //NSLog(@"%@", action);
    
    if (action ==@selector(onCopyData:)
        || action ==@selector(onPasteData:)
        || action ==@selector(onClearData:)){
        
        return YES;
        
    }
    
    return NO;//隐藏系统默认的菜单项
}

- (void) onCopyData:(id)sender{
}
- (void) onPasteData:(id)sender{
}
- (void) onClearData:(id)sender{
}

- (void) channelBtnAction:(UIButton*)sender{
    
    int tag = (int)sender.tag+1;
    [channelBtn setTitle:[NSString stringWithFormat:@"In %d", tag] forState:UIControlStateNormal];
    
    for(UIButton * btn in _channelBtns)
    {
        if(btn == sender)
        {
            [btn setTitleColor:YELLOW_COLOR forState:UIControlStateNormal];
        }
        else
        {
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}

- (void) contentViewComps{
    
    UILabel *addLabel = [[UILabel alloc] init];
    addLabel.text = @"增益 (db)";
    addLabel.font = [UIFont systemFontOfSize: 13];
    addLabel.textColor = [UIColor whiteColor];
    addLabel.frame = CGRectMake(730, 120, 120, 20);
    [contentView addSubview:addLabel];
    
    SlideButton *btn = [[SlideButton alloc] initWithFrame:CGRectMake(700, 135, 120, 120)];
    [contentView addSubview:btn];
    
}

- (void) createContentViewBtns {
    int btnStartX = 100;
    int btnY = 150;
    
    UIButton *lineBtn = [UIButton buttonWithColor:RGB(75, 163, 202) selColor:nil];
    lineBtn.frame = CGRectMake(btnStartX, btnY, 120, 30);
    lineBtn.layer.cornerRadius = 5;
    lineBtn.layer.borderWidth = 2;
    lineBtn.layer.borderColor = [UIColor clearColor].CGColor;;
    lineBtn.clipsToBounds = YES;
    [lineBtn setTitle:@"  线路" forState:UIControlStateNormal];
    lineBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    lineBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImageView *icon = [[UIImageView alloc]
                         initWithFrame:CGRectMake(lineBtn.frame.size.width - 20, 10, 10, 10)];
    icon.image = [UIImage imageNamed:@"remote_video_down.png"];
    [lineBtn addSubview:icon];
    icon.alpha = 0.8;
    icon.layer.contentsGravity = kCAGravityResizeAspect;
    [lineBtn addTarget:self
                  action:@selector(lineBtnAction:)
        forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:lineBtn];
    
    
    UIButton *muteBtn = [UIButton buttonWithColor:RGB(75, 163, 202) selColor:nil];
    muteBtn.frame = CGRectMake(CGRectGetMaxX(lineBtn.frame)+10, btnY, 50, 30);
    muteBtn.layer.cornerRadius = 5;
    muteBtn.layer.borderWidth = 2;
    muteBtn.layer.borderColor = [UIColor clearColor].CGColor;;
    muteBtn.clipsToBounds = YES;
    [muteBtn setTitle:@"静音" forState:UIControlStateNormal];
    muteBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [muteBtn addTarget:self
                action:@selector(muteBtnAction:)
      forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:muteBtn];
    
    
    UIButton *zerodbBtn = [UIButton buttonWithColor:RGB(75, 163, 202) selColor:nil];
    zerodbBtn.frame = CGRectMake(CGRectGetMaxX(muteBtn.frame)+20, btnY, 120, 30);
    zerodbBtn.layer.cornerRadius = 5;
    zerodbBtn.layer.borderWidth = 2;
    zerodbBtn.layer.borderColor = [UIColor clearColor].CGColor;;
    zerodbBtn.clipsToBounds = YES;
    [zerodbBtn setTitle:@"  0db" forState:UIControlStateNormal];
    zerodbBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    zerodbBtn.alpha = 0.8;
    zerodbBtn.enabled = NO;
    zerodbBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImageView *icon2 = [[UIImageView alloc]
                         initWithFrame:CGRectMake(zerodbBtn.frame.size.width - 20, 10, 10, 10)];
    icon2.image = [UIImage imageNamed:@"remote_video_down.png"];
    [zerodbBtn addSubview:icon2];
    icon2.alpha = 0.8;
    icon2.layer.contentsGravity = kCAGravityResizeAspect;
    [contentView addSubview:zerodbBtn];
    
    UIButton *foureivBtn = [UIButton buttonWithColor:RGB(75, 163, 202) selColor:nil];
    foureivBtn.frame = CGRectMake(CGRectGetMaxX(zerodbBtn.frame)+10, btnY, 50, 30);
    foureivBtn.layer.cornerRadius = 5;
    foureivBtn.layer.borderWidth = 2;
    foureivBtn.layer.borderColor = [UIColor clearColor].CGColor;;
    foureivBtn.clipsToBounds = YES;
    [foureivBtn setTitle:@"  48V" forState:UIControlStateNormal];
    foureivBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    foureivBtn.alpha = 0.8;
    foureivBtn.enabled = NO;
    foureivBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [contentView addSubview:foureivBtn];
    
    
    UIButton *bianzuBtn = [UIButton buttonWithColor:RGB(75, 163, 202) selColor:nil];
    bianzuBtn.frame = CGRectMake(CGRectGetMaxX(foureivBtn.frame)+20, btnY, 120, 30);
    bianzuBtn.layer.cornerRadius = 5;
    bianzuBtn.layer.borderWidth = 2;
    bianzuBtn.layer.borderColor = [UIColor clearColor].CGColor;;
    bianzuBtn.clipsToBounds = YES;
    [bianzuBtn setTitle:@"  编组" forState:UIControlStateNormal];
    bianzuBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    bianzuBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImageView *icon3 = [[UIImageView alloc]
                         initWithFrame:CGRectMake(bianzuBtn.frame.size.width - 20, 10, 10, 10)];
    icon3.image = [UIImage imageNamed:@"remote_video_down.png"];
    [bianzuBtn addSubview:icon3];
    icon3.alpha = 0.8;
    icon3.layer.contentsGravity = kCAGravityResizeAspect;
    [bianzuBtn addTarget:self
                action:@selector(bianzuAction:)
      forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:bianzuBtn];
    
    
    UIButton *fanxiangBtn = [UIButton buttonWithColor:RGB(75, 163, 202) selColor:nil];
    fanxiangBtn.frame = CGRectMake(CGRectGetMaxX(bianzuBtn.frame)+10, btnY, 50, 30);
    fanxiangBtn.layer.cornerRadius = 5;
    fanxiangBtn.layer.borderWidth = 2;
    fanxiangBtn.layer.borderColor = [UIColor clearColor].CGColor;;
    fanxiangBtn.clipsToBounds = YES;
    [fanxiangBtn setTitle:@"反相" forState:UIControlStateNormal];
    fanxiangBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [fanxiangBtn addTarget:self
                action:@selector(fanxiangAction:)
      forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:fanxiangBtn];
}
-(void) fanxiangAction:(id) sender {
    
}
-(void) bianzuAction:(id) sender {
    
}
-(void) lineBtnAction:(id) sender {
    
}

-(void) muteBtnAction:(id) sender {
    
}

@end

