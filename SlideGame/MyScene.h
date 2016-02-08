//
//  MyScene.h
//  SlideGame
//

//  Copyright (c) 2014 Lucas. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MyScene : SKScene{
    SKSpriteNode *backView;
    SKSpriteNode *spawnView;
    SKLabelNode *levelLabel;
    SKSpriteNode *endScreen;
    //mainMenu
    SKSpriteNode *playButton;
    SKSpriteNode *dashButton;
    SKSpriteNode *settingsButton;
    SKSpriteNode *retroButton;
    SKSpriteNode *scoresButton;
    SKSpriteNode *rateButton;
    SKSpriteNode *blackBackground;
    //settings
    SKSpriteNode *settingsView;
    SKSpriteNode *oneColourSettings;
    SKSpriteNode *twoColourSettings;
    SKSpriteNode *threeColourSettings;
    SKSpriteNode *soundSettings;
    //loseScreen
    SKSpriteNode *loseView;
    //top bar
    SKSpriteNode *topBar;
    SKLabelNode *scoreLabel;
    SKLabelNode *timeLabel;
    //♥
    SKLabelNode *livesLabel;
    //gameLevels
    SKSpriteNode *primeEasyButton;
    SKSpriteNode *primeMediumButton;
    SKSpriteNode *primeHardButton;
    SKSpriteNode *dashTwentySecButton;
    SKSpriteNode *dashThirtySecButton;
    SKSpriteNode *dashSixtySecButton;
    SKSpriteNode *retroOneLivesButton;
    SKSpriteNode *retroThreeLivesButton;
    SKSpriteNode *retroFiveLivesButton;
    
    UIColor *firstColor;
    UIColor *secondColor;
    UIColor *thirdColor;
    UIColor *firstFontColor;
    UIColor *secondFontColor;
    UIColor *thirdFontColor;
    
    
    int colour;
    int compColour;
    NSTimer *timer;
    NSTimer *g2TImer;
    BOOL start;
    int score;
    int lives;
    double time;
    int timeAndSpeedSave;
    double speed;
    double realSpeed;
    int level;
    int misses;
    int waitSpawn;
    int speedSub;
    int timerSpeed;
    int spawns;
    int specialSpawn;
    int gameType;
}

@end
