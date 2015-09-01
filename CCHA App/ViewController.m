//
//  ViewController.m
//  CCHA App
//
//  Created by Zack Baker on 10/13/13.
//  Copyright (c) 2013 CCHA. All rights reserved.
//

#import "ViewController.h"
#import "IndianaSpecificLawsView.h"
#import "MBProgressHUD.h"
#import "RMStore.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize firstTime;

- (void)viewDidLoad
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"firstTime"]==false)
    {
        NSString *alertString=@"\n ---- CONDITIONS OF USE ---- \n The Indiana School & Education Law Application (aka the INSchoolLaw App) aims to provide a collection of useful information. The application does not provide legal advice. The information in the application was compiled as of July 1, 2014, and may no longer be current. The developers do not warrant in any way that the information is complete or accurate. The developers disclaim all liability to any person for any use or reliance on this application or its content. \n ---- COPYRIGHT© 2014 ----\n Church Church Hittle & Antirm This application and the works of authorship contained  in it are protected by copyright, with the copyright held by Church Church Hittle & Antirm. Distribution of this app does not constitute consent to any redistribution of this copyrighted material. Church Church Hittle & Antrim does not assert copyright in US Government works, but does claim copyright in markup, navigation apparatus, and other value-added features of the electronic edition of these government publications in this application. \n ----TRADEMARK ---- \n The terms IN School Law, IN School Law, INSchool Law App, Indiana School & Education Law Application, Church Church Hittle & Antrim, the CCHA logo, and other trademarks used in this application are trademarks of Church, Church, Hittle & Antrim and may not be used without permission.";
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Church Church Hittle and Antrim" message:alertString                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        self.firstTime=true;
        [[NSUserDefaults standardUserDefaults] setBool:self.firstTime forKey:@"firstTime"];
    
    
        self.scrollView.contentSize = self.view.frame.size;
    
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)feedBackButtonPressed:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:schools2@cchalaw.com"]];
}

- (IBAction)legalButtonPressed:(id)sender
{
    NSString *alertString=@"\n ---- CONDITIONS OF USE ---- \n The Indiana School & Education Law Application (aka the INSchool Law App) aims to provide a collection of useful information. The application does not provide legal advice. The information in the application was compiled as of July 1, 2014, and may no longer be current. The developers do not warrant in any way that the information is complete or accurate. The developers disclaim all liability to any person for any use or reliance on this application or its content. \n ---- COPYRIGHT ----\n © 2014 Church Church Hittle & Antirm. This application and the works of authorship contained  in it are protected by copyright, with the copyright held by Church Church Hittle & Antirm. Distribution of this app does not constitute consent to any redistribution of this copyrighted material. Church Church Hittle & Antrim does not assert copyright in US Government works, but does claim copyright in markup, navigation apparatus, and other value-added features of the electronic edition of these government publications in this application. \n ----TRADEMARK ---- \n The terms IN School Law, IN School Law, INSchool Law App, Indiana School & Education Law Application, Church Church Hittle & Antrim, the CCHA logo, and other trademarks used in this application are trademarks of Church, Church, Hittle & Antrim and may not be used without permission.";
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Legal" message:alertString delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];
    [alert show];
}


