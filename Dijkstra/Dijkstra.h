//
// Created by kkgn06 on 2013/02/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Node;


@interface Dijkstra : NSObject
@property(retain, nonatomic) Node *startPoint;
@property(retain, nonatomic) Node *goalPoint;

@property(retain, nonatomic) NSMutableArray *nodeArray;

- (void)dijkstra;

- (float)greedy:(Node *)node;

@end
