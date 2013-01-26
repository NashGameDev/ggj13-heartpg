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

@interface CombatScene : CCScene {
    
}

@property(strong, nonatomic) HeartCharacterLayer* heartLayer;
@property(strong, nonatomic) EnemyCharacterLayer* enemyLayer;

@end
