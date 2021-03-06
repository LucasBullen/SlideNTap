//
//  ViewController.m
//  SlideGame
//
//  Created by Lucas on 2014-05-29.
//  Copyright (c) 2014 Lucas. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}
- (void)viewWillLayoutSubviews
{
    
    [super viewWillLayoutSubviews];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    
    //set the view only once, if the device orientation is
    //rotating viewWillLayoutSubviews will be called again
    if ( !skView.scene )
    {
        // Configure the view.
        SKView * skView = (SKView *)self.view;
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        // Create and configure the scene.
        SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        NSLog(@"width: %f",skView.bounds.size.width);
        NSLog(@"height: %f",skView.bounds.size.height);
        // Present the scene.
        [skView presentScene:scene];
    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
