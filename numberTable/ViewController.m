//
//  ViewController.m
//  numberTable
//
//  Created by student14 on 15/06/17.
//  Copyright © 2017 kaamini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataTable.delegate=self;
    _dataTable.dataSource=self;
    
    // to calculate table when table is scroll down
    UIRefreshControl *refreshTable=[[UIRefreshControl alloc]init];
    
    [refreshTable addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    // add refreshcontrol object to table as subview, it adds refresh obj before to the table view
    [_dataTable addSubview:refreshTable];
    
}

// scroll down table then do the calculations from text fields to display table
-(void)handleRefresh:(UIRefreshControl *)refreshTable
{
    _fillTableData=[[NSMutableArray alloc]init];
    int fno=[_firstNo.text intValue];
    int sno=[_secNo.text intValue];
    
    
    for(int i=1;i<=sno;i++)
    {
        int mult=fno*i;
        NSString *resultStr=[NSString stringWithFormat:@"%d * %d = %d",fno,i,mult];
        [_fillTableData addObject:resultStr];
    }
    
    [_dataTable reloadData];
    
    // to release the refreshing
    [refreshTable endRefreshing];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)displayTable:(id)sender {
    
    _fillTableData=[[NSMutableArray alloc]init];
    int fno=[_firstNo.text intValue];
    int sno=[_secNo.text intValue];
    
    
    for(int i=1;i<=sno;i++)
    {
       int mult=fno*i;
        NSString *resultStr=[NSString stringWithFormat:@"%d * %d = %d",fno,i,mult];
        [_fillTableData addObject:resultStr];
    }
    
    [_dataTable reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _fillTableData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text=[_fillTableData objectAtIndex:indexPath.row];
    
    return cell;
}

@end
