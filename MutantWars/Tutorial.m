//
//  Tutorial.m
//  MutantWars
//
//  Created by Devon on 9/7/13.
//  Copyright (c) 2013 Devon. All rights reserved.
//

#import "Tutorial.h"
#import "ViewController.h"

@interface Tutorial ()

@end

@implementation Tutorial

@synthesize MenuClick;

-(IBAction)Back:(id)sender{
    [MenuClick play];
    ViewController *TutorialToMenu = [[ViewController alloc]
                                initWithNibName:@"ViewController"
                                bundle:nil];
    
    [self.view addSubview:TutorialToMenu.view];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    AVAudioPlayer *pp1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"MenuClick" ofType:@"mp3"]] error:nil];
    self.MenuClick = pp1;
    [pp1 prepareToPlay];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
