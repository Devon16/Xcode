//
//  ViewController.h
//  MutantWars
//
//  Created by Devon on 9/7/13.
//  Copyright (c) 2013 Devon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"

@interface ViewController : UIViewController{
    IBOutlet AVAudioPlayer *MenuClick;
}

@property(nonatomic, strong)AVAudioPlayer *MenuClick;

-(IBAction)Tutorial:(id)sender;
-(IBAction)Play:(id)sender;

@end
