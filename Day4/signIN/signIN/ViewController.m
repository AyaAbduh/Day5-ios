//
//  ViewController.m
//  signIN
//
//  Created by JETS Mobile Lab-10 on 4/23/19.
//  Copyright © 2019 iti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)signIN:(UIButton *)sender;
@property  NSString * stringURl;

@end

@implementation ViewController{
       NSMutableData * dataRecived;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (IBAction)signIN:(UIButton *)sender {

    _stringURl=[NSString stringWithFormat:@"%s%@%s%@","http://jets.iti.gov.eg/FriendsApp/services/user/register?name=",[_userName text],"&phone=",[_password text]];
    
    NSLog(@"%@", _stringURl);
    
    NSURL * url=[NSURL URLWithString:_stringURl];
    
    NSURLRequest * request=[NSURLRequest requestWithURL:url];
    NSURLConnection * connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    printf("Did recive response");
    dataRecived=[NSMutableData new];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //printf("Did recive Data");
    [dataRecived appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
   //NSString *str=[[NSString alloc]initWithData:dataRecived encoding:NSUTF8StringEncoding];
    //take json and convert it to sutable type
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:dataRecived  options:NSJSONReadingAllowFragments error:nil];
    
    NSString * str=[dict objectForKey:@"status"];
    if([[_userName text] isEqual:@"aya"] && [[_password text] isEqual:@"123 "]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SIGN IN"message:@"success" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SIGN IN"message:str delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];}
}
@end
