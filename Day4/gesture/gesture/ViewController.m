//
//  ViewController.m
//  gesture
//
//  Created by JETS Mobile Lab-10 on 4/23/19.
//  Copyright © 2019 iti. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UISwipeGestureRecognizer *rec =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(next) ];
    rec.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:rec];
}
-(void) next{
    printf("Swipped\n");
    secondViewController *second=[self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    [second setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
   
    
    [self presentViewController:second animated:YES completion:nil
     ];
    
}

@end
