//
//  SGPreferencesWindowController.m
//  ScreenGrids
//
//  Created by Albert Lee on 4/12/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "SGPreferencesWindowController.h"

@interface SGPreferencesWindowController ()
@end


@implementation SGPreferencesWindowController
+ (NSString*)nibName{
  return @"SGPreferencesWindowController";
}

- (void)setupToolbar{
  [self addView:generalView
          label:@"General" 
          image:[NSImage imageNamed:@"General"]
     identifier:@"prefGeneralIdentifier"];
  [self addView:appearanceView
          label:@"Appearance" 
          image:[NSImage imageNamed:@"Appearance"]
     identifier:@"prefAppearanceIdentifier"];
  [self addView:advancedView
          label:@"Advanced" 
          image:[NSImage imageNamed:@"Advanced"]
     identifier:@"prefAdvancedIdentifier"];
  [self setShiftSlowsAnimation:YES];
  [self setCrossFade:YES];
  [self.window setTitle:@"ScreenGrids Preferences"];
}

@end
