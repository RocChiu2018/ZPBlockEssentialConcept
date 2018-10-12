//
//  ViewController.m
//  block例子
//
//  Created by apple on 15/9/9.
//  Copyright (c) 2015年 apple. All rights reserved.
//

/**
 block函数分为三个部分：
 第一部分：block函数的定义；
 第二部分：block函数的调用；
 第三部分：block函数的实现（回调）。
 */
#import "ViewController.h"

@interface ViewController ()

@end

/**
 block函数的定义：下面的"int"为block函数的返回值类型，"^"为block函数的标志，"MySum"为block函数的名称，最后括号内的部分是block函数的参数；
 block函数也可以没有参数。
 */
typedef int (^MySum) (int c, int d);

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self test];
    
//    [self test1];
}

- (void)test
{
    /**
     下面代码中等号的左边是block函数的定义，等号右边的大括号内是block函数的实现，当调用block函数的时候就会执行大括号内的代码（回调函数）。
     */
    void (^Sum) () = ^(){
        NSLog(@"block函数的实现--回调函数");
    };
    
    //block函数的调用
    Sum();
}

- (void)test1
{
    /**
     如果block大括号内的回调函数想要访问大括号外面的常量的话必须在外面的那个常量前面加上"__block"关键字才可以，没有此关键字则不能够访问。
     */
    __block int a = 10;
    
    MySum mySum = ^(int b, int c){
        a = 20;
        NSLog(@"a = %i", a);
        
        return b+c;
    };
    
    int d = mySum (20, 10);
    NSLog(@"d = %i", d);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
