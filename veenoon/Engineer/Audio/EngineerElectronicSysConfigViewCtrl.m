//
//  EngineerElectonicSysConfigViewCtrl.m
//  veenoon
//
//  Created by 安志良 on 2017/12/14.
//  Copyright © 2017年 jack. All rights reserved.
//

#import "EngineerElectronicSysConfigViewCtrl.h"
#import "UIButton+Color.h"
#import "PowerSettingView.h"
#import "CustomPickerView.h"

@interface EngineerElectronicSysConfigViewCtrl () {
    PowerSettingView *_psv;
    
    UIButton *_selectSysBtn;
    
    CustomPickerView *_customPicker;
}
@end

@implementation EngineerElectronicSysConfigViewCtrl
@synthesize _electronicSysArray;
@synthesize _number;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *titleIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_view_title.png"]];
    [self.view addSubview:titleIcon];
    titleIcon.frame = CGRectMake(70, 30, 70, 10);
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 59, SCREEN_WIDTH, 1)];
    line.backgroundColor = RGB(75, 163, 202);
    [self.view addSubview:line];
    
    UIImageView *bottomBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-60, SCREEN_WIDTH, 60)];
    [self.view addSubview:bottomBar];
    
    //缺切图，把切图贴上即可。
    bottomBar.backgroundColor = [UIColor grayColor];
    bottomBar.userInteractionEnabled = YES;
    bottomBar.image = [UIImage imageNamed:@"botomo_icon.png"];
    
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
    [okBtn setTitle:@"设置" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okBtn setTitleColor:RGB(255, 180, 0) forState:UIControlStateHighlighted];
    okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [okBtn addTarget:self
              action:@selector(okAction:)
    forControlEvents:UIControlEventTouchUpInside];
    
    _selectSysBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _selectSysBtn.frame = CGRectMake(70, 100, 200, 30);
    [_selectSysBtn setImage:[UIImage imageNamed:@"engineer_sys_select_down_n.png"] forState:UIControlStateNormal];
    [_selectSysBtn setTitle:@"电源实时器" forState:UIControlStateNormal];
    [_selectSysBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_selectSysBtn setTitleColor:RGB(230, 151, 50) forState:UIControlStateHighlighted];
    _selectSysBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_selectSysBtn setTitleEdgeInsets:UIEdgeInsetsMake(0,-30,0,_selectSysBtn.imageView.bounds.size.width+50)];
    [_selectSysBtn setImageEdgeInsets:UIEdgeInsetsMake(0,_selectSysBtn.titleLabel.bounds.size.width,0,-100)];
    [_selectSysBtn addTarget:self action:@selector(sysSelectAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_selectSysBtn];
    
    int index = 0;
    int top = 250;
    if (self._number == 8) {
        top = 350;
    }
    
    int leftRight = 100;
    
    int cellWidth = 92;
    int cellHeight = 92;
    int colNumber = 8;
    int space = (SCREEN_WIDTH - colNumber*cellWidth-leftRight*2)/(colNumber-1);
    
    if ([self._electronicSysArray count] == 0) {
        int nameStart = 1;
        for (int i = 0; i < self._number; i++) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            
            if (nameStart < 10) {
                NSString *startStr = [NSString stringWithFormat:@"%d",nameStart];
                NSString *name = [@"0" stringByAppendingString:startStr];
                
                [dic setObject:name forKey:@"name"];
            } else {
                NSString *startStr = [NSString stringWithFormat:@"%d",nameStart];
                [dic setObject:startStr forKey:@"name"];
            }
            
            [dic setObject:@"OFF" forKey:@"status"];
            
            nameStart++;
            [self._electronicSysArray addObject:dic];
            
            int row = index/colNumber;
            int col = index%colNumber;
            int startX = col*cellWidth+col*space+leftRight;
            int startY = row*cellHeight+space*row+top;
            
            UIButton *scenarioBtn = [UIButton buttonWithColor:nil selColor:RGB(0, 89, 118)];
            scenarioBtn.frame = CGRectMake(startX, startY, cellWidth, cellHeight);
            scenarioBtn.layer.cornerRadius = 5;
            scenarioBtn.layer.borderWidth = 2;
            scenarioBtn.layer.borderColor = [UIColor clearColor].CGColor;
            scenarioBtn.clipsToBounds = YES;
            [scenarioBtn setImage:[UIImage imageNamed:@"dianyuanshishiqi_n.png"] forState:UIControlStateNormal];
            [scenarioBtn setImage:[UIImage imageNamed:@"dianyuanshishiqi_s.png"] forState:UIControlStateHighlighted];
            scenarioBtn.tag = index;
            [self.view addSubview:scenarioBtn];
            
            [scenarioBtn addTarget:self
                            action:@selector(scenarioAction:)
                  forControlEvents:UIControlEventTouchUpInside];
            [self createBtnLabel:scenarioBtn dataDic:dic];
            index++;
        }
    } else {
        for (int i = 0; i < self._number; i++) {
            NSMutableDictionary *dic = [self._electronicSysArray objectAtIndex:i];
            
            int row = index/colNumber;
            int col = index%colNumber;
            int startX = col*cellWidth+col*space+leftRight;
            int startY = row*cellHeight+space*row+top;
            
            UIButton *scenarioBtn = [UIButton buttonWithColor:nil selColor:RGB(0, 89, 118)];
            scenarioBtn.frame = CGRectMake(startX, startY, cellWidth, cellHeight);
            scenarioBtn.clipsToBounds = YES;
            scenarioBtn.layer.cornerRadius = 5;
            scenarioBtn.layer.borderWidth = 2;
            scenarioBtn.layer.borderColor = [UIColor clearColor].CGColor;
            NSString *status = [dic objectForKey:@"status"];
            
            [scenarioBtn setImage:[UIImage imageNamed:@"dianyuanshishiqi_n.png"] forState:UIControlStateNormal];
            [scenarioBtn setImage:[UIImage imageNamed:@"dianyuanshishiqi_s.png"] forState:UIControlStateHighlighted];
            
            if ([status isEqualToString:@"ON"]) {
                [scenarioBtn setImage:[UIImage imageNamed:@"dianyuanshishiqi_s.png"] forState:UIControlStateNormal];
            }
            scenarioBtn.tag = index;
            [self.view addSubview:scenarioBtn];
            
            [scenarioBtn addTarget:self
                            action:@selector(scenarioAction:)
                  forControlEvents:UIControlEventTouchUpInside];
            [self createBtnLabel:scenarioBtn dataDic:dic];
            index++;
        }
    }
}
- (void) createBtnLabel:(UIButton*)sender dataDic:(NSMutableDictionary*) dataDic{
    UILabel* titleL = [[UILabel alloc] initWithFrame:CGRectMake(sender.frame.size.width - 20, 0, 20, 20)];
    titleL.backgroundColor = [UIColor clearColor];
    [sender addSubview:titleL];
    titleL.font = [UIFont boldSystemFontOfSize:11];
    titleL.textColor  = [UIColor whiteColor];
    titleL.text = [dataDic objectForKey:@"name"];
    
    titleL = [[UILabel alloc] initWithFrame:CGRectMake(sender.frame.size.width/2 -40, sender.frame.size.height - 20, 80, 20)];
    titleL.backgroundColor = [UIColor clearColor];
    [sender addSubview:titleL];
    titleL.font = [UIFont boldSystemFontOfSize:12];
    titleL.textColor  = [UIColor whiteColor];
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.text = @"Channel";
}

