//
//  HelloWorldLayer.m
//  Dijkstra
//
//  Created by kkgn06 on 2013/02/09.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


#import "HelloWorldLayer.h"
#import "Dijkstra.h"
#import "Node.h"

@implementation HelloWorldLayer {
}

+ (CCScene *)scene {
    CCScene *scene = [CCScene node];
    HelloWorldLayer *layer = [HelloWorldLayer node];
    [scene addChild:layer];

    return scene;
}

- (id)init {
    if ((self = [super init])) {
        self.dijkstra = [[[Dijkstra alloc] init] autorelease];

        Node *start = [Node nodeWithPoint:ccp(20, 20)];
        self.dijkstra.startPoint = start;
        Node *node1 = [Node nodeWithPoint:ccp(100, 40)];
        Node *node2 = [Node nodeWithPoint:ccp(50, 200)];
        [start addNextVector:node1];
        [start addNextVector:node2];

        Node *goal = [Node nodeWithPoint:ccp(300, 300)];
        [goal addPrevVector:node1];
        [goal addPrevVector:node2];
        self.dijkstra.goalPoint = goal;

        [self.dijkstra dijkstra];
        [self.dijkstra greedy:start];
    }
    return self;
}

- (void)draw {
    ccDrawColor4B(255, 255, 255, 255);
    [self drawEdges:self.dijkstra.startPoint];

    ccDrawColor4B(0, 0, 255, 255);
    ccDrawPoint(self.dijkstra.goalPoint.p);

    [self unschedule:@selector(step)];
    ccDrawColor4B(255, 0, 0, 255);
//    __block void (^drawGoalRoot)(Node *) = ^(Node *v) {
//        if (v.shortestNextNode) {
//            [self drawLine:v destination:v.shortestNextNode];
//            drawGoalRoot(v.shortestNextNode);
//        }
//    };
//    drawGoalRoot(self.dijkstra.startPoint);

    __block void (^drawGoalRoot2)(Node *) = ^(Node *v) {
        if (v.shortestPrevNode) {
            [self drawLine:v destination:v.shortestPrevNode];
            drawGoalRoot2(v.shortestPrevNode);
        }
    };
    drawGoalRoot2(self.dijkstra.goalPoint);

}

- (void)drawEdges:(Node *)startPoint {
    for (Node *v2 in startPoint.nextNodes) {
        [self drawEdges:v2];
        [self drawLine:startPoint destination:v2];
    }
}

- (void)drawLine:(Node *)origin destination:(Node *)destination {
    ccDrawLine(origin.p, destination.p);
}

- (void)dealloc {
    self.dijkstra = nil;
    [super dealloc];
}
@end
