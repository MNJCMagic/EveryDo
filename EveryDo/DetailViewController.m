//
//  DetailViewController.m
//  EveryDo
//
//  Created by Mike Cameron on 2018-04-24.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleLabel.text = self.todo.title;
    _descriptionLabel.text = self.todo.todoDescription;
    
}

- (IBAction)backPressed {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
