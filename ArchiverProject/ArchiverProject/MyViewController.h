//
//  MyViewController.h
//  ArchiverProject
//
//  Created by 超 田 on 12-8-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *txt1;
@property (retain, nonatomic) IBOutlet UITextField *txt2;
@property (retain, nonatomic) IBOutlet UITextField *txt3;
-(NSString *)filePath;
@end
