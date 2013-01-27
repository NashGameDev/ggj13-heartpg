//
//  EnemyCharacterLayer.h
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface EnemyCharacterLayer : CCLayer {
    
}

@property (strong, nonatomic) CCSprite* enemyGraphic;
@property (assign, nonatomic) NSInteger health;


-(NSString*) characterFrameName;

-(void) hitSide:(NSInteger)characterPower;
-(void) hitUp:(NSInteger)characterPower;

-(void) playDyingEffect;
-(void) playStartingEffect;

-(void) playHitEffect;

@end
