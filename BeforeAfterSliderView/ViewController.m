//
//  ViewController.m
//  BeforeAfterSliderView
//
//  Created by LK on 23/05/2017.
//  Copyright © 2017 WebsoftProfession. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    wsSlider.beforeImage = [UIImage imageNamed:@"face_before.jpg"];
    wsSlider.afterImage = [UIImage imageNamed:@"face_after.jpg"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
