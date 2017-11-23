//
//  ViewController.m
//  testFont
//
//  Created by cherrydemo M on 2017/10/20.
//  Copyright © 2017年 cherrydemo M. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *egTextView;
@property (weak, nonatomic) IBOutlet UILabel *familyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fontNameLabel;

@property (nonatomic) int familyNum;
@property (nonatomic) int fontNum;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.familyNum = 0;
    self.fontNum = 0;
    
    [self dealFamilyNumAndFontNum];
    [self show];
}

- (IBAction)nextFontClick:(UIButton *)sender {
    self.fontNum++;
    [self dealFamilyNumAndFontNum];
    [self show];
}

- (void)show{
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = familyNames[self.familyNum];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = fontNames[self.fontNum];
    [self.egTextView setFont:[UIFont fontWithName:fontName size:23]];
    [self.familyNameLabel setText:[NSString stringWithFormat:@"familyName:%@",familyName]];
    [self.fontNameLabel setText:[NSString stringWithFormat:@"fontName:%@",fontName]];
    
    printf( "\tfamilyname:%s\tFont: %s \n", [familyName UTF8String],[fontName UTF8String] );
}

- (void)dealFamilyNumAndFontNum{
    NSArray *familyNames = [UIFont familyNames];
    if (self.familyNum+1 > familyNames.count) {
        self.familyNum = 0;
        self.fontNum = 0;
        [self dealFamilyNumAndFontNum];
    } else {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyNames[self.familyNum]];
        if (self.fontNum+1 > fontNames.count) {
            self.familyNum++;
            self.fontNum = 0;
            [self dealFamilyNumAndFontNum];
        }else{
            return;
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
