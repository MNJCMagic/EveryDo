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
#import "MakeTodoViewController.h"

@interface ViewController ()<TodoDelegate>
@property MakeTodoViewController *makeTodoViewController;
@property (nonatomic, strong) NSMutableArray<Todo*>* todos;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic, strong) UITableView *tableView;
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
    NSMutableArray *todos = [[NSMutableArray alloc] initWithObjects:laundry, groceries, readings, waiver, sunglasses, nil];
    self.todos = todos;
    
    //delegation
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.todos count];
}

- (IBAction)cellSwiped:(UISwipeGestureRecognizer *)sender {
    NSLog(@"Swiped");
    TodoTableViewCell *todoCell = (TodoTableViewCell*)sender.view;
    NSIndexPath *path = [self.tableView indexPathForCell:todoCell];
    NSInteger i = path.row;
    self.todos[i].isCompleted = YES;
    Todo *doneTodo = self.todos[i];
    [self.todos removeObjectAtIndex:i];
    [self.todos addObject:doneTodo];
    [self.tableView reloadData];
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"todoCell" forIndexPath:indexPath];
    Todo *todo = [self.todos objectAtIndex:indexPath.row];
    cell.titleLabel.text = todo.title;
    cell.todoDesctriptionlabel.text = todo.todoDescription;
    cell.priorityNumberLabel.text = [NSString stringWithFormat:@"%ld", todo.priorityNumber];
    if (todo.isCompleted == NO) {
        cell.backgroundColor = [UIColor whiteColor];
    } else if (todo.isCompleted == YES) {
        cell.backgroundColor = [UIColor greenColor];
    }
    if (!cell.swipeRecognizer) {
        UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellSwiped:)];
        [cell addGestureRecognizer:swipeRecognizer];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Todo *todo = self.todos[indexPath.row];
    [self performSegueWithIdentifier:@"detailSegue" sender:todo];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
    DetailViewController *detail = (DetailViewController*)segue.destinationViewController;
    Todo *todo = (Todo*)sender;
        detail.todo = todo;} else if ([segue.identifier isEqualToString:@"makeTodoSegue"]) {
            MakeTodoViewController *makeTodoViewController = (MakeTodoViewController*)segue.destinationViewController;
            makeTodoViewController.delegate = self;
        }
}
- (IBAction)buttonPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"makeTodoSegue" sender:nil];
}

-(void)makeTodoViewController:(MakeTodoViewController *)viewController addTodo:(Todo *)todo {
//    [self.todos addObject:todo];
    [self.todos insertObject:todo atIndex:0];
    NSLog(@"%@", self.todos);
    [self.tableView reloadData];
}



@end
