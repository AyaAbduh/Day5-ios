//
//  ViewController.m
//  userDefaults
//
//  Created by JETS Mobile Lab-10 on 4/22/19.
//  Copyright © 2019 iti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UILabel *Result;
- (IBAction)signIn:(id)sender;

- (IBAction)RemeberMe:(id)sender;

@end

@implementation ViewController{
    NSUserDefaults * userDefaults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    userDefaults=[NSUserDefaults standardUserDefaults];
    //_username=@"aya";
    //_pass=@"123456";
    
}

- (IBAction)signIn:(id)sender {
    _username=[userDefaults objectForKey:@"username"];
    _pass=[userDefaults objectForKey:@"password"];
    _userName.text=_username;
    _password.text=_pass;
    
}

- (IBAction)RemeberMe:(id)sender {
    _username=[_userName text];
    _pass= [_password text];
    [userDefaults  setObject:_username forKey:@"username"];
    [userDefaults  setObject:_pass forKey:@"password"];
    _userName.text=@"";
    _password.text=@"";
    
}
@end
