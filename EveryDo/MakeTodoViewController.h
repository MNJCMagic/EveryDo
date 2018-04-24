//
//  MakeTodoViewController.h
//  EveryDo
//
//  Created by Mike Cameron on 2018-04-24.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@class MakeTodoViewController;
@protocol TodoDelegate<NSObject>
-(void)makeTodoViewController:(MakeTodoViewController*)viewController addTodo:(Todo*)todo;
@end

@interface MakeTodoViewController : UIViewController
@property (nonatomic, weak)id<TodoDelegate>delegate;

@end
