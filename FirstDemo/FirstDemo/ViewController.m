//
//  ViewController.m
//  FirstDemo
//
//  Created by 1bu2bu-3 on 16/2/19.
//  Copyright © 2016年 dongrong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIDatePicker *m_pDatePicker;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self CreateDatePicker];
}

#pragma mark - private method
-(void)CreateDatePicker
{
    m_pDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 400, 200)];
    m_pDatePicker.center = self.view.center;
    m_pDatePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
    m_pDatePicker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:m_pDatePicker];
    [m_pDatePicker addTarget:self action:@selector(DateChanged:) forControlEvents:UIControlEventValueChanged];
    
    //显示格式 中文
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    m_pDatePicker.locale = locale;
    
    //起始时间和最远时间
    NSDate *localDate = [NSDate date];
    //当前时间加上的时间：格里高利历
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    //设置时间
    [offsetComponents setYear:1];
    [offsetComponents setMonth:2];
    [offsetComponents setDay:3];
//    [offsetComponents setHour:20];
//    [offsetComponents setMinute:0];
//    [offsetComponents setSecond:0];
    //设置最大值时间
    NSDate *minDate = [gregorian dateByAddingComponents:offsetComponents toDate:localDate options:0];
    //设置属性
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *minDate1 =  [formatter dateFromString:@"1967-10-01"];
    m_pDatePicker.minimumDate = minDate1;
    m_pDatePicker.maximumDate = localDate;
}

-(void)DateChanged:(id)argSender
{
    UIDatePicker *picker = (UIDatePicker *)argSender;
    NSDateFormatter *formatter = [[ NSDateFormatter alloc ] init ];
    // 格式化日期格式
    formatter. dateFormat = @"yyyy-MM-dd" ;
    NSString *date = [formatter stringFromDate :picker.date];
    
    // 显示时间
    NSLog(@"时间%@",date);
}
#pragma mark - memorywarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
