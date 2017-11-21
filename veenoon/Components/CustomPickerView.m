//
//  CustomPickerView.m
//  iMokard
//
//  Created by steven on 1/5/10.
//  Copyright 2009 Steven Sun. All rights reserved.
//

#import "CustomPickerView.h"
#import "UIButton+Color.h"


@interface CustomPickerView ()
{
    UIPickerView    *_myPickerView;
    
    NSMutableDictionary *_values;
    
    BOOL            _isShowing;
    
    NSInteger       _comSelected;
    NSInteger       _rowSelected;
}

@end

@implementation CustomPickerView
@synthesize _pickerDataArray;
@synthesize delegate_;
@synthesize _selectionBlock;

@synthesize _unitString;

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
        
        _myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 0, frame.size.width, frame.size.height)];
        _myPickerView.delegate = self;
        _myPickerView.dataSource = self;
        _myPickerView.showsSelectionIndicator = YES;
        [self addSubview:_myPickerView];
        
        
          _values = [[NSMutableDictionary alloc] init];
        
    }
    return self;
}





- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    _comSelected = component;
    _rowSelected = row;
    
    
    NSDictionary *section = [_pickerDataArray objectAtIndex:component];
    NSArray *values = [section objectForKey:@"values"];
    
    [_values setObject:[values objectAtIndex:row]
                forKey:[NSNumber numberWithInteger:component]];
    
    [_myPickerView selectRow:row inComponent:component animated:YES];
}


#pragma mark -
#pragma mark PickerView delegate methods
#pragma mark -
#pragma mark PickerView delegate methods

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _rowSelected = row;
    
    NSDictionary *section = [_pickerDataArray objectAtIndex:component];
    NSArray *values = [section objectForKey:@"values"];
    
    [_values setObject:[values objectAtIndex:row]
                forKey:[NSNumber numberWithInteger:component]];
    
    
    if(_selectionBlock)
    {
        _selectionBlock(_values);
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    NSDictionary *section = [_pickerDataArray objectAtIndex:component];
    
    float width = [[section objectForKey:@"width"] floatValue];
    if(width <= 0)
    {
        width = self.frame.size.width;
    }
    
    return width;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50.0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    NSDictionary *section = [_pickerDataArray objectAtIndex:component];
    NSArray *values = [section objectForKey:@"values"];
    
    return [values count];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    NSDictionary *section = [_pickerDataArray objectAtIndex:component];
    
    CGFloat componentWidth = [[section objectForKey:@"width"] floatValue];
    
    NSArray *values = [section objectForKey:@"values"];
    
    UILabel *tL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, componentWidth, 50)];
    tL.backgroundColor = [UIColor clearColor];
    
    id valueRow = [values objectAtIndex:row];
    if([valueRow isKindOfClass:[NSString class]])
    {
        tL.text = valueRow;
    }
    else if([valueRow isKindOfClass:[NSDictionary class]])
    {
        tL.text = [valueRow objectForKey:@"title"];
    }
    
    tL.textAlignment = NSTextAlignmentCenter;
    tL.textColor = [UIColor blackColor];
    tL.font = [UIFont boldSystemFontOfSize:20];
    
    return tL;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [_pickerDataArray count];
}

- (void)dealloc {
    
    
    
}


@end
