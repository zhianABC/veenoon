//
//  EngineerPortDNSViewCtrl.m
//  veenoon
//
//  Created by 安志良 on 2017/12/4.
//  Copyright © 2017年 jack. All rights reserved.
//

#import "EngineerEnvDevicePluginViewCtrl.h"
#import "CustomPickerView.h"

@interface EngineerEnvDevicePluginViewCtrl () {
    UIButton *_zhaomingBtn;
    UIButton *_kongtiaoBtn;
    UIButton *_diandongmadaBtn;
    UIButton *_xinfengBtn;
    UIButton *_dinuanBtn;
    UIButton *_kongqijinghuaBtn;
    UIButton *_jingshuiBtn;
    UIButton *_jiashiqiBtn;
    UIButton *_menjinBtn;
    UIButton *_jiankongBtn;
    UIButton *_nenghaotongjiBtn;
    
    UIButton *_confirmButton;
    
    CustomPickerView *_productTypePikcer;
    CustomPickerView *_brandPicker;
    CustomPickerView *_productCategoryPicker;
    CustomPickerView *_numberPicker;
}
@end

@implementation EngineerEnvDevicePluginViewCtrl
@synthesize _meetingRoomDic;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *titleIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_view_title.png"]];
    [self.view addSubview:titleIcon];
    titleIcon.frame = CGRectMake(70, 30, 70, 10);
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 59, SCREEN_WIDTH, 1)];
    line.backgroundColor = RGB(75, 163, 202);
    [self.view addSubview:line];
    
    int startX=80;
    int startY = 120;
    
    UILabel *portDNSLabel = [[UILabel alloc] initWithFrame:CGRectMake(startX, startY, SCREEN_WIDTH-80, 30)];
    portDNSLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:portDNSLabel];
    portDNSLabel.font = [UIFont boldSystemFontOfSize:20];
    portDNSLabel.textColor  = [UIColor whiteColor];
    portDNSLabel.text = @"请配置您的环境管理系统";
    
    portDNSLabel = [[UILabel alloc] initWithFrame:CGRectMake(startX, CGRectGetMaxY(portDNSLabel.frame)+15, SCREEN_WIDTH-80, 20)];
    portDNSLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:portDNSLabel];
    portDNSLabel.font = [UIFont systemFontOfSize:16];
    portDNSLabel.textColor  = [UIColor colorWithWhite:1.0 alpha:0.9];
    portDNSLabel.text = @"选择您所需要设置的设备类型> 品牌 > 型号> 数量";
    
    UIImageView *bottomBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-60, SCREEN_WIDTH, 60)];
    [self.view addSubview:bottomBar];
    
    //缺切图，把切图贴上即可。
    bottomBar.backgroundColor = [UIColor grayColor];
    bottomBar.userInteractionEnabled = YES;
    bottomBar.image = [UIImage imageNamed:@"botomo_icon.png"];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(10, 0,160, 60);
    [bottomBar addSubview:cancelBtn];
    [cancelBtn setTitle:@"< 上一步" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelBtn setTitleColor:RGB(255, 180, 0) forState:UIControlStateHighlighted];
    cancelBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [cancelBtn addTarget:self
                  action:@selector(cancelAction:)
        forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    okBtn.frame = CGRectMake(SCREEN_WIDTH-10-160, 0,160, 60);
    [bottomBar addSubview:okBtn];
    [okBtn setTitle:@"完成配置" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okBtn setTitleColor:RGB(255, 180, 0) forState:UIControlStateHighlighted];
    okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [okBtn addTarget:self
              action:@selector(okAction:)
    forControlEvents:UIControlEventTouchUpInside];
    
    int left = 210;
    int rowGap = (SCREEN_WIDTH - left * 2)/5;
    int height = 250;
    _zhaomingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _zhaomingBtn.frame = CGRectMake(left, height, 80, 132);
    [_zhaomingBtn setImage:[UIImage imageNamed:@"engineer_env_zhaoming_n.png"] forState:UIControlStateNormal];
    [_zhaomingBtn setImage:[UIImage imageNamed:@"engineer_env_zhaoming_s.png"] forState:UIControlStateHighlighted];
    [_zhaomingBtn setTitle:@"照明" forState:UIControlStateNormal];
    [_zhaomingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_zhaomingBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _zhaomingBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_zhaomingBtn setTitleEdgeInsets:UIEdgeInsetsMake(_zhaomingBtn.imageView.frame.size.height+3,-80,-18,-20)];
    [_zhaomingBtn setImageEdgeInsets:UIEdgeInsetsMake(-10.0,0.0,_zhaomingBtn.titleLabel.bounds.size.height, 0)];
    [_zhaomingBtn addTarget:self action:@selector(zhaomingAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_zhaomingBtn];
    
    
    _kongtiaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _kongtiaoBtn.frame = CGRectMake(left+rowGap, height, 80, 132);
    [_kongtiaoBtn setImage:[UIImage imageNamed:@"engineer_env_kongtiao_n.png"] forState:UIControlStateNormal];
    [_kongtiaoBtn setImage:[UIImage imageNamed:@"engineer_env_kongtiao_s.png"] forState:UIControlStateHighlighted];
    [_kongtiaoBtn setTitle:@"空调" forState:UIControlStateNormal];
    [_kongtiaoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_kongtiaoBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _kongtiaoBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_kongtiaoBtn setTitleEdgeInsets:UIEdgeInsetsMake(_kongtiaoBtn.imageView.frame.size.height+10,-90,-20,-10)];
    [_kongtiaoBtn setImageEdgeInsets:UIEdgeInsetsMake(-10.0,0.0,_kongtiaoBtn.titleLabel.bounds.size.height, 0)];
    [_kongtiaoBtn addTarget:self action:@selector(kongtiaoAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_kongtiaoBtn];
    
    _diandongmadaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _diandongmadaBtn.frame = CGRectMake(left+rowGap*2, height, 80, 132);
    [_diandongmadaBtn setImage:[UIImage imageNamed:@"engineer_env_diandongmada_n.png"] forState:UIControlStateNormal];
    [_diandongmadaBtn setImage:[UIImage imageNamed:@"engineer_env_diandongmada_s.png"] forState:UIControlStateHighlighted];
    [_diandongmadaBtn setTitle:@"电动马达" forState:UIControlStateNormal];
    [_diandongmadaBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_diandongmadaBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _diandongmadaBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_diandongmadaBtn setTitleEdgeInsets:UIEdgeInsetsMake(_diandongmadaBtn.imageView.frame.size.height+10,-85,-20,-35)];
    [_diandongmadaBtn setImageEdgeInsets:UIEdgeInsetsMake(-10,0,_diandongmadaBtn.titleLabel.bounds.size.height, -10)];
    [_diandongmadaBtn addTarget:self action:@selector(diandongmadaAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_diandongmadaBtn];
    
    _xinfengBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _xinfengBtn.frame = CGRectMake(left+rowGap*3, height, 80, 132);
    [_xinfengBtn setImage:[UIImage imageNamed:@"engineer_env_xinfeng_n.png"] forState:UIControlStateNormal];
    [_xinfengBtn setImage:[UIImage imageNamed:@"engineer_env_xinfeng_s.png"] forState:UIControlStateHighlighted];
    [_xinfengBtn setTitle:@"新风" forState:UIControlStateNormal];
    [_xinfengBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_xinfengBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _xinfengBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_xinfengBtn setTitleEdgeInsets:UIEdgeInsetsMake(_xinfengBtn.imageView.frame.size.height+10,-55,-20,-5)];
    [_xinfengBtn setImageEdgeInsets:UIEdgeInsetsMake(-10.0,5.0,_xinfengBtn.titleLabel.bounds.size.height, -5)];
    [_xinfengBtn addTarget:self action:@selector(xinfengAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_xinfengBtn];
    
    _dinuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _dinuanBtn.frame = CGRectMake(left+rowGap*4, height, 80, 132);
    [_dinuanBtn setImage:[UIImage imageNamed:@"engineer_env_dire_n.png"] forState:UIControlStateNormal];
    [_dinuanBtn setImage:[UIImage imageNamed:@"engineer_env_dire_s.png"] forState:UIControlStateHighlighted];
    [_dinuanBtn setTitle:@"地暖" forState:UIControlStateNormal];
    [_dinuanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_dinuanBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _dinuanBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_dinuanBtn setTitleEdgeInsets:UIEdgeInsetsMake(_dinuanBtn.imageView.frame.size.height+10,-90,-20,-10)];
    [_dinuanBtn setImageEdgeInsets:UIEdgeInsetsMake(-10.0,0.0,_dinuanBtn.titleLabel.bounds.size.height, 0)];
    [_dinuanBtn addTarget:self action:@selector(dinuanAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_dinuanBtn];
    
    _kongqijinghuaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _kongqijinghuaBtn.frame = CGRectMake(left+rowGap*5, height, 80, 132);
    [_kongqijinghuaBtn setImage:[UIImage imageNamed:@"engineer_env_kongqijignhua_n.png"] forState:UIControlStateNormal];
    [_kongqijinghuaBtn setImage:[UIImage imageNamed:@"engineer_env_kongqijignhua_s.png"] forState:UIControlStateHighlighted];
    [_kongqijinghuaBtn setTitle:@"空气净化" forState:UIControlStateNormal];
    [_kongqijinghuaBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_kongqijinghuaBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _kongqijinghuaBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_kongqijinghuaBtn setTitleEdgeInsets:UIEdgeInsetsMake(_kongqijinghuaBtn.imageView.frame.size.height+10,-80,-20,-30)];
    [_kongqijinghuaBtn setImageEdgeInsets:UIEdgeInsetsMake(-10.0,0.0,_kongqijinghuaBtn.titleLabel.bounds.size.height, 0)];
    [_kongqijinghuaBtn addTarget:self action:@selector(kongqijinghuaAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_kongqijinghuaBtn];
    
    _jingshuiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _jingshuiBtn.frame = CGRectMake(left, height+132, 80, 132);
    [_jingshuiBtn setImage:[UIImage imageNamed:@"engineer_env_jingshui_n.png"] forState:UIControlStateNormal];
    [_jingshuiBtn setImage:[UIImage imageNamed:@"engineer_env_jingshui_s.png"] forState:UIControlStateHighlighted];
    [_jingshuiBtn setTitle:@"净水" forState:UIControlStateNormal];
    [_jingshuiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_jingshuiBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _jingshuiBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_jingshuiBtn setTitleEdgeInsets:UIEdgeInsetsMake(_jingshuiBtn.imageView.frame.size.height+10,-65,-20,0)];
    [_jingshuiBtn setImageEdgeInsets:UIEdgeInsetsMake(-10.0,0,_jingshuiBtn.titleLabel.bounds.size.height, 0)];
    [_jingshuiBtn addTarget:self action:@selector(jingshuiAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_jingshuiBtn];
    
    _jiashiqiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _jiashiqiBtn.frame = CGRectMake(left+rowGap, height+132, 80, 132);
    [_jiashiqiBtn setImage:[UIImage imageNamed:@"engineer_env_jiashi_n.png"] forState:UIControlStateNormal];
    [_jiashiqiBtn setImage:[UIImage imageNamed:@"engineer_env_jiashi_s.png"] forState:UIControlStateHighlighted];
    [_jiashiqiBtn setTitle:@"加湿器" forState:UIControlStateNormal];
    [_jiashiqiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_jiashiqiBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _jiashiqiBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_jiashiqiBtn setTitleEdgeInsets:UIEdgeInsetsMake(_jiashiqiBtn.imageView.frame.size.height+10,-60,-20,0)];
    [_jiashiqiBtn setImageEdgeInsets:UIEdgeInsetsMake(-10.0,0.0,_jiashiqiBtn.titleLabel.bounds.size.height, 0)];
    [_jiashiqiBtn addTarget:self action:@selector(jiashiAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_jiashiqiBtn];
    
    _menjinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _menjinBtn.frame = CGRectMake(left+rowGap*2, height+132, 80, 132);
    [_menjinBtn setImage:[UIImage imageNamed:@"engineer_env_menjin_n.png"] forState:UIControlStateNormal];
    [_menjinBtn setImage:[UIImage imageNamed:@"engineer_env_menjin_s.png"] forState:UIControlStateHighlighted];
    [_menjinBtn setTitle:@"门禁" forState:UIControlStateNormal];
    [_menjinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_menjinBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _menjinBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_menjinBtn setTitleEdgeInsets:UIEdgeInsetsMake(_menjinBtn.imageView.frame.size.height+10,-60,-20,0)];
    [_menjinBtn setImageEdgeInsets:UIEdgeInsetsMake(-10.0,0,_menjinBtn.titleLabel.bounds.size.height, 0)];
    [_menjinBtn addTarget:self action:@selector(menjinAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_menjinBtn];
    
    _jiankongBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _jiankongBtn.frame = CGRectMake(left+rowGap*3, height+132, 80, 132);
    [_jiankongBtn setImage:[UIImage imageNamed:@"engineer_env_jiankong_n.png"] forState:UIControlStateNormal];
    [_jiankongBtn setImage:[UIImage imageNamed:@"engineer_env_jiankong_s.png"] forState:UIControlStateHighlighted];
    [_jiankongBtn setTitle:@"监控" forState:UIControlStateNormal];
    [_jiankongBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_jiankongBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _jiankongBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_jiankongBtn setTitleEdgeInsets:UIEdgeInsetsMake(_jiankongBtn.imageView.frame.size.height+15,-60,-25,5)];
    [_jiankongBtn setImageEdgeInsets:UIEdgeInsetsMake(-10.0,5.0,_jiankongBtn.titleLabel.bounds.size.height, -5)];
    [_jiankongBtn addTarget:self action:@selector(jiankongAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_jiankongBtn];
    
    _nenghaotongjiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _nenghaotongjiBtn.frame = CGRectMake(left+rowGap*4, height+132, 80, 132);
    [_nenghaotongjiBtn setImage:[UIImage imageNamed:@"engineer_env_nenghao_n.png"] forState:UIControlStateNormal];
    [_nenghaotongjiBtn setImage:[UIImage imageNamed:@"engineer_env_nenghao_s.png"] forState:UIControlStateHighlighted];
    [_nenghaotongjiBtn setTitle:@"投影机" forState:UIControlStateNormal];
    [_nenghaotongjiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_nenghaotongjiBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _nenghaotongjiBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_nenghaotongjiBtn setTitleEdgeInsets:UIEdgeInsetsMake(_nenghaotongjiBtn.imageView.frame.size.height+15,-60,-25,5)];
    [_nenghaotongjiBtn setImageEdgeInsets:UIEdgeInsetsMake(-10.0,5.0,_nenghaotongjiBtn.titleLabel.bounds.size.height, -5)];
    [_nenghaotongjiBtn addTarget:self action:@selector(nenghaotongjiAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nenghaotongjiBtn];
    
    int labelStartX = 200;
    int labelStartY = 550;
    
    UILabel* titleL = [[UILabel alloc] initWithFrame:CGRectMake(labelStartX-55, labelStartY, 200, 30)];
    titleL.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleL];
    titleL.font = [UIFont boldSystemFontOfSize:16];
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor  = [UIColor whiteColor];
    titleL.text = @"产品类型";
    
    _productTypePikcer = [[CustomPickerView alloc] initWithFrame:CGRectMake(labelStartX, labelStartY+50, 91, 150) withGrayOrLight:@"gray"];
    _productTypePikcer._pickerDataArray = @[@{@"values":@[@"a",@"z",@"l"]}];
    [_productTypePikcer selectRow:0 inComponent:0];
    _productTypePikcer._selectColor = RGB(253, 180, 0);
    _productTypePikcer._rowNormalColor = RGB(117, 165, 186);
    [self.view addSubview:_productTypePikcer];
    
    titleL = [[UILabel alloc] initWithFrame:CGRectMake(labelStartX+140, labelStartY, 200, 30)];
    titleL.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleL];
    titleL.font = [UIFont boldSystemFontOfSize:16];
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor  = [UIColor whiteColor];
    titleL.text = @"品牌";
    
    _brandPicker = [[CustomPickerView alloc] initWithFrame:CGRectMake(labelStartX+200, labelStartY+50, 91, 150) withGrayOrLight:@"light"];
    _brandPicker._pickerDataArray = @[@{@"values":@[@"f",@"e",@"a"]}];
    [_brandPicker selectRow:0 inComponent:0];
    _brandPicker._selectColor = RGB(253, 180, 0);
    _brandPicker._rowNormalColor = RGB(117, 165, 186);
    [self.view addSubview:_brandPicker];
    
    titleL = [[UILabel alloc] initWithFrame:CGRectMake(labelStartX+340, labelStartY, 200, 30)];
    titleL.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleL];
    titleL.font = [UIFont boldSystemFontOfSize:16];
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor  = [UIColor whiteColor];
    titleL.text = @"型号";
    
    _productCategoryPicker = [[CustomPickerView alloc] initWithFrame:CGRectMake(labelStartX+400, labelStartY+50, 91, 150) withGrayOrLight:@"light"];
    _productCategoryPicker._pickerDataArray = @[@{@"values":@[@"c",@"v",@"b"]}];
    [_productCategoryPicker selectRow:0 inComponent:0];
    _productCategoryPicker._selectColor = RGB(253, 180, 0);
    _productCategoryPicker._rowNormalColor = RGB(117, 165, 186);
    [self.view addSubview:_productCategoryPicker];
    
    titleL = [[UILabel alloc] initWithFrame:CGRectMake(labelStartX+600, labelStartY, 100, 30)];
    titleL.backgroundColor = [UIColor clearColor];
    [self.view addSubview:titleL];
    titleL.font = [UIFont boldSystemFontOfSize:16];
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor  = [UIColor whiteColor];
    titleL.text = @"数量";
    
    _numberPicker = [[CustomPickerView alloc] initWithFrame:CGRectMake(labelStartX+600, labelStartY+50, 91, 150) withGrayOrLight:@"light"];
    _numberPicker._pickerDataArray = @[@{@"values":@[@"12",@"10",@"09"]}];
    [_numberPicker selectRow:0 inComponent:0];
    _numberPicker._selectColor = RGB(253, 180, 0);
    _numberPicker._rowNormalColor = RGB(117, 165, 186);
    [self.view addSubview:_numberPicker];
    
    _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _confirmButton.frame = CGRectMake(labelStartX+600+125, labelStartY+50+55, 50, 50);
    [_confirmButton setImage:[UIImage imageNamed:@"engineer_confirm_bt_n.png"] forState:UIControlStateNormal];
    [_confirmButton setImage:[UIImage imageNamed:@"engineer_confirm_bt_s.png"] forState:UIControlStateHighlighted];
    [_confirmButton addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_confirmButton];
}
- (void) zhaomingAction:(id)sender{
    
}
- (void) kongtiaoAction:(id)sender{
    
}
- (void) diandongmadaAction:(id)sender{
    
}
- (void) xinfengAction:(id)sender{
    
}
- (void) dinuanAction:(id)sender{
    
}
- (void) kongqijinghuaAction:(id)sender{
    
}
- (void) jingshuiAction:(id)sender{
    
}
- (void) jiashiAction:(id)sender{
    
}
- (void) menjinAction:(id)sender{
    
}
- (void) jiankongAction:(id)sender{
    
}
- (void) nenghaotongjiAction:(id)sender{
    
}

- (void) okAction:(id)sender{
    
}
- (void) confirmAction:(id)sender{
    
}
- (void) cancelAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end




