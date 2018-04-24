//
//  ViewController.m
//  EveryDo
//
//  Created by Mike Cameron on 2018-04-24.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "ViewController.h"
#import "Todo.h"
#import "TodoTableViewCell.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray* todos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // init todos
    Todo *laundry = [[Todo alloc] initWithTitle:@"Laundry" todoDescription:@"Do towels and Cliff's PJs" priorityNumber:1 andIsCompleted:NO];
    Todo *groceries = [[Todo alloc] initWithTitle:@"Groceries" todoDescription:@"Book pick up time at Loblaws" priorityNumber:2 andIsCompleted:NO];
    Todo *readings = [[Todo alloc] initWithTitle:@"Readings" todoDescription:@"Finish Lighthouse Week 3 readings" priorityNumber:2 andIsCompleted:NO];
    Todo *waiver = [[Todo alloc] initWithTitle:@"Waiver" todoDescription:@"Sign dodgeball waiver" priorityNumber:1 andIsCompleted:NO];
    Todo *sunglasses = [[Todo alloc] initWithTitle:@"Sunglasses" todoDescription:@"Go buy cool sunglasses" priorityNumber:3 andIsCompleted:NO];
    
    // Add to array
    NSArray *todos = [[NSArray alloc] initWithObjects:laundry, groceries, readings, waiver, sunglasses, nil];
    self.todos = todos;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.todos count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todoCell" forIndexPath:indexPath];
    Todo *todo = [self.todos objectAtIndex:indexPath.row];
    cell.titleLabel.text = todo.title;
    cell.todoDesctriptionlabel.text = todo.todoDescription;
    cell.priorityNumberLabel.text = [NSString stringWithFormat:@"%ld", todo.priorityNumber];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Todo *todo = self.todos[indexPath.row];
    [self performSegueWithIdentifier:@"detailSegue" sender:todo];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *detail = (DetailViewController*)segue.destinationViewController;
    Todo *todo = (Todo*)sender;
    detail.todo = todo;

    
    
}


@end
