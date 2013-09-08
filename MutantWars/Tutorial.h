//
//  Tutorial.h
//  MutantWars
//
//  Created by Devon on 9/7/13.
//  Copyright (c) 2013 Devon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"


@interface Tutorial : UIViewController{
    IBOutlet AVAudioPlayer *MenuClick;
}

@property(nonatomic, retain)AVAudioPlayer *MenuClick;

-(IBAction)Back:(id)sender;

@end
