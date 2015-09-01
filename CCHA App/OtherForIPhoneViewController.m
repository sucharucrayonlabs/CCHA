//
//  OtherForIPhoneViewController.m
//  CCHA App
//
//  Created by Zack Baker on 4/28/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import "OtherForIPhoneViewController.h"

@interface OtherForIPhoneViewController ()

@end

@implementation OtherForIPhoneViewController

- (IBAction)cchaGuidanceButtonPressed:(id)sender
{
    [self performSegueWithIdentifier:@"cchaGuidanceSegue2" sender:self];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([[[alertView textFieldAtIndex:0] text] isEqual:@"2580"])
    {
        [self performSegueWithIdentifier:@"cchaGuidanceSegue2" sender:self];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
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
