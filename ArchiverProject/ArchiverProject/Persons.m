//
//  Persons.m
//  ArchiverProject
//
//  Created by 超 田 on 12-8-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Persons.h"

@implementation Persons
@synthesize name=_name,age=_age,skill=_skill;

// 编码实现
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:[NSNumber numberWithInt:self.age] forKey:@"age"];
    [aCoder encodeObject:self.skill forKey:@"skill"];

}
// 解码
-(id)initWithCoder:(NSCoder *)aDecoder
{
    NSString * name=[aDecoder decodeObjectForKey:@"name"];
    NSString * skill=[aDecoder decodeObjectForKey:@"skill"];
    int age=[[aDecoder decodeObjectForKey:@"age"]intValue ];//类型转换
    self=[self initWithName:name andAge:age andSkill:skill];
    return self;
}

//初始化
-(id)initWithName:(NSString *)newName andAge:(int)newAge andSkill:(NSString *)newSkill
{
    self=[super init];
    if (self)
    {
        self.name=newName;
        self.age=newAge;
        self.skill=newSkill;
        
    }
    return self;
    
}
-(void)dealloc
{
    [_name release];
    [_skill release];
    [super dealloc];
}

@end
