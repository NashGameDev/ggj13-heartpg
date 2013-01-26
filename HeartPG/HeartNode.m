//
//  HeartNode.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HeartNode.h"
#import "SimpleAudioEngine.h"
#import "SoundEffects.h"

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
        self.touchRect = CGRectInset(CGRectMake(0, 0, self.contentSize.width, self.contentSize.height), -self.contentSize.width, -self.contentSize.height);
        
        self.pumpLevel = 0;
    }
    
    return self;
}

-(void) setPumpLevel:(NSInteger)pumpLevel {
    _pumpLevel = pumpLevel;
    self.scale = 0.5 + 2.0 * (_pumpLevel / (double) kMAX_PUMP);
}

-(void) pump:(NSInteger)amount {
    if (!self.superPump && self.pumpLevel < kSUPER_PUMP && self.pumpLevel + amount > kSUPER_PUMP) {
        // make a super pump!
        self.superPump = YES;
        [[SimpleAudioEngine sharedEngine] playEffect:kPumpingUp];
    } else {
        [[SimpleAudioEngine sharedEngine] playEffect:kHeartbeatTap];
    }
    
    
    
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
    
    if (self.pumpLevel <= 0.0f) {
        self.superPump = NO;
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
