//
//  ViewController.m
//  Reimann Sums
//
//  Created by Mick on 11/12/13.
//  Copyright (c) 2013 HappTech Development. All rights reserved.
//

#import "ViewController.h"
#import "DDMathParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.startingInteger = 0;
    self.endingInteger = 4;
    self.number = 4;
}


- (IBAction)startApproximation:(UIButton *)sender
{
    self.deltaX = (CGFloat)((self.endingInteger - self.startingInteger) / (CGFloat)self.number);

    NSString *function = [[self.functionInputField.text stringByReplacingOccurrencesOfString:@"x" withString:@"($x)"] stringByReplacingOccurrencesOfString:@"^" withString:@"**"];
    NSLog(@"f(x) = %@",function);

    CGFloat total = 0;

    for (NSInteger k = self.startingInteger; k <= self.endingInteger; k ++) {

        NSDictionary *s = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:k] forKey:@"x"];
        NSNumber *fOfX = [function numberByEvaluatingStringWithSubstitutions:s];

        total += fOfX.doubleValue;
        NSLog(@"Total: %f",total);
    }

    total *= self.deltaX;

    NSLog(@"Area: %f U^2",total);
    [self.outputLabel setText:[NSString stringWithFormat:@"%.2f",total]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
