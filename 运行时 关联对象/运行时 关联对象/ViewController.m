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
                           @"age":@"18",
                           @"height":@"180"
                           };
    
    Person *p = [Person wjy_objcProtyListWithDict:dict];
    NSLog(@"%@",p);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
