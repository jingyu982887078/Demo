//
//  Person.m
//  运行时 关联对象
//
//  Created by wangjingyu on 2017/4/13.
//  Copyright © 2017年 wangjingyu. All rights reserved.
//

#import "Person.h"

@implementation Person

-(NSString *)description {
    
    
    NSArray *keys = @[@"name",@"age",@"height"];
    return [self dictionaryWithValuesForKeys:keys].description;
}

@end
