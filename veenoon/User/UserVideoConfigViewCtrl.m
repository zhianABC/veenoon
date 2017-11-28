//
//  UserVideoConfigViewCtrl.m
//  veenoon
//
//  Created by 安志良 on 2017/11/28.
//  Copyright © 2017年 jack. All rights reserved.
//

#import "UserVideoConfigViewCtrl.h"
#import "CustomPickerView.h"

@interface UserVideoConfigViewCtrl () {
    UIImageView *_dvdPlayerView;
    UIImageView *_diskPlayerView;
    UIImageView *_desktopPlayerView;
    UIImageView *_desktopPlayerView2;
    UIImageView *_remotePlayerView;
    UIImageView *_cameraPlayerView1;
    UIImageView *_cameraPlayerView2;
    UIImageView *_cameraPlayerView3;
    
    
    UIImageView *_pinjiepingView;
    UIImageView *_touyingjiView;
    UIImageView *_yejingdianshiView;
    UIImageView *_yejingdianshiView2;
    UIImageView *_lubojiView;
    UIImageView *_yuanchengView;
}
@end

@implementation UserVideoConfigViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(63, 58, 55);
    
    UIImageView *titleIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_view_title.png"]];
    [self.view addSubview:titleIcon];
    titleIcon.frame = CGRectMake(70, 30, 70, 10);
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 59, SCREEN_WIDTH, 1)];
    line.backgroundColor = RGB(83, 78, 75);
    [self.view addSubview:line];
    
    UIImageView *bottomBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-60, SCREEN_WIDTH, 60)];
    [self.view addSubview:bottomBar];
    
    //缺切图，把切图贴上即可。
    bottomBar.backgroundColor = [UIColor grayColor];
    bottomBar.userInteractionEnabled = YES;
    bottomBar.image = [UIImage imageNamed:@"user_botom_Line.png"];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(10, 0,160, 60);
    [bottomBar addSubview:cancelBtn];
    [cancelBtn setTitle:@"返回" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn setTitleColor:RGB(255, 180, 0) forState:UIControlStateHighlighted];
    cancelBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [cancelBtn addTarget:self
                  action:@selector(cancelAction:)
        forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    okBtn.frame = CGRectMake(SCREEN_WIDTH-10-160, 0,160, 60);
    [bottomBar addSubview:okBtn];
    [okBtn setTitle:@"确认" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okBtn setTitleColor:RGB(255, 180, 0) forState:UIControlStateHighlighted];
    okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [okBtn addTarget:self
              action:@selector(okAction:)
    forControlEvents:UIControlEventTouchUpInside];
    
    int leftANdRight = 100;
    int rowGap = 50;
    int imageViewHeight = 100;
    
    int imageViewWidth = (SCREEN_WIDTH - leftANdRight*2 - rowGap*7)/8;
    int firstImageViewHeight = SCREEN_HEIGHT - 600;
    
    
}

- (void) okAction:(id)sender{
    
}

- (void) cancelAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
