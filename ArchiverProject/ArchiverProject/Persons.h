//
//  Persons.h
//  ArchiverProject
//
//  Created by 超 田 on 12-8-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
// 协议 NSCoding
@interface Persons : NSObject<NSCoding>
@property(copy,nonatomic)NSString * name,* skill;
@property int age;
//初始化
-(id)initWithName:(NSString *)newName
           andAge:(int)newAge
         andSkill:(NSString *)newSkill;



@end
