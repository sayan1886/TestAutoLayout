//
//  ViewController.m
//  TestAutoLayout
//
//  Created by Sayan Chatterjee on 11/02/14.
//  Copyright (c) 2014 VaporWare Solutions. All rights reserved.
//

#import "ViewController.h"

typedef enum{
    ViewHiddenNone,
    ViewHidden_1,
    ViewHidden_2,
    ViewHidden_3,
    ViewHidden_1_2,
    ViewHidden_1_3,
    ViewHidden_2_3
}ViewHidden;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view1_width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view1_height;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view2_width;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view2_height;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view1_view2_separation;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view3_height;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view1_view3_separation;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view2_view3_separation;

@end

@implementation ViewController

- (void) setViews{
    int viewHidden = arc4random_uniform(7);
    switch (viewHidden) {
        case ViewHiddenNone:
            NSLog(@"No View Hidden");
            break;
        case ViewHidden_1:
            NSLog(@"View 1 Hidden");
            self.view1.hidden = YES;
            self.view1_width.constant = 0.0f;
            self.view1_view2_separation.constant = 0.0f;
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view3 attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0]];
            break;
        case ViewHidden_2:
            NSLog(@"View 2 Hidden");
            self.view2.hidden = YES;
            self.view2_width.constant = 0.0f;
            self.view1_view2_separation.constant = 0.0f;
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view3 attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0]];
            break;
        case ViewHidden_3:
            NSLog(@"View 3 Hidden");
            self.view3.hidden = YES;
            self.view3_height.constant = 0.0f;
            self.view1_view3_separation.constant = 0.0f;
            self.view2_view3_separation.constant = 0.0f;
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view2 attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0]];
            break;
        case ViewHidden_1_2:
            NSLog(@"View 1 and 2 Hidden");
            self.view1.hidden = YES;
            self.view1_width.constant = 0.0f;
            self.view1_height.constant = 0.0f;
            
            self.view2.hidden = YES;
            self.view2_width.constant = 0.0f;
            self.view2_height.constant = 0.0f;
            
            self.view1_view2_separation.constant = 0.0f;
            self.view1_view3_separation.constant = 0.0f;
            self.view2_view3_separation.constant = 0.0f;
            break;
        case ViewHidden_1_3:
            NSLog(@"View 1 and 3 Hidden");
            self.view1.hidden = YES;
            self.view1_width.constant = 0.0f;
            
            self.view3.hidden = YES;
            self.view3_height.constant = 0.0f;
            
            self.view1_view2_separation.constant = 0.0f;
            self.view1_view3_separation.constant = 0.0f;
            self.view2_view3_separation.constant = 0.0f;
            break;
        case ViewHidden_2_3:
            NSLog(@"View 2 and 3 Hidden");
            self.view2.hidden = YES;
            self.view2_width.constant = 0.0f;
            
            self.view3.hidden = YES;
            self.view3_height.constant = 0.0f;
            
            self.view1_view2_separation.constant = 0.0f;
            self.view1_view3_separation.constant = 0.0f;
            self.view2_view3_separation.constant = 0.0f;
            break;
        default:
            NSLog(@"View Hidden");
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
