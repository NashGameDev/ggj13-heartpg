//
//  CombatScene.h
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HeartCharacterLayer.h"
#import "EnemyCharacterLayer.h"

typedef enum {
    kGameStarting,
    kGameBattle,
    kGameTransition,
    kGameEnd
    
} GameState;

@interface CombatScene : CCScene<UIGestureRecognizerDelegate> {
    
}

@property(strong, nonatomic) HeartCharacterLayer* heartLayer;
@property(strong, nonatomic) EnemyCharacterLayer* enemyLayer;

@property(assign, nonatomic) GameState state;


@end
