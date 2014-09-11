//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Grid.h"
@implementation MainScene {
    Grid *_grid;
    CCLabelTTF *_scoreLabel;
    CCLabelTTF *_highscoreLabel;
}

- (void)didLoadFromCCB {
    // Adding observers

    // Score observer
    [_grid addObserver:self
            forKeyPath:@"score"
               options:0
               context:NULL];

    // HighScore observer
    [NSUserDefaults.standardUserDefaults addObserver:self
                                          forKeyPath:@"highscore"
                                             options:0
                                             context:NULL];

    // load highscore
    [self updateHighscore];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    // called when observable changed
    if ([keyPath isEqualToString:@"score"]) {
        [self updateScore];
    } else if ([keyPath isEqualToString:@"highscore"]) {
        [self updateHighscore];
    }
}

- (void)updateScore {
    _scoreLabel.string = [NSString stringWithFormat:@"%d", _grid.score];
}

- (void)updateHighscore {
    NSNumber *newHighscore = [NSUserDefaults.standardUserDefaults objectForKey:@"highscore"];
    if (newHighscore) {
        _highscoreLabel.string = [NSString stringWithFormat:@"%d", newHighscore.intValue];
    }
}

- (void)dealloc {
    [_grid removeObserver:self forKeyPath:@"score"];
}
@end
