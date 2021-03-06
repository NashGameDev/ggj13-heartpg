//
//  HeartNode.h
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

#define kBasicPump 10

@interface HeartNode : CCNode {
    
}
@property(strong, nonatomic) CCSprite* heartGraphic;
@property(assign, nonatomic) NSInteger pumpLevel;
@property(assign, nonatomic) BOOL superPump;
@property(assign, nonatomic) ALuint currentPumpEffect;
@property(strong, nonatomic) CCParticleSystemQuad* particle;

-(void) pump:(NSInteger)amount;
-(void) deflate:(NSInteger)amount;


@end
