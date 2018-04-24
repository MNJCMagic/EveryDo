//
//  TodoTableViewCell.h
//  EveryDo
//
//  Created by Mike Cameron on 2018-04-24.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityNumberLabel;
@property (nonatomic) UISwipeGestureRecognizer *swipeRecognizer;
@property (weak, nonatomic) IBOutlet UILabel *todoDesctriptionlabel;

@end
