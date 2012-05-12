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
  [self addView:arragementView
          label:@"Arrangement" 
          image:[NSImage imageNamed:@"Arrangement"]
     identifier:@"prefArrangementIdentifier"];
  [self addView:advancedView
          label:@"Advanced" 
          image:[NSImage imageNamed:@"Advanced"]
     identifier:@"prefAdvancedIdentifier"];
  [self setShiftSlowsAnimation:YES];
  [self setCrossFade:YES];
  [self.window setTitle:@"ScreenGrids Preferences"];
  
  
  [self appearanceTabInit];
  [self arrangementTabInit];
}


- (void)arrangementTabInit{
  [gridArrangementStyleComboBox selectItemAtIndex:0];
  
  NSImageView *imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(28, 95, 343, 212)];
  imageView.image = [NSImage imageNamed:@"customArrangement.png"];
  imageView.imageScaling = NSScaleToFit;
  
  [customArrangementView addSubview:imageView];
}

- (void)appearanceTabInit{
  [gridFrameStyleComboBox selectItemAtIndex:0];
  [gridBackgroundStyleComboBox selectItemAtIndex:0];
  
  NSImageView *imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, 240, 150)];
  imageView.image = [NSImage imageNamed:@"template_1.png"];
  imageView.imageScaling = NSScaleToFit;
  
  [themeStandardView addSubview:imageView];
}
#pragma mark -Table View Datasourse
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
  return 6;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
  if (themeTableView ==tableView) {
    
  }
  return nil;
}

#pragma mark -Table View Delegate
- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
  NSImageView *imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, 109, 100)];
  imageView.image = [NSImage imageNamed:[NSString stringWithFormat:@"template_thumb_%d",row+1]];
  imageView.imageScaling = NSScaleToFit;
  return imageView;
}
@end
