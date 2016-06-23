//
//  ViewController.m
//  calenderDemo
//
//  Created by 三少 on 16/6/23.
//  Copyright © 2016年 Demo. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)btnClicked:(id)sender {
    calenderCollectionViewController *vc = [calenderCollectionViewController new];
    vc.theDay = @"33";
    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
