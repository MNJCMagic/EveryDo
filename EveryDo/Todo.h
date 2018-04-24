//
//  Todo.h
//  EveryDo
//
//  Created by Mike Cameron on 2018-04-24.
//  Copyright © 2018 Mike Cameron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic) NSString* title;
@property (nonatomic) NSString* todoDescription;
@property (nonatomic) NSInteger priorityNumber;
@property (nonatomic) BOOL isCompleted;

-(instancetype)initWithTitle:(NSString*)title todoDescription:(NSString*)description priorityNumber:(NSInteger)priorityNumber andIsCompleted:(BOOL)isCompleted;
@end
