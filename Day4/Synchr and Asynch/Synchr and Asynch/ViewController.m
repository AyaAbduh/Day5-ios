//
//  ViewController.m
//  Synchr and Asynch
//
//  Created by JETS Mobile Lab-10 on 4/22/19.
//  Copyright © 2019 iti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)Async:(UIButton *)sender;
- (IBAction)syncAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation ViewController{
    NSMutableData * dataRecived;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (IBAction)Async:(UIButton *)sender {
      NSURL * url=[NSURL URLWithString:@"https://maktoob.yahoo.com/?p=us&guccounter=1"];
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
    
    NSString *str=[[NSString alloc]initWithData:dataRecived encoding:NSUTF8StringEncoding];

    //take json and convert it to sutable type
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:dataRecived  options:NSJSONReadingAllowFragments error:nil];
  //  NSString * str=[dict objectForKey:@"status"];
   // [_textView setText:str];
    [_webView loadHTMLString:str baseURL:[NSURL URLWithString:@"https://maktoob.yahoo.com/?p=us&guccounter=1"]];
    

    //[_webView stringByEvaluatingJavaScriptFromString:str];
}

- (IBAction)syncAction:(UIButton *)sender {
    NSURL * url=[NSURL URLWithString:@"https://maktoob.yahoo.com/?p=us"];
    NSString *str =[[NSString alloc]initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    //_textView.text=str;
    [_webView loadHTMLString:str baseURL:url];
}
@end
