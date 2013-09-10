//
//  ViewController.m
//  MutantWars
//
//  Created by Devon on 9/7/13.
//  Copyright (c) 2013 Devon. All rights reserved.
//

#import "ViewController.h"
#import "Tutorial.h"
#import "Lv1.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize MenuClick;

-(IBAction)Tutorial:(id)sender{
    [MenuClick play];
    Tutorial *MenuToTutorial = [[Tutorial alloc]
                        initWithNibName:@"Tutorial"
                        bundle:nil];
    
    
    [self.view addSubview:MenuToTutorial.view];
}

-(IBAction)Play:(id)sender{
    [MenuClick play];
    Lv1 *MenuToLv1 = [[Lv1 alloc]
                     initWithNibName:@"Lv1"
                     bundle:nil];
    
    [self.view addSubview:MenuToLv1.view];
}

- (void)viewDidLoad
{
    AVAudioPlayer *pp1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"MenuClick" ofType:@"mp3"]] error:nil];
    self.MenuClick = pp1;
    [pp1 prepareToPlay];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
