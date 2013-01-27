//
//  CombatScene.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CombatScene.h"
#import "SimpleAudioEngine.h"
#import "EggmanLayer.h"
#import "ArtificialHeartLayer.h"

@implementation CombatScene

-(id) init
{
	if( (self=[super init]) ) {

        self.heartLayer = [HeartCharacterLayer node];
        self.heartLayer.position = ccp(self.contentSize.width/4, self.contentSize.height/2.0);
        [self addChild:self.heartLayer];
        
        [self addEnemy:[EggmanLayer node]];
        
        // start playing the background music
        [SimpleAudioEngine sharedEngine].backgroundMusicVolume = 0.3;
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"BattleTheme1-Loop.mp3" loop:YES];
        
        [self setupGestures];
	}
    
	return self;
}

-(void) addEnemy:(EnemyCharacterLayer*)enemy {
    [self.enemyLayer removeFromParentAndCleanup:YES];
    self.enemyLayer = enemy;
    self.enemyLayer.position = ccp(self.contentSize.width/4 * 3, self.contentSize.height/2.0);
    [self addChild:self.enemyLayer];    
}

-(void) setupGestures {
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.heartLayer.pump addGestureRecognizer:tapGestureRecognizer];
    tapGestureRecognizer.delegate = self;
    
    UIGestureRecognizer *panGestureRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    panGestureRecognizer2.delegate = self;
    [self.heartLayer.pump addGestureRecognizer:panGestureRecognizer2];
    
    
    UISwipeGestureRecognizer *swipeLeftRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeSide:)];
    [swipeLeftRight setDirection:(UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft )];
    [self addGestureRecognizer:swipeLeftRight];
    
    UISwipeGestureRecognizer *swipeUpDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUpDown:)];
    [swipeUpDown setDirection:(UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown )];
    [self addGestureRecognizer:swipeUpDown];

    
}


#pragma mark - GestureRecognizer delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)handleSwipeSide:(UISwipeGestureRecognizer*)recognizer
{
    [self.enemyLayer hitSide:self.heartLayer.heart.pumpLevel];
    
    // detect death
    if (self.enemyLayer.health <= 0) {
        if ([self.enemyLayer isKindOfClass:[EggmanLayer class]]) {
            [self addEnemy:[ArtificialHeartLayer node]];
        } else {
            [self.enemyLayer removeFromParentAndCleanup:YES];
//            [[SimpleAudioEngine sharedEngine] playEffect:]
        }
        
    }
}

- (void)handleSwipeUpDown:(UISwipeGestureRecognizer*)recognizer
{
    
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
