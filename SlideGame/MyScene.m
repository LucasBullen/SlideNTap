//
//  MyScene.m
//  SlideGame
//
//  Created by Lucas on 2014-05-29.
//  Copyright (c) 2014 Lucas. All rights reserved.
//
/*
 Things to do
-music (different styles)
 -settings
    -music I/0
    -reset I/0
    -Unlock game modes / other music / colours all for $0.99
    -credits
-game center
-rate
-PLAY page
-first start tutorial
 */

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        
        //top bar
        topBar = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(480,20)];
        topBar.position = CGPointMake(240, 310);
        [self addChild:topBar];
        //scoreLabel
        scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        scoreLabel.text = [NSString stringWithFormat:@""];
        scoreLabel.fontColor = [UIColor blackColor];
        scoreLabel.fontSize = 20;
        scoreLabel.position = CGPointMake(-120, -7);
        [topBar addChild:scoreLabel];
        //livesLable
        livesLabel = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        livesLabel.text = [NSString stringWithFormat:@""];
        livesLabel.fontColor = [UIColor blackColor];
        livesLabel.fontSize = 20;
        livesLabel.position = CGPointMake(-90, -7);
        [topBar addChild:livesLabel];
        //timeLable
        timeLabel = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        timeLabel.text = [NSString stringWithFormat:@""];
        timeLabel.fontColor = [UIColor blackColor];
        timeLabel.fontSize = 20;
        timeLabel.position = CGPointMake(-60, -7);
        [topBar addChild:timeLabel];
    }
    [self createMainMenu];
    return self;
}
-(void)createMainMenu{
    //get colours
    if (1==1) {
        NSError *error;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
        NSString *documentsDirectory = [paths objectAtIndex:0]; //2
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"]; //3
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if (![fileManager fileExistsAtPath: path]) //4
        {
            NSString *bundle = [[NSBundle mainBundle] pathForResource:@"settings" ofType:@"plist"]; //5
            
            [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
        }
        
        NSMutableArray *array2=[[NSMutableArray alloc] initWithContentsOfFile:path];
        for (int x=1; x<4; x++) {
            UIColor *theColor;
            UIColor *theOtherColor;
            NSNumber *theNumber = array2[x];
            
            switch ([theNumber intValue]) {
                case 1:
                    theOtherColor=[UIColor whiteColor];
                    theColor=[UIColor redColor];
                    break;
                case 2:
                    theOtherColor=[UIColor whiteColor];
                    theColor=[UIColor orangeColor];
                    break;
                case 3:
                    theOtherColor=[UIColor blackColor];
                    theColor=[UIColor yellowColor];
                    break;
                case 4:
                    theOtherColor=[UIColor blackColor];
                    theColor=[UIColor greenColor];
                    break;
                case 5:
                    theOtherColor=[UIColor whiteColor];
                    theColor=[UIColor blueColor];
                    break;
                case 6:
                    theOtherColor=[UIColor whiteColor];
                    theColor=[UIColor purpleColor];
                    break;
                default:
                    break;
            }
            if (x==1) {
                firstColor=theColor;
                firstFontColor=theOtherColor;
            }else if (x==2){
                secondColor=theColor;
                secondFontColor=theOtherColor;
            }else if (x==3){
                thirdColor=theColor;
                thirdFontColor=theOtherColor;
            }
        }
    }

    //blackBackground.position = CGPointMake(240, 150);
    //[self addChild:blackBackground];
    //top part
    if (1==1) {
        SKAction *move =[SKAction moveByX:-480 y:0 duration:1];
        move.timingMode =SKActionTimingEaseInEaseOut;
        playButton=[SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(160, 150)];
        playButton.name=@"playButton";
        playButton.zPosition=2;
        playButton.position = CGPointMake(560, 225);
        [self addChild:playButton];
        SKLabelNode *playLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        playLabel.fontColor = thirdFontColor;
        playLabel.text = [NSString stringWithFormat:@"PRIME"];
        playLabel.fontSize = 20;
        playLabel.name=@"playButton";
        playLabel.position = CGPointMake(0, 0);
        [playButton addChild:playLabel];
        SKAction *wait = [SKAction waitForDuration:0.0];
        SKAction *Full=[SKAction sequence:@[move,wait]];
        [playButton runAction:Full];
        
        
        dashButton=[SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(160, 150)];
        dashButton.name=@"dashButton";
        dashButton.zPosition=0;
        dashButton.position = CGPointMake(720, 225);
        [self addChild:dashButton];
        SKLabelNode *customLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        customLabel.text = [NSString stringWithFormat:@"DASH"];
        customLabel.fontColor = secondFontColor;
        customLabel.fontSize = 20;
        customLabel.name=@"dashButton";
        customLabel.position = CGPointMake(0, 0);
        [dashButton addChild:customLabel];
        SKAction *wait1 = [SKAction waitForDuration:0.3];
        SKAction *Full1=[SKAction sequence:@[wait1,move]];
        [dashButton runAction:Full1];
        
        settingsButton=[SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(160, 150)];
        settingsButton.name=@"settingsButton";
        settingsButton.zPosition=1;
        settingsButton.position = CGPointMake(880, 225);
        [self addChild:settingsButton];
        SKLabelNode *settingsLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        settingsLabel.text = [NSString stringWithFormat:@"SETTINGS"];
        settingsLabel.fontColor = firstFontColor;
        settingsLabel.fontSize = 20;
        settingsLabel.name=@"settingsButton";
        settingsLabel.position = CGPointMake(0, 0);
        [settingsButton addChild:settingsLabel];
        
        SKAction *wait2 = [SKAction waitForDuration:0.6];
        SKAction *Full2=[SKAction sequence:@[wait2,move]];
        [settingsButton runAction:Full2];
    }
    //bottom part
    if (1==1) {
        SKAction *move =[SKAction moveByX:480 y:0 duration:1];
        move.timingMode =SKActionTimingEaseInEaseOut;
        
       retroButton=[SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(160, 150)];
        retroButton.name=@"retroButton";
        retroButton.zPosition=1;
        retroButton.position = CGPointMake(-400, 75);
        [self addChild:retroButton];
        SKLabelNode *macrolithLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        macrolithLabel.text = [NSString stringWithFormat:@"RETRO"];
        macrolithLabel.fontColor = secondFontColor;
        macrolithLabel.fontSize = 20;
        macrolithLabel.name=@"retroButton";
        macrolithLabel.position = CGPointMake(0, 0);
        [retroButton addChild:macrolithLabel];
        SKAction *wait3 = [SKAction waitForDuration:0.6];
        SKAction *Full=[SKAction sequence:@[wait3,move]];
        [retroButton runAction:Full completion:^(void){
            [settingsView removeFromParent];
            [loseView removeFromParent];
            [endScreen removeFromParent];
            blackBackground.color=[UIColor blackColor];
        }];
        
        
        scoresButton=[SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(160, 150)];
        scoresButton.name=@"scoresButton";
        scoresButton.zPosition=1;
        scoresButton.position = CGPointMake(-240, 75);
        [self addChild:scoresButton];
        SKLabelNode *scoresLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        scoresLabel.text = [NSString stringWithFormat:@"SCORES"];
        scoresLabel.fontSize = 20;
        scoresLabel.fontColor=firstFontColor;
        scoresLabel.name=@"scoresButton";
        scoresLabel.position = CGPointMake(0, 0);
        [scoresButton addChild:scoresLabel];
        SKAction *wait13 = [SKAction waitForDuration:0.3];
        SKAction *Full1=[SKAction sequence:@[wait13,move]];
        [scoresButton runAction:Full1];
        
        rateButton=[SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(160, 150)];
        rateButton.name=@"rateButton";
        rateButton.zPosition=1;
        rateButton.position = CGPointMake(-80, 75);
        [self addChild:rateButton];
        SKLabelNode *rateLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        rateLabel.text = [NSString stringWithFormat:@"RATE"];
        rateLabel.fontSize = 20;
        rateLabel.fontColor = thirdFontColor;
        rateLabel.name=@"rateButton";
        rateLabel.position = CGPointMake(0, 0);
        [rateButton addChild:rateLabel];
        
        SKAction *wait23 = [SKAction waitForDuration:0.0];
        SKAction *Full2=[SKAction sequence:@[wait23,move]];
        [rateButton runAction:Full2];
    }
    
}
-(void)leaveMainMenu{
    backView.color=[UIColor whiteColor];
    realSpeed=1;
    SKAction *rotate =[SKAction rotateByAngle:420 duration:0.3];
    SKAction *shrink =[SKAction scaleXBy:0.001 y:0.001 duration:0.3];
    SKAction *remove =[SKAction removeFromParent];
    SKAction *despawnTogether =[SKAction group:@[rotate, shrink]];
    //play
    SKAction *playAct =[SKAction sequence:@[despawnTogether,remove]];
    [playButton runAction:playAct];
    //custom
    SKAction *moveCust=[SKAction moveByX:-160 y:0 duration:0.3];
    SKAction *customAct =[SKAction sequence:@[moveCust, despawnTogether,remove]];
    [dashButton runAction:customAct];
    //settings
    SKAction *moveSettings=[SKAction moveByX:-320 y:0 duration:0.6];
    SKAction *settingsAct =[SKAction sequence:@[moveSettings, despawnTogether,remove]];
    [settingsButton runAction:settingsAct];
    //rate
    SKAction *rateAct =[SKAction sequence:@[despawnTogether,remove]];
    [rateButton runAction:rateAct];
    //scores
    SKAction *moveScore=[SKAction moveByX:160 y:0 duration:0.3];
    SKAction *scoreAct =[SKAction sequence:@[moveScore, despawnTogether,remove]];
    [scoresButton runAction:scoreAct];
    //macrolith
    SKAction *moveMac=[SKAction moveByX:320 y:0 duration:0.6];
    SKAction *macAct =[SKAction sequence:@[moveMac, despawnTogether,remove]];
    [retroButton runAction:macAct];
    
    //SKAction *fadeOut=[SKAction fadeOutWithDuration:1];
    //SKAction *black =[SKAction sequence:@[fadeOut,remove]];
    //[blackBackground runAction:black];
    
}
-(void)slideBack:(SKNode *)node{
    NSString *firstLetter;
    firstLetter = [node.name substringToIndex:1];
   // NSLog(@"%@",firstLetter);
    if ([firstLetter isEqualToString:@"p"]) {
        [self dashHide];
        [self retroHide];
    }
    if ([firstLetter isEqualToString:@"d"]) {
        [self primeHide];
        [self retroHide];
    }
    if ([firstLetter isEqualToString:@"r"]) {
        [self dashHide];
        [self primeHide];
    }
}
-(void)primeHide{
    SKAction *move =[SKAction moveByX:-200 y:0 duration:0.3];
    SKAction *wait = [SKAction waitForDuration:0.0];
    SKAction *remove =[SKAction removeFromParent];
    SKAction *Full=[SKAction sequence:@[move,wait,remove]];
    [primeEasyButton runAction:Full];
    
    SKAction *wait1 = [SKAction waitForDuration:0.1];
    SKAction *Full1=[SKAction sequence:@[wait1,move,remove]];
    [primeMediumButton runAction:Full1];
    
    SKAction *wait2 = [SKAction waitForDuration:0.2];
    SKAction *Full2=[SKAction sequence:@[wait2,move,remove]];
    [primeHardButton runAction:Full2];
}
-(void)dashHide{
    SKAction *move =[SKAction moveByX:-200 y:0 duration:0.3];
    SKAction *remove =[SKAction removeFromParent];
    SKAction *wait = [SKAction waitForDuration:0.0];
    SKAction *Full=[SKAction sequence:@[move,wait,remove]];
    [dashTwentySecButton runAction:Full];

    SKAction *wait1 = [SKAction waitForDuration:0.1];
    SKAction *Full1=[SKAction sequence:@[wait1,move,remove]];
    [dashThirtySecButton runAction:Full1];
    
    SKAction *wait2 = [SKAction waitForDuration:0.2];
    SKAction *Full2=[SKAction sequence:@[wait2,move,remove]];
    [dashSixtySecButton runAction:Full2];
}
-(void)retroHide{
    SKAction *move =[SKAction moveByX:-200 y:0 duration:0.3];
    SKAction *remove =[SKAction removeFromParent];
    SKAction *wait = [SKAction waitForDuration:0.0];
    SKAction *Full=[SKAction sequence:@[move,wait,remove]];
    [retroOneLivesButton runAction:Full];
    
    SKAction *wait1 = [SKAction waitForDuration:0.1];
    SKAction *Full1=[SKAction sequence:@[wait1,move,remove]];
    [retroThreeLivesButton runAction:Full1];
    
    SKAction *wait2 = [SKAction waitForDuration:0.2];
    SKAction *Full2=[SKAction sequence:@[wait2,move,remove]];
    [retroFiveLivesButton runAction:Full2];
}
-(void)primeChoose{
    if (1==1) {
        SKAction *move =[SKAction moveByX:200 y:0 duration:0.3];
        move.timingMode =SKActionTimingEaseInEaseOut;
        primeEasyButton =[SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(160, 50)];
        primeEasyButton.name=@"primeEasyButton";
        primeEasyButton.position = CGPointMake(-200, 50);
        [playButton addChild:primeEasyButton];
        SKLabelNode *playLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        playLabel.text = [NSString stringWithFormat:@"EASY"];
        playLabel.fontColor=thirdFontColor;
        playLabel.fontSize = 20;
        playLabel.name=@"primeEasyButton";
        playLabel.position = CGPointMake(0, -5);
        [primeEasyButton addChild:playLabel];
        SKAction *wait = [SKAction waitForDuration:0.0];
        SKAction *Full=[SKAction sequence:@[move,wait]];
        [primeEasyButton runAction:Full];
        
        
        primeMediumButton=[SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(160, 50)];
        primeMediumButton.name=@"primeNormalButton";
        primeMediumButton.position = CGPointMake(-200, 0);
        [playButton addChild:primeMediumButton];
        SKLabelNode *customLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        customLabel.text = [NSString stringWithFormat:@"NORMAL"];
        customLabel.fontSize = 20;
        customLabel.fontColor = secondFontColor;
        customLabel.name=@"primeNormalButton";
        customLabel.position = CGPointMake(0, -5);
        [primeMediumButton addChild:customLabel];
        SKAction *wait1 = [SKAction waitForDuration:0.1];
        SKAction *Full1=[SKAction sequence:@[wait1,move]];
        [primeMediumButton runAction:Full1];
        
        primeHardButton=[SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(160, 50)];
        primeHardButton.name=@"primeHardButton";
        primeHardButton.position = CGPointMake(-200, -50);
        [playButton addChild:primeHardButton];
        SKLabelNode *settingsLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        settingsLabel.text = [NSString stringWithFormat:@"HARD"];
        settingsLabel.fontSize = 20;
        settingsLabel.fontColor=firstFontColor;
        settingsLabel.name=@"primeHardButton";
        settingsLabel.position = CGPointMake(0, -5);
        [primeHardButton addChild:settingsLabel];
        
        SKAction *wait2 = [SKAction waitForDuration:0.2];
        SKAction *Full2=[SKAction sequence:@[wait2,move]];
        [primeHardButton runAction:Full2];
    }
}
-(void)DashChoose{
    if (1==1) {
        SKAction *move =[SKAction moveByX:200 y:0 duration:0.3];
        move.timingMode =SKActionTimingEaseInEaseOut;
        dashTwentySecButton=[SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(160, 50)];
        dashTwentySecButton.name=@"dashTwentySecButton";
        dashTwentySecButton.position = CGPointMake(-200, 50);
        dashTwentySecButton.zPosition=1;
        [dashButton addChild:dashTwentySecButton];
        SKLabelNode *playLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        playLabel.text = [NSString stringWithFormat:@"20sec"];
        playLabel.fontSize = 20;
        playLabel.fontColor=thirdFontColor;
        playLabel.name=@"dashTwentySecButton";
        playLabel.position = CGPointMake(0, -5);
        [dashTwentySecButton addChild:playLabel];
        SKAction *wait = [SKAction waitForDuration:0.0];
        SKAction *Full=[SKAction sequence:@[move,wait]];
        [dashTwentySecButton runAction:Full];
        
        
        dashThirtySecButton=[SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(160, 50)];
        dashThirtySecButton.name=@"dashThirtySecButton";
        dashThirtySecButton.position = CGPointMake(-200, 0);
        dashThirtySecButton.zPosition=1;
        [dashButton addChild:dashThirtySecButton];
        SKLabelNode *customLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        customLabel.text = [NSString stringWithFormat:@"30sec"];
        customLabel.fontSize = 20;
        customLabel.fontColor=secondFontColor;
        customLabel.name=@"dashThirtySecButton";
        customLabel.position = CGPointMake(0, -5);
        [dashThirtySecButton addChild:customLabel];
        SKAction *wait1 = [SKAction waitForDuration:0.1];
        SKAction *Full1=[SKAction sequence:@[wait1,move]];
        [dashThirtySecButton runAction:Full1];
        
        dashSixtySecButton=[SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(160, 50)];
        dashSixtySecButton.name=@"dashSixtySecButton";
        dashSixtySecButton.position = CGPointMake(-200, -50);
        [dashButton addChild:dashSixtySecButton];
        SKLabelNode *settingsLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        settingsLabel.text = [NSString stringWithFormat:@"60sec"];
        settingsLabel.fontSize = 20;
        settingsLabel.fontColor =firstFontColor;
        dashSixtySecButton.zPosition=1;
        settingsLabel.name=@"dashSixtySecButton";
        settingsLabel.position = CGPointMake(0, -5);
        [dashSixtySecButton addChild:settingsLabel];
        
        SKAction *wait2 = [SKAction waitForDuration:0.2];
        SKAction *Full2=[SKAction sequence:@[wait2,move]];
        [dashSixtySecButton runAction:Full2];
    }
}
-(void)RetroChoose{
    if (1==1) {
        SKAction *move =[SKAction moveByX:200 y:0 duration:0.3];
        move.timingMode =SKActionTimingEaseInEaseOut;
        retroOneLivesButton=[SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(160, 50)];
        retroOneLivesButton.name=@"retroOneLivesButton";
        retroOneLivesButton.position = CGPointMake(-200, 50);
        [retroButton addChild:retroOneLivesButton];
        SKLabelNode *playLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        playLabel.text = [NSString stringWithFormat:@"1♥"];
        playLabel.fontSize = 20;
        playLabel.fontColor=thirdFontColor;
        playLabel.name=@"retroOneLivesButton";
        playLabel.position = CGPointMake(0, -5);
        [retroOneLivesButton addChild:playLabel];
        SKAction *wait = [SKAction waitForDuration:0.0];
        SKAction *Full=[SKAction sequence:@[move,wait]];
        [retroOneLivesButton runAction:Full];
        
        
        retroThreeLivesButton=[SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(160, 50)];
        retroThreeLivesButton.name=@"retroThreeLivesButton";
        retroThreeLivesButton.position = CGPointMake(-200, 0);
        [retroButton addChild:retroThreeLivesButton];
        SKLabelNode *customLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        customLabel.text = [NSString stringWithFormat:@"3♥"];
        customLabel.fontSize = 20;
        customLabel.fontColor=secondFontColor;
        customLabel.name=@"retroThreeLivesButton";
        customLabel.position = CGPointMake(0, -5);
        [retroThreeLivesButton addChild:customLabel];
        SKAction *wait1 = [SKAction waitForDuration:0.1];
        SKAction *Full1=[SKAction sequence:@[wait1,move]];
        [retroThreeLivesButton runAction:Full1];
        
        retroFiveLivesButton=[SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(160, 50)];
        retroFiveLivesButton.name=@"retroFiveLivesButton";
        retroFiveLivesButton.position = CGPointMake(-200, -50);
        [retroButton addChild:retroFiveLivesButton];
        SKLabelNode *settingsLabel=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        settingsLabel.text = [NSString stringWithFormat:@"5♥"];
        settingsLabel.fontSize = 20;
        settingsLabel.fontColor=firstFontColor;
        settingsLabel.name=@"retroFiveLivesButton";
        settingsLabel.position = CGPointMake(0, -5);
        [retroFiveLivesButton addChild:settingsLabel];
        
        SKAction *wait2 = [SKAction waitForDuration:0.2];
        SKAction *Full2=[SKAction sequence:@[wait2,move]];
        [retroFiveLivesButton runAction:Full2];
    }
}
-(IBAction)primeStart:(SKNode *)node{
    if (1==1) {
        //background
        backView = [SKSpriteNode spriteNodeWithColor:[[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] size:CGSizeMake(480, 300)];
        backView.position = CGPointMake(340, 150);
        [self addChild:backView];
        //spawnView
        spawnView = [SKSpriteNode spriteNodeWithColor:[[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] size:CGSizeMake(480, 300)];
        spawnView.position = CGPointMake(240, 150);
        [self addChild:spawnView];
        //Paths
        SKSpriteNode *pathOne = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(380,5)];
        SKSpriteNode *pathTwo = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(380,5)];
        SKSpriteNode *pathThree = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(380,5)];
        SKSpriteNode *wall = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(25,300)];
        pathTwo.position = CGPointMake(-50, 0);
        pathThree.position = CGPointMake(-50, -100);
        pathOne.position = CGPointMake(-50, 100);
        wall.position = CGPointMake(-240, 0);
        [backView addChild:pathOne];
        [backView addChild:pathTwo];
        [backView addChild:pathThree];
        [backView addChild:wall];
        //No click zone
        SKSpriteNode *stopView = [SKSpriteNode spriteNodeWithColor:[[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.25] size:CGSizeMake(250, 300)];
        stopView.position = CGPointMake(225, 150);
        [self addChild:stopView];
        
        //change colour buttons
        SKSpriteNode *redButton = [SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(100, 100)];
        SKSpriteNode *blueButton = [SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(100, 100)];
        SKSpriteNode *greenButton = [SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(100, 100)];
        redButton.position = CGPointMake(50, 250);
        blueButton.position = CGPointMake(50, 150);
        greenButton.position = CGPointMake(50, 50);
        [self addChild:redButton];
        [self addChild:blueButton];
        [self addChild:greenButton];
        redButton.name = @"redButton";
        blueButton.name = @"blueButton";
        greenButton.name = @"greenButton";
        //start button
        endScreen = [SKSpriteNode spriteNodeWithImageNamed:@"homePage.png"];
        endScreen.size= CGSizeMake(480, 300);
        endScreen.position = CGPointMake(240, 150);
        [self addChild:endScreen];
        SKSpriteNode *startButton = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(200, 50)];
        startButton.position=CGPointMake(20, 18);
        startButton.name=@"play";
        [endScreen addChild:startButton];
        

    }
    gameType=1;
    if ([node.name isEqualToString:@"primeEasyButton"]) {
        speed=6;
        level=1;
    }else if([node.name isEqualToString:@"primeNormalButton"]){
        speed=4;
        level=1;
    }else if([node.name isEqualToString:@"primeHardButton"]){
        speed=2;
        level=1;
    }
    timeAndSpeedSave=speed;
    [self leaveMainMenu];
    blackBackground.color=[UIColor blackColor];
}
-(IBAction)dashStart:(SKNode *)node{
    if (1==1) {
        //background
        backView = [SKSpriteNode spriteNodeWithColor:[[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] size:CGSizeMake(480, 300)];
        backView.position = CGPointMake(340, 150);
        [self addChild:backView];
        //spawnView
        spawnView = [SKSpriteNode spriteNodeWithColor:[[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] size:CGSizeMake(480, 300)];
        spawnView.position = CGPointMake(240, 150);
        [self addChild:spawnView];
        //Paths
        SKSpriteNode *pathOne = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(380,5)];
        SKSpriteNode *pathTwo = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(380,5)];
        SKSpriteNode *pathThree = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(380,5)];
        SKSpriteNode *wall = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(25,300)];
        pathTwo.position = CGPointMake(-50, 0);
        pathThree.position = CGPointMake(-50, -100);
        pathOne.position = CGPointMake(-50, 100);
        wall.position = CGPointMake(-240, 0);
        [backView addChild:pathOne];
        [backView addChild:pathTwo];
        [backView addChild:pathThree];
        [backView addChild:wall];
        //No click zone
        SKSpriteNode *stopView = [SKSpriteNode spriteNodeWithColor:[[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.25] size:CGSizeMake(250, 300)];
        stopView.position = CGPointMake(225, 150);
        [self addChild:stopView];
        
        //change colour buttons
        SKSpriteNode *redButton = [SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(100, 100)];
        SKSpriteNode *blueButton = [SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(100, 100)];
        SKSpriteNode *greenButton = [SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(100, 100)];
        redButton.position = CGPointMake(50, 250);
        blueButton.position = CGPointMake(50, 150);
        greenButton.position = CGPointMake(50, 50);
        [self addChild:redButton];
        [self addChild:blueButton];
        [self addChild:greenButton];
        redButton.name = @"redButton";
        blueButton.name = @"blueButton";
        greenButton.name = @"greenButton";
        //start button
        endScreen = [SKSpriteNode spriteNodeWithImageNamed:@"homePage.png"];
        endScreen.size= CGSizeMake(480, 300);
        endScreen.position = CGPointMake(240, 150);
        [self addChild:endScreen];
        SKSpriteNode *startButton = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(200, 50)];
        startButton.position=CGPointMake(20, 18);
        startButton.name=@"play";
        [endScreen addChild:startButton];
        
        
    }
    gameType=2;
    if ([node.name isEqualToString:@"dashTwentySecButton"]) {
        speed=4;
        timeAndSpeedSave=20;
        level=1;
    }else if([node.name isEqualToString:@"dashThirtySecButton"]){
        speed=4;
        timeAndSpeedSave=30;
        level=1;
    }else if([node.name isEqualToString:@"dashSixtySecButton"]){
        speed=4;
        timeAndSpeedSave=60;
        level=1;
    }
    time=timeAndSpeedSave;
    [self leaveMainMenu];
    blackBackground.color=[UIColor blackColor];
}
-(IBAction)retroStart:(SKNode *)node{
    if (1==1) {
        //background
        backView = [SKSpriteNode spriteNodeWithColor:[[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] size:CGSizeMake(480, 300)];
        backView.position = CGPointMake(340, 150);
        [self addChild:backView];
        //spawnView
        spawnView = [SKSpriteNode spriteNodeWithColor:[[UIColor alloc] initWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] size:CGSizeMake(480, 300)];
        spawnView.position = CGPointMake(240, 150);
        [self addChild:spawnView];
        //Paths
        SKSpriteNode *pathOne = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(380,5)];
        SKSpriteNode *pathTwo = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(380,5)];
        SKSpriteNode *pathThree = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(380,5)];
        SKSpriteNode *wall = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(25,300)];
        pathTwo.position = CGPointMake(-50, 0);
        pathThree.position = CGPointMake(-50, -100);
        pathOne.position = CGPointMake(-50, 100);
        wall.position = CGPointMake(-240, 0);
        [backView addChild:pathOne];
        [backView addChild:pathTwo];
        [backView addChild:pathThree];
        [backView addChild:wall];
        //No click zone
        SKSpriteNode *stopView = [SKSpriteNode spriteNodeWithColor:[[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.25] size:CGSizeMake(250, 300)];
        stopView.position = CGPointMake(225, 150);
        [self addChild:stopView];
        
        //change colour buttons
        SKSpriteNode *redButton = [SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(100, 100)];
        SKSpriteNode *blueButton = [SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(100, 100)];
        SKSpriteNode *greenButton = [SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(100, 100)];
        redButton.position = CGPointMake(50, 250);
        blueButton.position = CGPointMake(50, 150);
        greenButton.position = CGPointMake(50, 50);
        [self addChild:redButton];
        [self addChild:blueButton];
        [self addChild:greenButton];
        redButton.name = @"redButton";
        blueButton.name = @"blueButton";
        greenButton.name = @"greenButton";
        //start button
        endScreen = [SKSpriteNode spriteNodeWithImageNamed:@"homePage.png"];
        endScreen.size= CGSizeMake(480, 300);
        endScreen.position = CGPointMake(240, 150);
        [self addChild:endScreen];
        SKSpriteNode *startButton = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(200, 50)];
        startButton.position=CGPointMake(20, 18);
        startButton.name=@"play";
        [endScreen addChild:startButton];
        
        
    }
    gameType=3;
    if ([node.name isEqualToString:@"retroOneLivesButton"]) {
        speed=4;
        timeAndSpeedSave=1;
        level=1;
        livesLabel.text=@"♥";
    }else if([node.name isEqualToString:@"retroThreeLivesButton"]){
        speed=4;
        timeAndSpeedSave=3;
        level=1;
         livesLabel.text=@"♥♥♥";
    }else if([node.name isEqualToString:@"retroFiveLivesButton"]){
        speed=4;
        timeAndSpeedSave=5;
        level=1;
         livesLabel.text=@"♥♥♥♥♥";
    }
    [self leaveMainMenu];
    blackBackground.color=[UIColor blackColor];
    
}
-(void)settings{
    [self leaveMainMenu];
    settingsView =[SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(480, 300)];
    settingsView.position=CGPointMake(240, 150);
    [self addChild:settingsView];
    SKLabelNode *quit=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    quit.fontColor=secondFontColor;
    quit.text = [NSString stringWithFormat:@"BACK"];
    quit.fontSize = 20;
    quit.fontColor =secondFontColor;
    quit.name=@"quit";
    quit.position = CGPointMake(-200, 130);
    [settingsView addChild:quit];
    //colour
    if (1==1) {
        NSError *error;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
        NSString *documentsDirectory = [paths objectAtIndex:0]; //2
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"]; //3
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if (![fileManager fileExistsAtPath: path]) //4
        {
            NSString *bundle = [[NSBundle mainBundle] pathForResource:@"settings" ofType:@"plist"]; //5
            
            [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
        }
        
        NSMutableArray *array2=[[NSMutableArray alloc] initWithContentsOfFile:path];
        
        SKLabelNode *colourOne=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        colourOne.text = [NSString stringWithFormat:@"colour one"];
        colourOne.fontSize = 30;
        colourOne.fontColor=secondFontColor;
        colourOne.position = CGPointMake(-100, 100);
        [settingsView addChild:colourOne];
        SKSpriteNode *oneBorder=[SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(33, 33)];
        oneBorder.position = CGPointMake(-100, 75);
        [settingsView addChild:oneBorder];
        oneColourSettings=[SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(30, 30)];
        NSNumber *colOne=array2[1];
        oneColourSettings.name=@"oneColourSettings";
        switch ([colOne intValue]) {
            case 1:
                oneColourSettings.color=[UIColor redColor];
                break;
            case 2:
                oneColourSettings.color=[UIColor orangeColor];
                break;
            case 3:
                oneColourSettings.color=[UIColor yellowColor];
                break;
            case 4:
                oneColourSettings.color=[UIColor greenColor];
                break;
            case 5:
                oneColourSettings.color=[UIColor blueColor];
                break;
            case 6:
                oneColourSettings.color=[UIColor purpleColor];
                break;
            default:
                break;
        }
        [oneBorder addChild:oneColourSettings];
        SKLabelNode *colourTwo=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        colourTwo.fontColor=secondFontColor;
        colourTwo.text = [NSString stringWithFormat:@"colour two"];
        colourTwo.fontSize = 30;
        colourTwo.position = CGPointMake(-100, 25);
        [settingsView addChild:colourTwo];
        SKSpriteNode *twoBorder=[SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(33, 33)];
        twoBorder.position = CGPointMake(-100, 0);
        [settingsView addChild:twoBorder];
        twoColourSettings=[SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(30, 30)];
        NSNumber *colTwo=array2[2];
        twoColourSettings.name=@"twoColourSettings";
        switch ([colTwo intValue]) {
            case 1:
                twoColourSettings.color=[UIColor redColor];
                break;
            case 2:
                twoColourSettings.color=[UIColor orangeColor];
                break;
            case 3:
                twoColourSettings.color=[UIColor yellowColor];
                break;
            case 4:
                twoColourSettings.color=[UIColor greenColor];
                break;
            case 5:
                twoColourSettings.color=[UIColor blueColor];
                break;
            case 6:
                twoColourSettings.color=[UIColor purpleColor];
                break;
            default:
                break;
        }
        [twoBorder addChild:twoColourSettings];

        SKLabelNode *colourThree=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        colourThree.text = [NSString stringWithFormat:@"colour three"];
        colourThree.fontSize = 30;
        colourThree.fontColor=secondFontColor;
        colourThree.position = CGPointMake(-100, -50);
        [settingsView addChild:colourThree];
        SKSpriteNode *threeBorder=[SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(33, 33)];
        threeBorder.position = CGPointMake(-100, -75);
        [settingsView addChild:threeBorder];
        threeColourSettings=[SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(30, 30)];
        NSNumber *colThree=array2[3];
        threeColourSettings.name=@"threeColourSettings";
        switch ([colThree intValue]) {
            case 1:
                threeColourSettings.color=[UIColor redColor];
                break;
            case 2:
                threeColourSettings.color=[UIColor orangeColor];
                break;
            case 3:
                threeColourSettings.color=[UIColor yellowColor];
                break;
            case 4:
                threeColourSettings.color=[UIColor greenColor];
                break;
            case 5:
                threeColourSettings.color=[UIColor blueColor];
                break;
            case 6:
                threeColourSettings.color=[UIColor purpleColor];
                break;
            default:
                break;
        }
        [threeBorder addChild:threeColourSettings];
    }
}
-(void)scores{
    [self leaveMainMenu];
    settingsView =[SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(480, 300)];
    settingsView.position=CGPointMake(240, 150);
    [self addChild:settingsView];
    SKLabelNode *quit=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    quit.text = [NSString stringWithFormat:@"BACK"];
    quit.fontColor=thirdFontColor;
    quit.fontSize = 20;
    quit.name=@"quit";
    quit.position = CGPointMake(-200, 130);
    [settingsView addChild:quit];
    //colour
    NSMutableArray *array2;
    if (1==1) {
        NSError *error;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
        NSString *documentsDirectory = [paths objectAtIndex:0]; //2
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"]; //3
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath: path]) //4
        {
            NSString *bundle = [[NSBundle mainBundle] pathForResource:@"settings" ofType:@"plist"]; //5
            [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
        }
        array2=[[NSMutableArray alloc] initWithContentsOfFile:path];
    }
    
    SKLabelNode *one=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    one.fontColor=thirdFontColor;
    one.text = [NSString stringWithFormat:@"Prime:"];
    one.fontSize = 30;
    one.position = CGPointMake(-150, 75);
    [settingsView addChild:one];
    SKLabelNode *one1=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    one1.text = [NSString stringWithFormat:@"Easy: %@",array2[4]];
    one1.fontColor=thirdFontColor;
    one1.fontSize = 30;
    one1.position = CGPointMake(-150, 25);
    [settingsView addChild:one1];
    SKLabelNode *one2=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    one2.text = [NSString stringWithFormat:@"Normal: %@",array2[5]];
    one2.fontSize = 30;
    one2.fontColor=thirdFontColor;
    one2.position = CGPointMake(-150, -25);
    [settingsView addChild:one2];
    SKLabelNode *one3=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    one3.text = [NSString stringWithFormat:@"Hard: %@",array2[6]];
    one3.fontSize = 30;
    one3.fontColor=thirdFontColor;
    one3.position = CGPointMake(-150, -75);
    [settingsView addChild:one3];
    
    SKLabelNode *two=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    two.text = [NSString stringWithFormat:@"Dash:"];
    two.fontSize = 30;
    two.fontColor=thirdFontColor;
    two.position = CGPointMake(0, 75);
    [settingsView addChild:two];
    SKLabelNode *two1=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    two1.text = [NSString stringWithFormat:@"20sec: %@",array2[7]];
    two1.fontSize = 30;
    two1.fontColor=thirdFontColor;
    two1.position = CGPointMake(0, 25);
    [settingsView addChild:two1];
    SKLabelNode *two2=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    two2.text = [NSString stringWithFormat:@"30sec: %@",array2[8]];
    two2.fontSize = 30;
    two2.fontColor=thirdFontColor;
    two2.position = CGPointMake(0, -25);
    [settingsView addChild:two2];
    SKLabelNode *two3=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    two3.text = [NSString stringWithFormat:@"60sec: %@",array2[9]];
    two3.fontSize = 30;
    two3.fontColor=thirdFontColor;
    two3.position = CGPointMake(0, -75);
    [settingsView addChild:two3];
    
    SKLabelNode *three=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    three.text = [NSString stringWithFormat:@"Retro:"];
    three.fontSize = 30;
    three.fontColor=thirdFontColor;
    three.position = CGPointMake(150, 75);
    [settingsView addChild:three];
    SKLabelNode *three1=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    three1.text = [NSString stringWithFormat:@"1♥: %@",array2[10]];
    three1.fontSize = 30;
    three1.fontColor=thirdFontColor;
    three1.position = CGPointMake(150, 25);
    [settingsView addChild:three1];
    SKLabelNode *three2=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    three2.text = [NSString stringWithFormat:@"3♥: %@",array2[11]];
    three2.fontSize = 30;
    three2.fontColor=thirdFontColor;
    three2.position = CGPointMake(150, -25);
    [settingsView addChild:three2];
    SKLabelNode *three3=[SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    three3.text = [NSString stringWithFormat:@"5♥: %@",array2[12]];
    three3.fontSize = 30;
    three3.fontColor=thirdFontColor;
    three3.position = CGPointMake(150, -75);
    [settingsView addChild:three3];
}
-(void)dashTimerStart{
    g2TImer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dashTimer:) userInfo:nil repeats:YES];
}
-(void)dashTimer:(NSTimer *)timerrrr{
    if(gameType==2){
        if (time>1) {
            time-=1;
        }else{
            [g2TImer invalidate];
            [self lose];
        }
        timeLabel.text=[NSString stringWithFormat:@"%.0f",time];
    }
}
-(void)startTimer{
    NSLog(@"save: %d time: %f",timeAndSpeedSave,time);
    if(gameType==1){
        speed=timeAndSpeedSave;
        timeLabel.hidden=true;
        livesLabel.hidden=true;
    }else if(gameType==2){
        time=timeAndSpeedSave;
        timeLabel.hidden=false;
        livesLabel.hidden=true;
    }else if(gameType==3){
        timeLabel.hidden=true;
        livesLabel.hidden=false;
        lives=timeAndSpeedSave;
        speed=4;
        if (lives==1) {
            livesLabel.text=@"♥";
        }
        if (lives==3) {
            livesLabel.text=@"♥♥♥";
        }
        if (lives==5) {
            livesLabel.text=@"♥♥♥♥♥";
        }
    }
    
    NSLog(@"AT START save: %d time: %f",timeAndSpeedSave,time);
    double timeDouble = (double)(speed/5);
    SKAction *speedUp =[SKAction speedTo:1 duration:0.1];
    [spawnView runAction:speedUp];
    timer = [NSTimer scheduledTimerWithTimeInterval:timeDouble target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}
-(void)timerTick:(NSTimer *)timerrr{
    if (spawns>=4) {
        [timer invalidate];
    }else if(spawns>=1){
        [levelLabel removeFromParent];
    }
    //if for spawn
        spawns+=1;
        compColour = (arc4random() % (3-1+1)) + 1;
        SKSpriteNode *newClick;
        if (compColour==1) {
            newClick = [SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(75, 75)];
            newClick.name = [NSString stringWithFormat:@"%d",compColour];
            newClick.position = CGPointMake(-250, (100*(arc4random() % (3-1+1))));
            newClick.position = CGPointMake(-250, newClick.position.y-100);
            [spawnView addChild:newClick];
        }else if (compColour==2){
            newClick = [SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(75, 75)];
            newClick.name = [NSString stringWithFormat:@"%d",compColour];
            newClick.position = CGPointMake(-250, (100*(arc4random() % (3-1+1))));
            newClick.position = CGPointMake(-250, newClick.position.y-100);
            [spawnView addChild:newClick];
        }
        else if (compColour==3){
            newClick = [SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(75, 75)];
            newClick.name = [NSString stringWithFormat:@"%d",compColour];
            newClick.position = CGPointMake(-250, (100*(arc4random() % (3-1+1))));
            newClick.position = CGPointMake(-250, newClick.position.y-100);
            [spawnView addChild:newClick];
        }
        
        SKAction *move =[SKAction moveByX:550 y:0 duration:speed];
        [newClick runAction:move completion:^(void){[self test:newClick];}];
        waitSpawn=0;
}
-(void)test:(SKNode *)node{
    if (gameType==2 && ![node.name isEqualToString:@"good"]&& ![node.name isEqualToString:@"4"]){
        misses+=1;
    }
    if (gameType==3 && ![node.name isEqualToString:@"good"]&& ![node.name isEqualToString:@"4"]){
        lives-=1;
        switch (lives) {
            case 0:
                [spawnView removeAllChildren];
                [self lose];
                livesLabel.text=@"";
                
                break;
            case 1:
                livesLabel.text=@"♥";
                break;
            case 2:
                livesLabel.text=@"♥♥";
                break;
            case 3:
                livesLabel.text=@"♥♥♥";
                break;
            case 4:
                livesLabel.text=@"♥♥♥♥";
                break;
            case 5:
                livesLabel.text=@"♥♥♥♥♥";
                break;
                
            default:
                break;
        }
    }
    if ([node.name isEqualToString:@"good"]||[node.name isEqualToString:@"4"] || gameType==2 || gameType==3) {
//respawn
    compColour = (arc4random() % (3-1+1)) + 1;
        SKSpriteNode *newClick;
    if (compColour==1) {
        newClick = [SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(75, 75)];
        newClick.name = [NSString stringWithFormat:@"%d",compColour];
        newClick.position = CGPointMake(-250, (100*(arc4random() % (3-1+1))));
        newClick.position = CGPointMake(-250, newClick.position.y-100);
        [spawnView addChild:newClick];
    }else if (compColour==2){
        newClick = [SKSpriteNode spriteNodeWithColor:secondColor size:CGSizeMake(75, 75)];
        newClick.name = [NSString stringWithFormat:@"%d",compColour];
        newClick.position = CGPointMake(-250, (100*(arc4random() % (3-1+1))));
        newClick.position = CGPointMake(-250, newClick.position.y-100);
        [spawnView addChild:newClick];
    }
    else if (compColour==3){
        newClick = [SKSpriteNode spriteNodeWithColor:thirdColor size:CGSizeMake(75, 75)];
        newClick.name = [NSString stringWithFormat:@"%d",compColour];
        newClick.position = CGPointMake(-250, (100*(arc4random() % (3-1+1))));
        newClick.position = CGPointMake(-250, newClick.position.y-100);
        [spawnView addChild:newClick];
    }
    node=newClick;
        //setting up the animation
        int testToSpecial= (arc4random() % (((int)(speed))-1+1)) + 1;
        if (testToSpecial==1) {
            specialSpawn= (arc4random() % (((int)(4))-1+1)) + 1;
            if (specialSpawn==1) {

            
                SKAction *wait =[SKAction waitForDuration:(double)(speed/5)];
                SKAction *switchLanes = [SKAction moveToY:(double)(100*(arc4random() % (3-1+1)))-100 duration:(double)speed/5];
                SKAction *rotate = [SKAction rotateByAngle:M_PI/2.0 duration:(double)speed/5];
                SKAction *move =[SKAction moveByX:550 y:0 duration:speed];
                SKAction *innerGrouping =[SKAction group:@[rotate,switchLanes]];
                SKAction *series = [SKAction sequence:@[wait,innerGrouping]];
                SKAction *grouping =[SKAction group:@[series,move]];
            
            [node runAction:grouping  completion:^(void){[self test:node];}];
        }
            if(specialSpawn==2){
                SKAction *wait =[SKAction waitForDuration:(double)(speed/5)];
                compColour = (arc4random() % (3-1+1)) + 1;
            if (compColour==1) {
                SKAction *switchColor = [SKAction colorizeWithColor:firstColor colorBlendFactor:0.5 duration:(speed/5)];
                node.name = [NSString stringWithFormat:@"%d",compColour];
                SKAction *shrink =[SKAction scaleBy:0.5 duration:(speed/5)/2];
                SKAction *grow =[SKAction scaleBy:2 duration:(speed/5)/2];
                SKAction *innerSeries =[SKAction sequence:@[shrink,grow]];
                SKAction *innerGrouping =[SKAction group:@[innerSeries,switchColor]];
                SKAction *move =[SKAction moveByX:550 y:0 duration:speed];
                SKAction *series = [SKAction sequence:@[wait,innerGrouping]];
                SKAction *grouping =[SKAction group:@[series,move]];
                [node runAction:grouping completion:^(void){[self test:node];}];

            }else if (compColour==2){
                SKAction *switchColor = [SKAction colorizeWithColor:secondColor colorBlendFactor:0.5 duration:(speed/5)];
                node.name = [NSString stringWithFormat:@"%d",compColour];
                SKAction *shrink =[SKAction scaleBy:0.5 duration:(speed/5)/2];
                SKAction *grow =[SKAction scaleBy:2 duration:(speed/5)/2];
                SKAction *innerSeries =[SKAction sequence:@[shrink,grow]];
                SKAction *innerGrouping =[SKAction group:@[innerSeries,switchColor]];
                SKAction *move =[SKAction moveByX:550 y:0 duration:speed];
                SKAction *series = [SKAction sequence:@[wait,innerGrouping]];
                SKAction *grouping =[SKAction group:@[series,move]];
                [node runAction:grouping completion:^(void){[self test:node];}];
            }else if (compColour==3){
                SKAction *switchColor = [SKAction colorizeWithColor:thirdColor colorBlendFactor:0.5 duration:(speed/5)];
                node.name = [NSString stringWithFormat:@"%d",compColour];
                SKAction *shrink =[SKAction scaleBy:0.5 duration:(speed/5)/2];
                SKAction *grow =[SKAction scaleBy:2 duration:(speed/5)/2];
                SKAction *innerSeries =[SKAction sequence:@[shrink,grow]];
                SKAction *innerGrouping =[SKAction group:@[innerSeries,switchColor]];
                SKAction *move =[SKAction moveByX:550 y:0 duration:speed];
                SKAction *series = [SKAction sequence:@[wait,innerGrouping]];
                SKAction *grouping =[SKAction group:@[series,move]];
                [node runAction:grouping completion:^(void){[self test:node];}];
            }
            }
            //white
            if (specialSpawn==3) {
                SKAction *switchColor = [SKAction colorizeWithColor:[UIColor whiteColor] colorBlendFactor:0.5 duration:(1)];
                SKAction *move =[SKAction moveByX:550 y:0 duration:speed];
                SKAction *grouping =[SKAction group:@[switchColor,move]];
               node.name = [NSString stringWithFormat:@"%d",0];
                [node runAction:grouping completion:^(void){[self test:node];}];
            }
            //black
            if (specialSpawn==4) {
                SKAction *switchColor = [SKAction colorizeWithColor:[UIColor blackColor] colorBlendFactor:0.5 duration:(1)];
                SKAction *move =[SKAction moveByX:550 y:0 duration:speed];
                SKAction *grouping =[SKAction group:@[switchColor,move]];
                node.name = [NSString stringWithFormat:@"%d",4];
               [node runAction:grouping completion:^(void){[self test:node];}];
            }
        }else{
                SKAction *move =[SKAction moveByX:550 y:0 duration:speed];
                [node runAction:move completion:^(void){[self test:node];}];
        }
        //leveling up
        if ((score==(level*5))&& speed>0.5) {
            speed=speed-speedSub;
            //speedSub-=0.1;
            level+=1;
            //speed-=0.5;
            //#realSpeed
            realSpeed+=0.2;
            SKAction *speedUp =[SKAction speedTo:realSpeed duration:0.1];
            [spawnView runAction:speedUp];
            levelLabel = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
            levelLabel.text = [NSString stringWithFormat:@"LEVEL UP"];
            levelLabel.fontSize = 50;
            levelLabel.position = CGPointMake(290, 150);
            [self addChild:levelLabel];
            SKAction *fadeOut =[SKAction fadeOutWithDuration:1];
            [levelLabel runAction:fadeOut];
            /* [spawnView removeAllChildren];
            spawns=0;
            [self startTimer];
            [spawnView removeAllChildren];*/
        }
    }
    else if (gameType==1) {
        [self lose];
    }
    
}
-(void)lose{
    [spawnView removeAllChildren];
    [timer invalidate];
    [spawnView removeAllChildren];
    scoreLabel.text = [NSString stringWithFormat:@"SCORE:%d",score];
    endScreen = [SKSpriteNode spriteNodeWithImageNamed:@"homePage.png"];
    endScreen.position = CGPointMake(240, 150);
    [self addChild:endScreen];
    SKSpriteNode *startButton = [SKSpriteNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(200, 50)];
    startButton.position=CGPointMake(20, 18);
    startButton.name=@"play";
    [endScreen addChild:startButton];
    loseView =[SKSpriteNode spriteNodeWithColor:firstColor size:CGSizeMake(480, 300)];
    loseView.position=CGPointMake(240, 150);
    [self addChild:loseView];
    SKLabelNode *title = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    title.text = [NSString stringWithFormat:@"SLIDE n' TAP"];
    title.fontColor=firstFontColor;
    title.fontSize = 60;
    title.position = CGPointMake(0, 75);
    [loseView addChild:title];
    SKLabelNode *scoreFinal = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    scoreFinal.text = [NSString stringWithFormat:@"%d",score];
    scoreFinal.fontColor=firstFontColor;
    scoreFinal.fontSize = 150;
    scoreFinal.position = CGPointMake(0,-75);
    [loseView addChild:scoreFinal];
    //get scores
    SKLabelNode *highScore = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    highScore.fontColor=firstFontColor;
    if (1==1) {
        NSError *error;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
        NSString *documentsDirectory = [paths objectAtIndex:0]; //2
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"]; //3
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if (![fileManager fileExistsAtPath: path]) //4
        {
            NSString *bundle = [[NSBundle mainBundle] pathForResource:@"settings" ofType:@"plist"]; //5
            
            [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
        }
        
        NSMutableArray *array2=[[NSMutableArray alloc] initWithContentsOfFile:path];
        int gameDiffculty = 0;
        if (gameType==1) {
            if (timeAndSpeedSave==6) {
                gameDiffculty=4;
            }
            if (timeAndSpeedSave==4) {
                gameDiffculty=5;
            }
            if (timeAndSpeedSave==2) {
                gameDiffculty=6;
            }
        }
        if (gameType==2) {
            if (timeAndSpeedSave==20) {
                gameDiffculty=7;
            }
            if (timeAndSpeedSave==30) {
                gameDiffculty=8;
            }
            if (timeAndSpeedSave==60) {
                gameDiffculty=9;
            }        }
        if (gameType==3) {
            if (timeAndSpeedSave==1) {
                gameDiffculty=10;
            }
            if (timeAndSpeedSave==3) {
                gameDiffculty=11;
            }
            if (timeAndSpeedSave==5) {
                gameDiffculty=12;
            }
        }
        if (score>[array2[gameDiffculty] intValue]) {
            [array2 replaceObjectAtIndex:gameDiffculty withObject:[NSNumber numberWithInt:score]];
            [array2 writeToFile:path atomically:YES];
            SKLabelNode *newHigh = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
            newHigh.text = [NSString stringWithFormat:@"NEW HIGH SCORE!"];
            newHigh.fontColor=firstFontColor;
            newHigh.fontSize = 20;
            newHigh.position = CGPointMake(0,175);
            [highScore addChild:newHigh];
        }
        highScore.text = [NSString stringWithFormat:@"%@",array2[gameDiffculty]];
    }
    highScore.fontSize = 50;
    highScore.position = CGPointMake(0,-125);
    [loseView addChild:highScore];
    
    
    SKLabelNode *retry = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    retry.text = [NSString stringWithFormat:@"AGAIN"];
    retry.fontColor=firstFontColor;
    retry.fontSize = 40;
    retry.name=@"replay";
    retry.position = CGPointMake(-150,-125);
    [loseView addChild:retry];
    
    SKLabelNode *quit = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
    quit.text = [NSString stringWithFormat:@"QUIT"];
    quit.fontColor=firstFontColor;
    quit.fontSize = 40;
    quit.name=@"quit";
    quit.position = CGPointMake(150,-125);
    [loseView addChild:quit];
    [spawnView removeAllChildren];
    if (gameType==2) {
        time=timeAndSpeedSave;
    }else{
        speed=timeAndSpeedSave;
    }
    start =false;
    score=0;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    if ([node.name isEqualToString:[NSString stringWithFormat:@"redButton"]]||[node.name isEqualToString:[NSString stringWithFormat:@"blueButton"]]||[node.name isEqualToString:[NSString stringWithFormat:@"greenButton"]]) {
        backView.color=[UIColor whiteColor];
        colour=0;
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    if ([node.name isEqualToString:[NSString stringWithFormat:@"redButton"]]) {
        backView.color =firstColor;
        colour=1;
    }else if ([node.name isEqualToString:[NSString stringWithFormat:@"blueButton"]]){
        backView.color =secondColor;
        colour=2;
    }else if ([node.name isEqualToString:[NSString stringWithFormat:@"greenButton"]]){
        backView.color =thirdColor;
        colour=3;
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    if ([node.name isEqualToString:@"quit"]) {
        [spawnView removeAllChildren];
        [self createMainMenu];
        
    }
    if ([node.name isEqualToString:@"settingsButton"]) {
        [self settings];
    }
    if ([node.name isEqualToString:@"scoresButton"]) {
        [self scores];
    }
    if ([node.name isEqualToString:@"primeEasyButton"] ||[node.name isEqualToString:@"primeNormalButton"]||[node.name isEqualToString:@"primeHardButton"]) {
        [self primeStart:(node)];
    }
    if ([node.name isEqualToString:@"dashTwentySecButton"] ||[node.name isEqualToString:@"dashThirtySecButton"]||[node.name isEqualToString:@"dashSixtySecButton"]) {
        [self dashStart:(node)];
    }
    if ([node.name isEqualToString:@"retroThreeLivesButton"] ||[node.name isEqualToString:@"retroFiveLivesButton"]||[node.name isEqualToString:@"retroOneLivesButton"]) {
        [self retroStart:(node)];
    }
    if ([node.name isEqualToString:@"dashButton"]) {
        [self DashChoose];
        [self slideBack:(node)];
    }
    if ([node.name isEqualToString:@"retroButton"]) {
        [self RetroChoose];
        [self slideBack:(node)];
    }
    if ([node.name isEqualToString:@"playButton"]) {
        [self primeChoose];
        [self slideBack:(node)];
    }
    if ([node.name isEqualToString:@"replay"] ) {
        start=true;
        score=0;
        level=1;
        //time & lives refresh?
        if (gameType==2) {
            [self dashTimerStart];
        }
        waitSpawn=0;
        //#testing
        speedSub=0.5;
        timerSpeed=8;
        spawns=0;
        realSpeed=1;
        [spawnView removeAllChildren];
        [loseView removeFromParent];
        [self startTimer];
        [endScreen removeFromParent];
        //moving things
    }
    if ([node.name isEqualToString:@"play"] ) {
        start=true;
        score=0;
        level=1;
        waitSpawn=0;
        //#testing
        speedSub=0.5;
        timerSpeed=8;
        spawns=0;
        realSpeed=1;
        [endScreen removeFromParent];
        [spawnView removeAllChildren];
        if (gameType==2) {
            [self dashTimerStart];
        }
        [self startTimer];
        [blackBackground removeFromParent];
//moving things
    }else if ([node.name isEqualToString:[NSString stringWithFormat:@"%d",1]] && colour==1) {
        SKAction *rotate =[SKAction rotateByAngle:420 duration:0.3];
        SKAction *shrink =[SKAction scaleXBy:0.001 y:0.001 duration:0.3];
        SKAction *together =[SKAction group:@[rotate, shrink]];
        [node runAction:together completion:nil];
        node.name=@"good";
        score+=1;
        
        SKLabelNode *plusOne = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        plusOne.text = [NSString stringWithFormat:@"+1"];
        plusOne.fontSize = 20;
        plusOne.position = CGPointMake(node.position.x, node.position.y);
        SKAction *fade =[SKAction fadeOutWithDuration:1];
        SKAction *remove =[SKAction removeFromParent];
        SKAction *ordering=[SKAction sequence:@[fade,remove]];
        [spawnView addChild:plusOne];
        [plusOne runAction:ordering completion:nil];
        
    }else if ([node.name isEqualToString:[NSString stringWithFormat:@"%d",2]] && colour==2){
        
        SKAction *rotate =[SKAction rotateByAngle:420 duration:0.3];
        SKAction *shrink =[SKAction scaleXBy:0.001 y:0.001 duration:0.3];
        SKAction *together =[SKAction group:@[rotate, shrink]];
        [node runAction:together completion:nil];
        node.name=@"good";
        score+=1;
        SKLabelNode *plusOne = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        plusOne.text = [NSString stringWithFormat:@"+1"];
        plusOne.fontSize = 20;
        plusOne.position = CGPointMake(node.position.x, node.position.y);
        SKAction *fade =[SKAction fadeOutWithDuration:1];
        SKAction *remove =[SKAction removeFromParent];
        SKAction *ordering=[SKAction sequence:@[fade,remove]];
        [spawnView addChild:plusOne];
        [plusOne runAction:ordering completion:nil];
    }else if ([node.name isEqualToString:[NSString stringWithFormat:@"%d",3]] && colour==3){
        
        SKAction *rotate =[SKAction rotateByAngle:420 duration:0.3];
        SKAction *shrink =[SKAction scaleXBy:0.001 y:0.001 duration:0.3];
        SKAction *together =[SKAction group:@[rotate, shrink]];
        [node runAction:together completion:nil];
        node.name=@"good";
        score+=1;
        SKLabelNode *plusOne = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        plusOne.text = [NSString stringWithFormat:@"+1"];
        plusOne.fontSize = 20;
        plusOne.position = CGPointMake(node.position.x, node.position.y);
        SKAction *fade =[SKAction fadeOutWithDuration:1];
        SKAction *remove =[SKAction removeFromParent];
        SKAction *ordering=[SKAction sequence:@[fade,remove]];
        [spawnView addChild:plusOne];
        [plusOne runAction:ordering completion:nil];
//buttons
    }else if ([node.name isEqualToString:[NSString stringWithFormat:@"%d",0]] && colour==0) {
        SKAction *rotate =[SKAction rotateByAngle:420 duration:0.3];
        SKAction *shrink =[SKAction scaleXBy:0.001 y:0.001 duration:0.3];
        SKAction *together =[SKAction group:@[rotate, shrink]];
        [node runAction:together completion:nil];
        node.name=@"good";
        score+=1;
        
        SKLabelNode *plusOne = [SKLabelNode labelNodeWithFontNamed:@"TimesNewRoman"];
        plusOne.text = [NSString stringWithFormat:@"+1"];
        plusOne.fontSize = 20;
        plusOne.position = CGPointMake(node.position.x, node.position.y);
        SKAction *fade =[SKAction fadeOutWithDuration:1];
        SKAction *remove =[SKAction removeFromParent];
        SKAction *ordering=[SKAction sequence:@[fade,remove]];
        [spawnView addChild:plusOne];
        [plusOne runAction:ordering completion:nil];
        
    }else if ([node.name isEqualToString:[NSString stringWithFormat:@"%d",4]]) {
        [self lose];
        
    }else if ([node.name isEqualToString:[NSString stringWithFormat:@"redButton"]]) {
        backView.color =firstColor;
        colour=1;
    }else if ([node.name isEqualToString:[NSString stringWithFormat:@"blueButton"]]){
        backView.color =secondColor;
        colour=2;
    }else if ([node.name isEqualToString:[NSString stringWithFormat:@"greenButton"]]){
        backView.color =thirdColor;
        colour=3;
    }
    if ([node.name isEqualToString:[NSString stringWithFormat:@"oneColourSettings"]] || [node.name isEqualToString:[NSString stringWithFormat:@"twoColourSettings"]] || [node.name isEqualToString:[NSString stringWithFormat:@"threeColourSettings"]]){
        [self changeColorsSettings:node];
    }
}
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}
-(void)changeColorsSettings:(SKNode *)nodeColor{
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"settings.plist"]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"settings" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }
    
    NSMutableArray *array2=[[NSMutableArray alloc] initWithContentsOfFile:path];
    SKSpriteNode *changeMe;
    NSNumber *colOne;
    NSNumber *colTwo;
    NSNumber *colThree;
    if ([nodeColor.name isEqualToString:@"oneColourSettings"]) {
        changeMe=oneColourSettings;
        colOne=array2[1];
        colTwo=array2[2];
        colThree=array2[3];
    }else if ([nodeColor.name isEqualToString:@"twoColourSettings"]) {
        changeMe=twoColourSettings;
        colOne=array2[2];
        colTwo=array2[1];
        colThree=array2[3];
    }else if ([nodeColor.name isEqualToString:@"threeColourSettings"]) {
        changeMe=threeColourSettings;
        colOne=array2[3];
        colTwo=array2[2];
        colThree=array2[1];
    }
    for (int x=0; x<9; x++) {
        if ([colOne intValue]<6) {
            colOne=[NSNumber numberWithInt:[colOne intValue]+1];
        }else{
            colOne=[NSNumber numberWithInt:1];
        }
        if ([colOne intValue]!=[colTwo intValue] && [colOne intValue]!=[colThree intValue]) {
            x=21;
        }
    }
    switch ([colOne intValue]) {
        case 1:
            changeMe.color=[UIColor redColor];
            break;
        case 2:
            changeMe.color=[UIColor orangeColor];
            break;
        case 3:
            changeMe.color=[UIColor yellowColor];
            break;
        case 4:
            changeMe.color=[UIColor greenColor];
            break;
        case 5:
            changeMe.color=[UIColor blueColor];
            break;
        case 6:
            changeMe.color=[UIColor purpleColor];
            break;
        default:
            break;
    }
    if ([nodeColor.name isEqualToString:@"oneColourSettings"]) {
        [array2 replaceObjectAtIndex:1 withObject:colOne];
        oneColourSettings=changeMe;
        [array2 writeToFile:path atomically:YES];
    }
    if ([nodeColor.name isEqualToString:@"twoColourSettings"]) {
        [array2 replaceObjectAtIndex:2 withObject:colOne];
        twoColourSettings=changeMe;
        [array2 writeToFile:path atomically:YES];
    }
    if ([nodeColor.name isEqualToString:@"threeColourSettings"]) {
        [array2 replaceObjectAtIndex:3 withObject:colOne];
        threeColourSettings=changeMe;
        [array2 writeToFile:path atomically:YES];
    }
}
@end
