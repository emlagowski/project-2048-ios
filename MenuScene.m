//
// Created by Marcin Lagowski on 10/09/14.
// Copyright (c) 2014 Apportable. All rights reserved.
//

#import "MenuScene.h"
#import "MainScene.h"


@implementation MenuScene {
    CCButton *_playButton;
}


-(void) onPlayClicked{
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:mainScene];
}
@end