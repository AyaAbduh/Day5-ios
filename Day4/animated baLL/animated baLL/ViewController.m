//
//  ViewController.m
//  animated baLL
//
//  Created by JETS Mobile Lab-10 on 4/22/19.
//  Copyright © 2019 iti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *ball;
@property bool flag;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _ball.layer.cornerRadius=40;
    _ball.layer.borderColor=[UIColor blueColor].CGColor;
    _ball.layer.borderWidth=1;
    
    _animator=[[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    [self animation];
    
    
}

-(void )animation{
    UIGravityBehavior * gravity=[[UIGravityBehavior alloc] initWithItems:@[_ball]];
    [_animator addBehavior:gravity];
    
    UICollisionBehavior *collesion=[[UICollisionBehavior alloc] initWithItems:@[_ball]];
    [collesion setTranslatesReferenceBoundsIntoBoundary:YES];
    collesion.collisionDelegate=self;
    _flag=true;
    
    [_animator addBehavior:collesion];

    UIDynamicItemBehavior * item =[[UIDynamicItemBehavior alloc] initWithItems:@[_ball]];
    item.elasticity=1;
    [_animator addBehavior:item];

}
- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier{
    if(_flag==true){
    _ball.layer.backgroundColor=[UIColor blueColor].CGColor ;
        _flag=false;
    }else{
         _ball.layer.backgroundColor=[UIColor redColor].CGColor ;
        _flag=true;
    }
}
@end
