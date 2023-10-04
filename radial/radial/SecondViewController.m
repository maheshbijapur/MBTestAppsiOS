//
//  SecondViewController.m
//  radial
//
//  Created by Mahesh.Bijapur on 1/14/19.
//  Copyright © 2019 Mahesh.Bijapur. All rights reserved.
//

#import "SecondViewController.h"
//#import <Marketo/Marketo.h>
//#import <MarketoNew/Marketo.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    Marketo *sharedInstance = [Marketo sharedInstance];
//    [sharedInstance reportAction:@"MyHome" withMetaData:nil];
//    [sharedInstance reportAll];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
