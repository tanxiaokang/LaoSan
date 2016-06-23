//
//  ViewController.m
//  payVIew
//
//  Created by 檀小康 on 16/5/17.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "ViewController.h"
#import "PayViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
- (IBAction)pay:(id)sender {
    
    [self presentViewController:[PayViewController new] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
