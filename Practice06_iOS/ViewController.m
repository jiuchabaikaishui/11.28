//
//  ViewController.m
//  Practice06_iOS
//
//  Created by 綦 on 16/12/8.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#import "ViewController.h"

#define NumberArray             @[@"零", @"壹", @"贰", @"叁", @"肆", @"伍", @"陆", @"柒", @"捌", @"玖", @"拾"]

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

#pragma mark - 控制器周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.textField becomeFirstResponder];
    self.textView.editable = NO;
}

#pragma mark - 触摸点击方法
- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    [self.textField resignFirstResponder];
}
- (IBAction)calculationAtion:(UIButton *)sender {
    self.textView.text = [self writtenAmount:self.textField.text];
}

#pragma mark - 自定义方法
- (NSString *)writtenAmount:(NSString *)amount
{
    NSString *str = @"";
    if (amount && amount.length > 0) {
        int value = [amount intValue];
        if (value > 0) {
            str = [NSString stringWithFormat:@"%@%@", str, NumberArray[value%10]];
        }
        else
        {
            str = [NSString stringWithFormat:@"%@%@", str, [NumberArray firstObject]];
        }
    }
    
    return str;
}

@end
