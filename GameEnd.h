//
// Created by Marcin Lagowski on 07/09/14.
// Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCNode.h"


@interface GameEnd : CCNode
- (void)setMessage:(NSString *)message score:(NSInteger)score;
@end