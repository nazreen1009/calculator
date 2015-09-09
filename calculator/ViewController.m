//
//  ViewController.m
//  calculator
//
//  Created by Nazreen Imran on 28/08/15.
//  Copyright (c) 2015 Nazreen. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    valueString= @"";
    
    label.layer.borderColor = [UIColor colorWithRed:171.0/255.0
                                              green:171.0/255.0
                                               blue:171.0/255.0
                                              alpha:1.0].CGColor;
    label.layer.borderWidth = 3.0;
    label.layer.cornerRadius = 15.0;
    label.layer.shadowOpacity = 0.25;
    self.view.layer.frame = CGRectInset(self.view.layer.frame, 20, 20);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tappedClear:(id)sender
{
    total=0;
    valueString=@"";
    label.text = @"0";
    mode=0;
    tappedDecimal = NO;
    tappedEquals = NO;
}
-(IBAction)tappedNumber:(UIButton*)btn
{
    if (tappedEquals == NO)
    {
    int num = (int) btn.tag;
    if (num == 0 && total ==0)
    {
        return;
    }
    if (lastButtonWasMode) {
        lastButtonWasMode = NO;
        valueString = @"";
    }
    NSString *numAsString = [NSString stringWithFormat:@"%i", num];
    valueString = [valueString stringByAppendingString:numAsString];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *n = [formatter numberFromString:valueString];
    label.text = [formatter stringFromNumber:n];
    if(total==0)
    {
        total = [valueString floatValue];
    }
    }
    else
    {
        total=0;
        valueString=@"";
        label.text = @"0";
        mode=0;
        tappedEquals = NO;
    }
}
-(IBAction)tappedDecimal:(id)sender
{
    if (tappedDecimal == NO) // decimal is tapped first time for input1
    {
        valueString = [valueString stringByAppendingFormat:@"."];
        label.text = valueString;
        tappedDecimal = YES;
    }
}

-(IBAction)tappedAddition:(id)sender
{
    [self setMode:1];
    tappedDecimal = NO;

}
-(IBAction)tappedSubtraction:(id)sender
{
    [self setMode:2];
    tappedDecimal = NO;
    
}
-(IBAction)tappedMultiplication:(id)sender
{
    [self setMode: 3];
    tappedDecimal = NO;
    
}
-(IBAction)tappedDivision:(id)sender
{
    [self setMode: 4];
    tappedDecimal = NO;
    
}
-(IBAction)tappedEquals:(id)sender
{
    if (mode==0) {
        return;
    }
    if (mode== 1) {
        total+= [valueString floatValue];
    }
    if (mode== 2) {
        total-= [valueString floatValue];
    }
    if (mode ==3) {
        total*= [valueString floatValue];
    }
    if (mode ==4) {
        total/= [valueString floatValue];
    }
    valueString=[NSString stringWithFormat:@"%g", total];
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *n = [formatter numberFromString:valueString];
    label.text = [formatter stringFromNumber:n];
    mode=0;
    tappedEquals = YES;
    tappedDecimal = NO;
}

-(void)setMode:(int)m
{
    if (total==0) {
        return;
    }
    mode= m;
    lastButtonWasMode= YES;
    total = [valueString floatValue];
}

@end
