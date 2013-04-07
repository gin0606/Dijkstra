//
// Created by kkgn06 on 2013/02/09.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Dijkstra.h"
#import "Node.h"


@implementation Dijkstra {

}

- (id)init {
    if (self = [super init]) {
        srand((unsigned int) time(NULL));
        CGSize winSize = [CCDirector sharedDirector].winSize;

        // ノード入れるArray
        self.nodeArray = [NSMutableArray array];
    }
    return self;
}

- (void)dijkstra {
    [self digUpNodes:self.startPoint];
    self.startPoint.cost = 0;

    Node *doneNode = nil;
    while ((doneNode = [self doneNode]) != nil) {
        doneNode.done = YES;
        for (Node *node in doneNode.nextNodes) {
            float cost = ccpDistance(doneNode.p, node.p);
            float totalCost = doneNode.cost + cost;

            if (totalCost < node.cost || node.cost == FLT_MAX) {
                node.cost = totalCost;
                node.shortestPrevNode = doneNode;
            }
        }
    }
}

- (Node *)doneNode {
    Node *doneNode = nil;
    for (Node *node in self.nodeArray) {
        if (node.done || node.cost == FLT_MAX) {
            continue;
        }
        if (doneNode == nil || node.cost < doneNode.cost) {
            doneNode = node;
        }
    }
    return doneNode;
}

- (void)digUpNodes:(Node *)node {
    if (![self.nodeArray containsObject:node]) {
        [self.nodeArray addObject:node];
    }
    for (Node *next in node.nextNodes) {
        [self digUpNodes:next];
    }
}

- (float)greedy:(Node *)node {
    float minCost = FLT_MAX;
    float rootCost = FLT_MAX;
    for (Node *next in node.nextNodes) {
        rootCost = [self greedy:next];
        float cost = ccpDistance(node.p, next.p);
        if (cost < minCost) {
            node.shortestNextNode = next;
            minCost = cost;
        }
    }
    return minCost + rootCost;
}

@end
