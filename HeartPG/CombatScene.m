//
//  CombatScene.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CombatScene.h"
#import "SoundEffects.h"
#import "EggmanLayer.h"
#import "ArtificialHeartLayer.h"

@implementation CombatScene

-(id) init
{
	if( (self=[super init]) ) {
        CCSprite* background = [CCSprite spriteWithSpriteFrameName:@"background-small.png"];
        background.scaleX = self.contentSize.width / background.contentSize.width;
        background.scaleY = self.contentSize.height / background.contentSize.height;
        background.anchorPoint = ccp(0, 0);
        [self addChild:background];
        
        self.state = kGameStarting;
        self.heartLayer = [HeartCharacterLayer node];
        self.heartLayer.position = ccp(self.contentSize.width/4, self.contentSize.height/2.0);
        [self addChild:self.heartLayer];
        
        [self addEnemy:[EggmanLayer node]];
        
        // start playing the background music
        [SimpleAudioEngine sharedEngine].backgroundMusicVolume = 0.3;        
        [self setupGestures];
	}
    
	return self;
}

-(void) startBattle {
    self.state = kGameBattle;
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"BattleTheme1-Loop.mp3" loop:YES];
}

-(void) addEnemy:(EnemyCharacterLayer*)enemy {
    [self.enemyLayer removeFromParentAndCleanup:YES];
    self.enemyLayer = enemy;
    self.enemyLayer.position = ccp(self.contentSize.width/4 * 3, self.contentSize.height/2.0);
    [self addChild:self.enemyLayer];
    [self.enemyLayer playStartingEffect];
    [self scheduleOnce:@selector(startBattle) delay:2.8];
}

-(void) setupGestures {
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.heartLayer.pump addGestureRecognizer:tapGestureRecognizer];
    tapGestureRecognizer.delegate = self;
    
    
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

-(void) completeTransitionToNextEnemy {
    if ([self.enemyLayer isKindOfClass:[EggmanLayer class]]) {
        [self addEnemy:[ArtificialHeartLayer node]];
    } else {
        // you win completely?
    }
}

-(void) doTransitionToNextEnemy {
    self.state = kGameTransition;
    [[SimpleAudioEngine sharedEngine] preloadEffect:kArtificialMalfunctioning];
    [[SimpleAudioEngine sharedEngine] stopEffect:self.heartLayer.heart.currentPumpEffect];
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    [self.enemyLayer playDyingEffect];
    [[SimpleAudioEngine sharedEngine] playEffect:kBattleThemeWin pitch:1.0f pan:0.0f gain:0.1f];
    [self.enemyLayer.enemyGraphic runAction:[CCMoveBy actionWithDuration:0.3 position:ccp(self.enemyLayer.enemyGraphic.position.x, -self.contentSize.height*2)]];

    [self scheduleOnce:@selector(completeTransitionToNextEnemy) delay:4.8];
}


- (void)handleSwipeSide:(UISwipeGestureRecognizer*)recognizer
{
    if (self.state != kGameBattle) return;
    
    [self.enemyLayer hitSide:self.heartLayer.heart.pumpLevel];
    
    // detect death
    if (self.enemyLayer.health <= 0) {
        [self doTransitionToNextEnemy];        
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
    if (self.state != kGameBattle) return;
    [self.heartLayer.heart pump:kBasicPump];
    [self.heartLayer.pump stopAllActions];
    [self.heartLayer.pump runAction:[CCSequence actionOne:[CCScaleTo actionWithDuration:0.1 scale:0.8] two:[CCScaleTo actionWithDuration:0.1 scale:1.0]] ];
    self.heartLayer.health -= 5;
}



@end
