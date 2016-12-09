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
    ReturnModel *returnModel = [self writtenAmount:self.textField.text];
    self.textView.text = returnModel.susseced ? returnModel.result : returnModel.message;
}

#pragma mark - 自定义方法
- (ReturnModel *)writtenAmount:(NSString *)amount
{
    //算法一
    {
//        NSString *str = @"";
//        if (amount && amount.length > 0) {
//            int value = [amount intValue];
//            if (value > 0) {
//                int index = 0;
//                while (value > 0) {
//                    switch (index%4) {
//                        case 0:
//                        {
//                            switch (index/4) {
//                                case 0:
//                                {
//                                    if (value%10 != 0) {
//                                        str = [NSString stringWithFormat:@"%@%@", NumberArray[value%10], str];
//                                    }
//                                }
//                                    break;
//                                case 1:
//                                    if (value%10 != 0) {
//                                        str = [NSString stringWithFormat:@"%@万%@", NumberArray[value%10], str];
//                                    }
//                                    else
//                                    {
//                                        str = [NSString stringWithFormat:@"万%@", str];
//                                    }
//                                    break;
//                                case 2:
//                                    if (value%10 != 0) {
//                                        str = [NSString stringWithFormat:@"%@亿%@", NumberArray[value%10], str];
//                                    }
//                                    else
//                                    {
//                                        str = [NSString stringWithFormat:@"亿%@", str];
//                                    }
//                                    break;
//                                    
//                                default:
//                                    break;
//                            }
//                        }
//                            break;
//                        case 1:
//                            if (value%10 != 0) {
//                                str = [NSString stringWithFormat:@"%@拾%@", NumberArray[value%10], str];
//                            }
//                            else
//                            {
//                                if (value/10%10 != 0) {
//                                    str = [NSString stringWithFormat:@"%@%@", NumberArray[value%10], str];
//                                }
//                            }
//                            break;
//                        case 2:
//                            if (value%10 != 0) {
//                                str = [NSString stringWithFormat:@"%@佰%@", NumberArray[value%10], str];
//                            }
//                            else
//                            {
//                                if (value/10%10 != 0) {
//                                    str = [NSString stringWithFormat:@"%@%@", NumberArray[value%10], str];
//                                }
//                            }
//                            break;
//                        case 3:
//                            if (value%10 != 0) {
//                                str = [NSString stringWithFormat:@"%@仟%@", NumberArray[value%10], str];
//                            }
//                            else
//                            {
//                                str = [NSString stringWithFormat:@"%@%@", NumberArray[value%10], str];
//                            }
//                            break;
//                            
//                        default:
//                            break;
//                    }
//                    
//                    value /= 10;
//                    index++;
//                }
//            }
//            else
//            {
//                str = [NSString stringWithFormat:@"%@%@", [NumberArray firstObject], str];
//            }
//        }
//        
//        return str;
    }
    
    ReturnModel *returnModel = [[ReturnModel alloc] init];
    
    //是否为空
    if (![self isBlankString:amount]) {
        //是否为数字
        if (![self isNumber:amount]) {
            returnModel.code = @"0001";
            returnModel.result = @"";
            returnModel.message = @"存在非数字！";
        }
        else
        {
            NSArray *arr = [amount componentsSeparatedByString:@"."];
            if (arr.count > 2) {
                returnModel.code = @"0002";
                returnModel.result = @"";
                returnModel.message = @"存在多个小数点！";
            }
            else
            {
                NSString *yuanStr = @"";
                NSString *jiaoStr = @"";
                NSString *fenStr = @"";
                
                //计算整数部分即（元）
                yuanStr = [self calculationYuan:[arr firstObject]];
                
                
                
                returnModel.result = [NSString stringWithFormat:@"%@%@%@", yuanStr, jiaoStr, fenStr];
            }
        }
    }
    
    return returnModel;
}
/**
 *  计算整数部分即（元）
 */
- (NSString *)calculationYuan:(NSString *)amount
{
    NSString *result = @"圆";
    if ([amount integerValue] > 0) {
        //把字符串从右端开始按照4个字符截断为数字
        NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:1];
        NSString *subAmount;
        while (amount.length > 4) {
            subAmount = [amount substringFromIndex:amount.length - 4];
            amount = [amount substringToIndex:amount.length - 4];
            //去掉头部的0
            [mArr insertObject:subAmount atIndex:0];
        }
        [mArr addObject:amount];
        
        NSString *str = @"";
        BOOL noZero;
        for (NSString *valueStr in mArr) {
            //去掉字符数组前面全为0的元素
            if ([valueStr intValue] != 0 || noZero) {
                int value = [valueStr intValue];
                int index = 0;
                switch (index%4) {
                    case 1:
                        if (value%10 != 0) {
                            str = [NSString stringWithFormat:@"%@拾%@", NumberArray[value%10], str];
                        }
                        else
                        {
                            if (value/10%10 != 0) {
                                str = [NSString stringWithFormat:@"%@%@", NumberArray[value%10], str];
                            }
                        }
                        break;
                    case 2:
                        if (value%10 != 0) {
                            str = [NSString stringWithFormat:@"%@佰%@", NumberArray[value%10], str];
                        }
                        else
                        {
                            if (value/10%10 != 0) {
                                str = [NSString stringWithFormat:@"%@%@", NumberArray[value%10], str];
                            }
                        }
                        break;
                    case 3:
                        if (value%10 != 0) {
                            str = [NSString stringWithFormat:@"%@仟%@", NumberArray[value%10], str];
                        }
                        else
                        {
                            str = [NSString stringWithFormat:@"%@%@", NumberArray[value%10], str];
                        }
                        break;
                        
                    default:
                        break;
                }
                
                if (value < 10000 && index != 0) {
                    if ([mArr[index - 1] intValue] > 0) {
                        str = [NSString stringWithFormat:@"%@%@", [NumberArray firstObject], str];
                    }
                }
                
                index++;
            }
        }
        
    }
    
    return result;
}
/**
 *  字符串判空
 */
- (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL)
        return YES;
    
    if ([string isKindOfClass:[NSNull class]])
        return YES;
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
        return YES;
    
    return NO;
}
/**
 *  判断是否为数字
 */
- (BOOL)isNumber:(NSString *)number
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[0-9.]*$"];
    
    return [predicate evaluateWithObject:number];
}

@end


@implementation ReturnModel

- (BOOL)susseced
{
    if ([self.code isEqualToString:@"0000"]) {
        return YES;
    }
    
    return NO;
}
- (NSString *)code
{
    if (_code) {
        return _code;
    }
    
    return @"0000";
}
- (NSString *)result
{
    if (_result) {
        return _result;
    }
    
    return @"";
}
- (NSString *)message
{
    if (_message) {
        return _message;
    }
    
    return @"成功！";
}

@end
