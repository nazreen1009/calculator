//
//  ViewController.h
//  calculator
//
//  Created by IMRAN ISMAIL on 28/08/15.
//  Copyright (c) 2015 Nazreen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    float total;
    int mode;
    NSString *valueString;
    IBOutlet UILabel *label;
    BOOL lastButtonWasMode;
    BOOL tappedDecimal;
    BOOL tappedEquals;
}

-(IBAction)tappedClear:(id)sender;
-(IBAction)tappedNumber:(UIButton*)btn;
-(IBAction)tappedAddition:(id)sender;
-(IBAction)tappedSubtraction:(id)sender;
-(IBAction)tappedEquals:(id)sender;
-(IBAction)tappedMultiplication:(id)sender;
-(IBAction)tappedDivision:(id)sender;
-(IBAction)tappedDecimal:(id)sender;


@end

