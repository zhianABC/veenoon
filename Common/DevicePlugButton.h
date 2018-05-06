//
//  DevicePlugButton.h
//  veenoon
//
//  Created by chen jack on 2018/5/6.
//  Copyright © 2018年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DevicePlugButton : UIButton

@property (nonatomic, strong) NSDictionary *_mydata;

- (void) addMyObserver;
- (void) removeMyObserver;

@end