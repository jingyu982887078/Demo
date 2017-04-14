//
//  ViewController.m
//  运行时 关联对象
//
//  Created by wangjingyu on 2017/4/13.
//  Copyright © 2017年 wangjingyu. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

#import "NSObject+Runtime.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取到属性列表数组
//    NSArray *array = [Person wjy_objcProtyList];
//    
//    NSLog(@"%@",array);
    
    //字典转模型
    NSDictionary *dict = @{@"name":@"wangjingyu",
                           @"height":@"180",
                           @"age":@"18"
                           };
    
    NSArray *array = [Person wjy_objcProtyListWithDict:dict];
    NSLog(@"%@",array);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
