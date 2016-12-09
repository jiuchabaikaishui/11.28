//
//  ViewController.h
//  Practice06_iOS
//
//  Created by 綦 on 16/12/8.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

@interface ReturnModel : NSObject

@property (copy, nonatomic) NSString *code;
@property (copy, nonatomic) NSString *result;
@property (copy, nonatomic) NSString *message;
@property (assign, nonatomic, readonly) BOOL susseced;

@end

