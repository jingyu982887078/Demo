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


+(instancetype)wjy_objcProtyListWithDict:(NSDictionary *)dict {
    
   id object = [[self alloc]init];
    
    //获取类所有的属性
    NSArray *propertylist = [self wjy_objcProtyList];
    
    //遍历数组字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"%@ %@ ",key,obj);
       
        if ([propertylist containsObject:key]) {
            
            //kvc赋值
            [object setValue:obj forKey:key];
        }
        
    }];
    
    NSLog(@"%@",object);
    
    return object;
}


const char *str = "key";

+(NSArray *)wjy_objcProtyList {
    
    
    //1.从关联的对象中获取属性
    
   NSArray *pArray = objc_getAssociatedObject(self, str);
    if (pArray != nil) {
        return nil;
    }
    
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
    
    //2.利用关联对象，添加属性
    objc_setAssociatedObject(self, str, pArray,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return array.copy;
    
}

@end
