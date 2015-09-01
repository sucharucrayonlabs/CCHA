//
//  SearchViewController.h
//  CCHA App
//
//  Created by Margaret Ward on 4/12/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController <UISearchDisplayDelegate,UISearchBarDelegate, UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *arrTotalObjs,*arrSearchObjs;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
