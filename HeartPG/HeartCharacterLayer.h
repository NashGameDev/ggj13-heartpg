//
//  HeartCharacterLayer.h
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HeartNode.h"

@interface HeartCharacterLayer : CCLayer<UIGestureRecognizerDelegate> {
    
}

@property(strong, nonatomic) HeartNode* heart;

@end