- (IBAction)SchoolLawButton:(id)sender {
    
   // if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"bought"] isEqualToString:@"true"] ) {

    if (1==1){
    
        
        
        NSString *plistPath=[[NSBundle mainBundle] pathForResource:@"SchoolLaw" ofType:@"plist"];
        
        NSDictionary *dicMain=[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
        NSMutableDictionary *objDist=[[NSMutableDictionary alloc]initWithDictionary:[dicMain objectForKey:@"School Law"]];
        
        IndianaSpecificLawsView *indTableView= [[IndianaSpecificLawsView alloc] init];
        NSArray *array=[NSArray arrayWithObjects:@"Indiana Code",@"Indiana Administrative Code",@"Indiana Constitution",@"Federal Statutes",@"Federal Regulations",@"Select Cases", nil];
        [indTableView setTableElements:array];
        [indTableView setObjDist:objDist];
        [self.navigationController pushViewController:indTableView animated:YES];

        
//        // Data.plist coden
//        // get paths from root direcory
//        NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
//        // get documents path
//        NSString *documentsPath = [paths objectAtIndex:0];
//        // get the path to our Data/plist file
//        NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"SchoolLaw.plist"];
//        
//        // check to see if Data.plist exists in documents
//        if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
//        {
//            // if not in documents, get property list from main bundle
//            plistPath = [[NSBundle mainBundle] pathForResource:@"SchoolLaw" ofType:@"plist"];
//        }
//        
//        // read property list into memory as an NSData object
//        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
//        NSString *errorDesc = nil;
//        NSPropertyListFormat format;
//        // convert static property liost into dictionary object
//        NSDictionary *tempDist = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
//        
//        NSDictionary     *dicMain = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
//        NSMutableDictionary *objDist = [[NSMutableDictionary alloc]initWithDictionary:[dicMain objectForKey:@"School Law"]];
//        //Set the table values
//        IndianaSpecificLawsView *indTableView = [[IndianaSpecificLawsView alloc]init];
//        
//        [indTableView setTableElements:[objDist allKeys]];
//        [indTableView setObjDist:objDist];
//        [self.navigationController      pushViewController:indTableView animated:YES    ];
//        
//        NSArray *allkeys = [objDist allKeys];
//        NSArray *allVales   = [objDist allValues];
        
        
    }
    
    else{
        
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Purchase School Laws" message:@"You may now purchase access to all school laws content (relevant portions of the IC, IAC, and other select resources) for $4.99?"delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert show];
        
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeDeterminate;
        hud.labelText = @"Processing";
        [hud show:YES];
        
        NSSet *products = [NSSet setWithArray:@[@"IC1"]];
        [[RMStore defaultStore] requestProducts:products success:^(NSArray *products, NSArray *invalidProductIdentifiers) {
            NSLog(@"Products loaded");
            
            
            [[RMStore defaultStore] addPayment:@"IC1" success:^(SKPaymentTransaction *transaction) {
                NSLog(@"Purchased!");
                
                NSString *hasBeenBought = @"true";
                [hud hide:YES];
                
                [[NSUserDefaults standardUserDefaults] setObject:hasBeenBought forKey:@"bought"];
            } failure:^(SKPaymentTransaction *transaction, NSError *error) {
                NSLog(@"Something went wrong");
                [hud hide:YES];
                
            }];
            
            
        } failure:^(NSError *error) {
            NSLog(@"Something went wrong");
            [hud hide:YES];
            
        }];
        
        
        
    }
    
    
}
- (IBAction)titlePressed:(id)sender {
   if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"bought"] isEqualToString:@"true"])
   {
    
        
        [self performSegueWithIdentifier:@"CaseSearch" sender:self];
    }
    
  
    else
    
    {
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Purchase School Laws" message:@"You may now purchase access to all school laws content (relevant portions of the IC, IAC, and other select resources) for $4.99?"delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert show];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.labelText = @"Processing";
    [hud show:YES];
    
    NSSet *products = [NSSet setWithArray:@[@"IC1"]];
    [[RMStore defaultStore] requestProducts:products success:^(NSArray *products, NSArray *invalidProductIdentifiers) {
        NSLog(@"Products loaded");
        
        
        [[RMStore defaultStore] addPayment:@"IC1" success:^(SKPaymentTransaction *transaction) {
            NSLog(@"Purchased!");
            
            NSString *hasBeenBought = @"true";
            [hud hide:YES];
            
            [[NSUserDefaults standardUserDefaults] setObject:hasBeenBought forKey:@"bought"];
        } failure:^(SKPaymentTransaction *transaction, NSError *error) {
            NSLog(@"Something went wrong");
            [hud hide:YES];
            
        }];
        
        
    } failure:^(NSError *error) {
        NSLog(@"Something went wrong");
        [hud hide:YES];
        
    }];
    }
    
    
}
- (IBAction)restorePurchasePressed:(id)sender {
    
    //inside of an IBaction
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeDeterminate;
//    hud.labelText = @"Processing";
//    [hud show:YES];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue]restoreCompletedTransactions];
    //[hud show:NO];
}

// Then this is called
- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue {
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeDeterminate;
//    hud.labelText = @"Processing";
//    [hud show:YES];
    NSLog(@"%@",queue );
    NSLog(@"Restored Transactions are once again in Queue for purchasing %@",[queue transactions]);
    
    NSMutableArray *purchasedItemIDs = [[NSMutableArray alloc] init];
    NSLog(@"received restored transactions: %i", queue.transactions.count);
    
    for (SKPaymentTransaction *transaction in queue.transactions) {
        NSString *productID = transaction.payment.productIdentifier;
        [purchasedItemIDs addObject:productID];
        NSLog (@"product id is %@" , productID);
        // here put an if/then statement to write files based on previously purchased items
        // example if ([productID isEqualToString: @"youruniqueproductidentifier]){write files} else { nslog sorry}
        if ([productID isEqualToString:@"IC1"])
        {
            NSString *hasBeenBought = @"true";
            [[NSUserDefaults standardUserDefaults] setObject:hasBeenBought forKey:@"bought"];
            //[hud show:NO];
        }
        else{
            //[hud show:NO];
        }
        //[hud show:NO];
    }
    //[hud show:NO];
}


@end
