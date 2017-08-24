//
//  ViewController.m
//  List
//
//  Created by Jaison Bhatti on 2017-08-03.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewCell.h"
#import "AddItemViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate, AddItemViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *todos;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.todos = [[NSMutableArray alloc] init];

}

// REMOVING AN ITEM
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todos.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"ListTableViewCell";
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
            cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *todoText = self.todos[indexPath.row];
    cell.titleLabel.text = todoText;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Hello I was touched: %@", indexPath);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *nav = segue.destinationViewController;
    AddItemViewController *addVC = nav.viewControllers[0];
    addVC.delegate = self;
    
}

- (void)didSaveNewTodo:(NSString *)todoText {
    [self.todos addObject:todoText];
    [self.tableView reloadData];
}

// REMOVING AN ITEM 2
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        [self.todos removeObjectAtIndex:indexPath.row];
        [tableView reloadData]; // tell table to refresh now
    }
}

@end
