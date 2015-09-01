//
//  PDFDisplayViewController.h
//  CCHA App
//
//  Created by Zack Baker on 1/16/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFDisplayViewController : UIViewController
{
    IBOutlet UIWebView *PDFDisplayWebView;
    UIBarButtonItem *starBarButton;
    NSMutableArray *favPDFArray;
    NSString *pdfFileName;
}

@end
