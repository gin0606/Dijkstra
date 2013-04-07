//
//  HelloWorldLayer.h
//  Dijkstra
//
//  Created by kkgn06 on 2013/02/09.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


#import "CCLayer.h"

@class CCScene;
@class Dijkstra;

@interface HelloWorldLayer : CCLayer {
}

+ (CCScene *)scene;

@property(nonatomic, retain) Dijkstra *dijkstra;
@end
