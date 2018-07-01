//
//  ViewController.m
//  SplitCheck
//
//  Created by Huang on 6/30/18.
//  Copyright © 2018 Frozt. All rights reserved.
//

#import "ViewController.h"
#import "TransactionCell.h"

#define DEFAULT_TRANSACTION_SIZE 3

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITableView *scTableView;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic) UIGestureRecognizer *tapper;

@end

@implementation ViewController

- (NSMutableArray *)items
{
    if (!_items)
    {
        _items = [NSMutableArray new];
        for (NSInteger i=0; i< DEFAULT_TRANSACTION_SIZE; i++)
            [_items addObject: [Transaction new]];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    self.tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:self.tapper];
}

- (IBAction)addOne:(id)sender {
    [self.items addObject: [Transaction new]];
    [self.scTableView reloadData];
}

- (IBAction)removeAll:(id)sender {
    self.items = [NSMutableArray new];
    [self.scTableView reloadData];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender {
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    [self.view endEditing:YES];
}


#pragma mark Row methods

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView Methods

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TransactionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"transactionCell"];
    if (!cell)
    {
        [tableView registerNib:[UINib nibWithNibName:@"TransactionCell" bundle:nil] forCellReuseIdentifier:@"transactionCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"transactionCell"];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(TransactionCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.beforeTaxField.keyboardType = UIKeyboardTypeDecimalPad;
    cell.beforeTaxField.placeholder = @"Price";
    cell.afterTaxField.enabled = NO;
    cell.afterTaxField.text = @"0";
    cell.descriptionField.keyboardType = UIKeyboardTypeDefault;
    cell.descriptionField.placeholder = @"Description";
    
}

@end
