//
//  ContactUsViewController.m
//  CCHA App
//
//  Created by Zack Baker on 2/26/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *ContanctScrollViewIPAD;

@end

@implementation ContactUsViewController

- (IBAction)websiteButtonPress:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cchalaw.com/"]];
}

- (IBAction)callPhoneButton:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:3177732190"]];
}

- (IBAction)followTwitterButton:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/SchoolCounsel"]];
}
- (IBAction)followTwitterButtonOther:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/cchalaw"]];
}

- (IBAction)followFacebookButton:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/pages/Church-Church-Hittle-Antrim/719893564748073"]];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (IBAction)emailbuttonpressed:(id)sender
{
    NSString *recipients = @"mailto:schools2@cchalaw.com?&subject=Inquiry";
    
    NSString *body = @"&body= \n \n \n \nSent from CCHA App";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (IBAction)ipademailbuttonpressed:(id)sender
{
    NSString *recipients = @"mailto:schools2@cchalaw.com?&subject=Inquiry";
    
    NSString *body = @"&body= \n \n \n \nSent from CCHA App";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ContanctScrollViewIPAD.contentSize = self.view.frame.size;
    if (self.ContanctScrollViewIPAD.isScrollEnabled) {
        NSLog(@"YES!! on Contanctlist");
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