- (void) sysSelectAction:(id)sender{
    _customPicker = [[CustomPickerView alloc]
                                      initWithFrame:CGRectMake(_selectSysBtn.frame.origin.x, _selectSysBtn.frame.origin.y, _selectSysBtn.frame.size.width, 200) withGrayOrLight:@"gray"];
    
    
    NSMutableArray *arr = [NSMutableArray array];
    for(int i = 1; i< 2; i++)
    {
        [arr addObject:[NSString stringWithFormat:@"00%d", i]];
    }
    
    _customPicker._pickerDataArray = @[@{@"values":arr}];
    
    
    _customPicker._selectColor = [UIColor orangeColor];
    _customPicker._rowNormalColor = [UIColor whiteColor];
    [self.view addSubview:_customPicker];
    _customPicker.delegate_ = self;
}

- (void) didConfirmPickerValue:(NSString*) pickerValue {
    if (_customPicker) {
        [_customPicker removeFromSuperview];
    }
    NSString *title =  [@"电源实时器" stringByAppendingString:pickerValue];
    [_selectSysBtn setTitle:title forState:UIControlStateNormal];
}

- (void) scenarioAction:(id)sender{
    UIButton *btn = (UIButton*) sender;
    int index = (int) btn.tag;
    
    NSMutableDictionary *dic = [self._electronicSysArray objectAtIndex:index];
    
    NSString *status = [dic objectForKey:@"status"];
    if ([status isEqualToString:@"ON"]) {
        [btn setImage:[UIImage imageNamed:@"dianyuanshishiqi_n.png"] forState:UIControlStateNormal];
        [dic setObject:@"OFF" forKey:@"status"];
    } else {
        [btn setImage:[UIImage imageNamed:@"dianyuanshishiqi_s.png"] forState:UIControlStateNormal];
        [dic setObject:@"ON" forKey:@"status"];
    }
}

- (void) okAction:(id)sender{
    _psv = [[PowerSettingView alloc]
                             initWithFrame:CGRectMake(SCREEN_WIDTH-300,
                                                      64, 300, SCREEN_HEIGHT-114)];
    [self.view addSubview:_psv];
    
    [_psv show8Labs];
}

- (void) cancelAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end