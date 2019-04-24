//
//  secondViewController.m
//  gesture
//
//  Created by JETS Mobile Lab-10 on 4/23/19.
//  Copyright © 2019 iti. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISwipeGestureRecognizer *rec =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(back) ];
    rec.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:rec];
}

-(void) back{
    printf("Swipped back\n");
    secondViewController *first=[self.storyboard instantiateViewControllerWithIdentifier:@"first"];
    [first setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    
    [self presentViewController:first animated:YES completion:nil
     ];
    
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
