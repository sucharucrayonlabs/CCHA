//
//  AddressViewController.m
//  CCHA App
//
//  Created by Zachary Baker on 7/1/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()

@end

@implementation AddressViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
       
    }
    return self;
}

- (IBAction)firstmappressd:(id)sender
{
    NSURL *url=[NSURL URLWithString:@"https://www.google.com/maps/place/Church+Church+Hittle+%26+Antrim/@40.045738,-86.013395,17z/data=!3m1!4b1!4m2!3m1!1s0x8814b0d2a44b92f3:0x365b592cdd342ea2"];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)secondmappressed:(id)sender
{
    NSURL *url=[NSURL URLWithString:@"https://www.google.com/maps/place/90+E+90th+Dr/@41.4552287,-87.3338989,17z/data=!3m1!4b1!4m2!3m1!1s0x8811eef97850a38f:0x2625d0cb562529db"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
