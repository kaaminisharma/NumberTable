//
//  ViewController.h
//  numberTable
//
//  Created by student14 on 15/06/17.
//  Copyright © 2017 kaamini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *firstNo;
@property (weak, nonatomic) IBOutlet UITextField *secNo;
- (IBAction)displayTable:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *dataTable;
@property(nonatomic,retain)NSMutableArray *fillTableData;

@end

