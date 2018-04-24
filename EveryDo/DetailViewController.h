//
//  DetailViewController.h
//  EveryDo
//
//  Created by Mike Cameron on 2018-04-24.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (nonatomic) Todo* todo;

@end
