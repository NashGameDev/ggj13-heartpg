//
//  CombatScene.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CombatScene.h"
#import "SimpleAudioEngine.h"

@implementation CombatScene

-(id) init
{
	if( (self=[super init]) ) {

        self.heartLayer = [HeartCharacterLayer node];
        self.heartLayer.position = ccp(self.contentSize.width/4, self.contentSize.height/2.0);
        [self addChild:self.heartLayer];
        
        self.enemyLayer = [EnemyCharacterLayer node];
        self.enemyLayer.position = ccp(self.contentSize.width/4 * 3, self.contentSize.height/2.0);
        [self addChild:self.enemyLayer];
        
        // start playing the background music
        [SimpleAudioEngine sharedEngine].backgroundMusicVolume = 0.3;
//        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"BattleTheme1-Loop.mp3" loop:YES];
        
        [self setupGestures];
	}
    
	return self;
}

-(void) setupGestures {
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.heartLayer.pump addGestureRecognizer:tapGestureRecognizer];
    tapGestureRecognizer.delegate = self;
    
    UIGestureRecognizer *panGestureRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    panGestureRecognizer2.delegate = self;
    [self.heartLayer.pump addGestureRecognizer:panGestureRecognizer2];
}


#pragma mark - GestureRecognizer delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)handlePanGesture:(UIPanGestureRecognizer*)aPanGestureRecognizer
{
    CCNode *node = aPanGestureRecognizer.node;
    CGPoint translation = [aPanGestureRecognizer translationInView:aPanGestureRecognizer.view];
    translation.y *= -1;
    [aPanGestureRecognizer setTranslation:CGPointZero inView:aPanGestureRecognizer.view];
    
    node.position = ccpAdd(node.position, translation);
}

- (void)handlePinchGesture:(UIPinchGestureRecognizer*)recognizer {
    
}

- (void)handleTapGesture:(UITapGestureRecognizer*)recognizer {
    [self.heartLayer.heart pump:kBasicPump];
}



@end
