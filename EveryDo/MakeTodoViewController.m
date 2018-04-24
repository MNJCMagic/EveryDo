//
//  MakeTodoViewController.m
//  EveryDo
//
//  Created by Mike Cameron on 2018-04-24.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "MakeTodoViewController.h"


@interface MakeTodoViewController () <UITextFieldDelegate, UITextViewDelegate>
@property (nonatomic) NSString* todoTitle;
@property (nonatomic) NSString* todoDescription;
@property (weak, nonatomic) IBOutlet UITextView *todoDescriptionField;
@property (weak, nonatomic) IBOutlet UITextField *todoTitleField;
@property (nonatomic) Todo* todo;
@property (weak, nonatomic) IBOutlet UITextField *priorityField;
@property (nonatomic) NSString* priorityLevel;
@end

@implementation MakeTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.todoTitleField.delegate = self;
    self.priorityField.delegate = self;
    self.todoDescriptionField.delegate = self;
    self.todoTitleField.tag = 1;
    self.priorityField.tag = 2;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {

    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView {
    return YES;
}

- (IBAction)doneTapped {
    self.todoTitle = self.todoTitleField.text;
    self.todoDescription = self.todoDescriptionField.text;
    self.priorityLevel = self.priorityField.text;
    Todo *todo = [[Todo alloc] initWithTitle:self.todoTitle todoDescription:self.todoDescription priorityNumber:[self.priorityLevel integerValue] andIsCompleted:NO];
    self.todo = todo;
    NSLog(@"%@, %ld, %@", self.todo.title, self.todo.priorityNumber, self.todo.todoDescription);
    [self.delegate makeTodoViewController:self addTodo:self.todo];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
