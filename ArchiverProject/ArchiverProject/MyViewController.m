//
//  MyViewController.m
//  ArchiverProject
//
//  Created by 超 田 on 12-8-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyViewController.h"
#import "Persons.h"
@implementation MyViewController
@synthesize txt1;
@synthesize txt2;
@synthesize txt3;
- (IBAction)btnAction:(id)sender 
{
    //从文件读取数据
    NSData * data=[NSData dataWithContentsOfFile:[self filePath]];
    //反归档器
    NSKeyedUnarchiver * narchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    Persons * p1=[narchiver decodeObjectForKey:@"QQQ"];
    
    self.txt1.text=p1.name;
    self.txt2.text=[[NSNumber numberWithInt:p1.age]stringValue];
    self.txt3.text=p1.skill;
    
    NSLog(@"name = %@,skill = %@,age = %d",p1.name,p1.skill,p1.age);
    
   // [narchiver finishDecoding];
    [narchiver release];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //添加 Home 键 通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(homeClick) name:UIApplicationDidEnterBackgroundNotification object:nil];
}
//获取文件夹的路径
-(NSString *)filePath
{
    NSArray * pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * docPath=[pathArray objectAtIndex:0];
    NSString * path=[docPath stringByAppendingPathComponent:@"xy"]; 
    
    NSLog(@"%@",path);
    return path;

}
//点击 “Home” 键 时的方法
-(void)homeClick
{
    //保存文本框中的数据
    NSString * s1=txt1.text;
    NSString * s2=txt2.text;
    NSString * s3=txt3.text;
    
    Persons * p1=[[Persons alloc]initWithName:s1 andAge:20 andSkill:@"吃"];
    Persons * p2=[[Persons alloc]initWithName:s2 andAge:21 andSkill:@"喝"];
    Persons * p3=[[Persons alloc]initWithName:s3 andAge:22 andSkill:@"拉"];
    //定义一个数据对象，保存2进制数据
    NSMutableData * data=[[NSMutableData alloc]init];
    //定义一个归档器，并关联归档时的缓存对象
    NSKeyedArchiver * archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    //将对象按照制定的键保存在data对象
    [archiver encodeObject:p1 forKey:@"QQQ"];
    [archiver encodeObject:p2 forKey:@"p2"];
    [archiver encodeObject:p3 forKey:@"p3"];
    //结束编码 将三个对象写入data对象
    [archiver finishEncoding];
    [archiver release];
    //将数据写入指定路径下
    [data writeToFile:[self filePath] atomically:YES];
    [p1 release];
    [p2 release];
    [p3 release];
    


}

- (void)viewDidUnload
{
    [self setTxt1:nil];
    [self setTxt2:nil];
    [self setTxt3:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [txt1 release];
    [txt2 release];
    [txt3 release];
    //移除通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [super dealloc];
}
@end
