//
//  ViewController.m
//  LabelTest
//
//  Created by Andrei Zaharia on 10/1/15.
//  Copyright © 2015 Andrei Zaharia. All rights reserved.
//

#import "ViewController.h"
#import "CustomLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CustomLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleFont:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    CGRect frame = CGRectMake(self.label.frame.origin.x,
                              self.label.frame.origin.y,
                              sender.selected ? 60.0 : 207.0,
                              self.label.frame.size.height);
    
//    [UIView animateWithDuration:0.8 animations:^{
//       [self.label setFrame: frame];
//    }];
    
    [self.label setAnimatedFrame:frame withDuration: 2.3];
}

@end
