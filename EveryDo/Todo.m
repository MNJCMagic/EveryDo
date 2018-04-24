//
//  Todo.m
//  EveryDo
//
//  Created by Mike Cameron on 2018-04-24.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)initWithTitle:(NSString*)title todoDescription:(NSString*)description priorityNumber:(NSInteger)priorityNumber andIsCompleted:(BOOL)isCompleted {
 
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = description;
        _priorityNumber = priorityNumber;
        _isCompleted = isCompleted;
    }
    return self;
    
}



@end
