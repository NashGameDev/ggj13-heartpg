//
//  HeartNode.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HeartNode.h"
#import "SimpleAudioEngine.h"

#define kMAX_PUMP   110
#define kSUPER_PUMP 99

@implementation HeartNode

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        CCSprite* sprite = [CCSprite spriteWithSpriteFrameName:@"heartbot.png"];
        sprite.flipX = YES;
        sprite.scale = 2.0;
        [self addChild:sprite];
        self.contentSize = sprite.contentSize;
        
        self.pumpLevel = 0;
    }
    
    return self;
}

-(void) setPumpLevel:(NSInteger)pumpLevel {
    BOOL isSuper = (_pumpLevel < kSUPER_PUMP && _pumpLevel + pumpLevel > kSUPER_PUMP);
    _pumpLevel = pumpLevel;
    self.scale = 0.5 + 2.0 * (_pumpLevel / (double) kMAX_PUMP);
    
    if (isSuper) {
        [[SimpleAudioEngine sharedEngine] playEffect:@"PumpingUp.caf"];
    }
}

-(void) pump:(NSInteger)amount {
    self.pumpLevel += amount;
    // if more than 110, generate event that heart blows up?
    if (self.pumpLevel > kMAX_PUMP) {
        self.pumpLevel = 0;
    }
}

-(void) deflate:(NSInteger)amount {
    if (self.pumpLevel > 0) {
        self.pumpLevel -= MIN(self.pumpLevel, amount);
    }
}

-(void) onEnter {
    [super onEnter];
    
    CCCallBlock* deflateAction = [CCCallBlock actionWithBlock:^{
        [self deflate:2];
    }];
    
    [self runAction:[CCRepeatForever actionWithAction: [CCSequence actionOne:deflateAction two:[CCDelayTime actionWithDuration:0.2]]]];

}

@end
