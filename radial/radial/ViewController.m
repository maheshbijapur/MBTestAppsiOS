//
//  ViewController.m
//  radial
//
//  Created by Mahesh.Bijapur on 8/21/18.
//  Copyright © 2018 Mahesh.Bijapur. All rights reserved.
//

#import "ViewController.h"
#import <MarketoFramework/MarketoFramework.h>
#import "SecondViewController.h"
#import <Speech/Speech.h>

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *subMunchkin;
@property (weak, nonatomic) IBOutlet UITextField *leadEmail;
@property (strong, nonatomic) NSString *leadEmailtext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"ViewController - viewDidLoad");
//    _subMunchkin.text = [NSString stringWithFormat:@"MUNCHKIN_ID : %@ SECRET_KEY : %@", @"849-BHY-433", @"ZjRWbG03UTV2alVBU0x0V01CaDFyR3lk"];
        _leadEmail.delegate =  self;
//
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickedLogout:(id)sender {
    NSLog(@"unregisterPushDeviceToken");
    [[Marketo sharedInstance] unregisterPushDeviceToken];
}

- (IBAction)clickedReportAction:(id)sender {
    
    Marketo *sharedInstance = [Marketo sharedInstance];
    MarketoActionMetaData *meta = [[MarketoActionMetaData alloc] init];
    [meta setType:@"iOS"];
    [meta setDetails:@"17.0"];
    [sharedInstance reportAction:@"Apple17m1" withMetaData:meta];
    
//    SecondViewController *sVc = [[SecondViewController alloc] init];
//    [self.navigationController pushViewController:sVc animated:YES];
}

- (IBAction)clickedAssociateLead:(id)sender {
    MarketoLead *lead = [[MarketoLead alloc] init];
    [lead setEmail:@"Sept22-prod1@adobe.com"];
    [lead setFirstName:@"mahesh"];
    [lead setLastName:@"v"];
    [lead setCity:@"Bengaluru"];
//    [lead setFieldName:@"cartValue" withValue:@"700"];
//    [lead setFieldName:@"Mobile Phone Number" withValue:@"+91 9922234567"];
    [[Marketo sharedInstance] associateLead:lead];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return true;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return false;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    _leadEmailtext = textField.text;
    NSLog(@"_leadEmailtext -- %@", _leadEmailtext);
}
@end
