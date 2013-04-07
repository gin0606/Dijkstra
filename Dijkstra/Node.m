//
// Created by kkgn06 on 2013/02/07.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Node.h"


@implementation Node {

}

+ (id)nodeWithX:(float)x y:(float)y {
    return [[[self alloc] initWithX:x y:y] autorelease];
}

+ (id)nodeWithPoint:(CGPoint)point {
    return [[[self alloc] initWithPoint:point] autorelease];
}

- (id)initWithX:(float)x y:(float)y {
    return [self initWithPoint:ccp(x, y)];
}

- (id)initWithPoint:(CGPoint)point {
    if (self = [super init]) {
        _p = point;
        self.nextNodes = [NSMutableArray array];
        self.prevNodes = [NSMutableArray array];
        self.cost = FLT_MAX;
    }
    return self;
}

- (void)addNextVector:(Node *)node {
    [self.nextNodes addObject:node];
    if (![node.prevNodes containsObject:self]) {
        [node.prevNodes addObject:self];
    }
}

- (void)addPrevVector:(Node *)node {
    [self.prevNodes addObject:node];
    if (![node.nextNodes containsObject:self]) {
        [node.nextNodes addObject:self];
    }
}

- (void)setShortestNextNode:(Node *)shortestNextNode {
    if (_shortestNextNode != shortestNextNode) {
        [_shortestNextNode release];
        _shortestNextNode = [shortestNextNode retain];
        shortestNextNode.shortestPrevNode = self;
    }
}

- (void)setShortestPrevNode:(Node *)shortestPrevNode {
    if (_shortestPrevNode != shortestPrevNode) {
        [_shortestPrevNode release];
        _shortestPrevNode = [shortestPrevNode retain];
        shortestPrevNode.shortestNextNode = self;
    }
}

- (void)dealloc {
    self.nextNodes = nil;
    self.prevNodes = nil;
    self.shortestNextNode = nil;
    self.shortestPrevNode = nil;
    [super dealloc];
}

@end
