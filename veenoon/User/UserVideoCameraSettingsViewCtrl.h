//
//  UserVideoDVDDiskViewCtrl.h
//  veenoon
//
//  Created by 安志良 on 2017/11/30.
//  Copyright © 2017年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserBaseViewControllor.h"
@interface UserVideoCameraSettingsViewCtrl : UserBaseViewControllor {
    NSMutableArray *_cameraSysArray;
    
    int _number;
}
@property(nonatomic, strong) NSMutableArray *_cameraSysArray;
@property(nonatomic, assign) int _number;
@end


