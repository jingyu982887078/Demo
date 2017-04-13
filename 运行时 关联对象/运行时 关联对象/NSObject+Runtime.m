//
//  NSObject+Runtime.m
//  运行时 关联对象
//
//  Created by wangjingyu on 2017/4/13.
//  Copyright © 2017年 wangjingyu. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

@implementation NSObject (Runtime)


+(NSArray *)wjy_objcProtyList {
    
    //获得属性列表数组
    //c语言中，数组的名字就是指向第一个元素的地址
    unsigned int count = 0;
    objc_property_t *proty = class_copyPropertyList([self class], &count);
    
    
    NSMutableArray *array = [NSMutableArray array];
    //遍历数组
    for (unsigned int i = 0;  i < count; i++) {
        
        //获取属性的名称
        
        objc_property_t pty = proty[i];
        
        const char *Name = property_getName(pty);
        
        NSString *str = [NSString stringWithCString:Name encoding:NSUTF8StringEncoding];
        
        [array addObject:str];
    }
    
    free(proty);
    
    return array.copy;
    
}

@end
