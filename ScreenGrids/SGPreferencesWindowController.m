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
  //To be changed for userdefault read setting 
  
  [gridArrangementStyleComboBox selectItemAtIndex:0];
  
  NSImageView *customArrangementImageView = [[NSImageView alloc] initWithFrame:NSMakeRect(28, 95, 343, 212)];
  customArrangementImageView.image = [NSImage imageNamed:@"customArrangement.png"];
  customArrangementImageView.imageScaling = NSScaleToFit;
  
  [customArrangementView addSubview:customArrangementImageView];
  
  
  NSImageView *templateImageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, 240, 150)];
  templateImageView.image = [NSImage imageNamed:@"template_1.png"];
  templateImageView.imageScaling = NSScaleToFit;
  
  [themeStandardView addSubview:templateImageView];
}

- (void)appearanceTabInit{
  //To be changed for userdefault read setting  
  
  [gridFrameStyleComboBox selectItemAtIndex:0];
  [gridBackgroundStyleComboBox selectItemAtIndex:0];
  
  [solidColorBackgroundButton setBordered:NO];
  [[solidColorBackgroundButton cell] setBackgroundColor:(solidButtonColor==nil)?[NSColor whiteColor]:solidButtonColor];
  [solidColorBackgroundButton setAction:@selector(backgroundColorChoose:)];
  
  
  [customImageBackgroundButton setAction:@selector(customImageChoose:)];
  
  [frameColorButton setBordered:NO];
  [[frameColorButton cell] setBackgroundColor:(frameButtonColor==nil)?[NSColor whiteColor]:frameButtonColor];
  [frameColorButton setAction:@selector(frameColorChoose:)];
  
}
#pragma mark -Table View Datasourse
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
  return DEFAULT_TEMPLATE_NUM;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
  
  return nil;
}

#pragma mark -Table View Delegate
- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
  NSImageView *imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, 109, 100)];
  imageView.image = [NSImage imageNamed:[NSString stringWithFormat:@"template_thumb_%d",row+1]];
  imageView.imageScaling = NSScaleToFit;
  return imageView;
}

#pragma mark -Button Actions

- (IBAction)backgroundColorChoose:(id)sender{
  bSolidColorChoose = YES;
  [[NSColorPanel sharedColorPanel] setColor:solidButtonColor];
  [[NSColorPanel sharedColorPanel] setShowsAlpha:YES];
  [NSApp orderFrontColorPanel:nil];
}

- (IBAction)customImageChoose:(id)sender{
  
}

- (IBAction)frameColorChoose:(id)sender{
  bSolidColorChoose = NO;
  [frameColorButton becomeFirstResponder];
  [[NSColorPanel sharedColorPanel] setColor:frameButtonColor];
  [[NSColorPanel sharedColorPanel] setShowsAlpha:YES];
  [NSApp orderFrontColorPanel:nil];
}

- (void)changeColor:(id)sender{
  if (bSolidColorChoose) {
    solidButtonColor = [[NSColorPanel sharedColorPanel] color];
    [[solidColorBackgroundButton cell] setBackgroundColor:solidButtonColor];
  }
  else{
    frameButtonColor = [[NSColorPanel sharedColorPanel] color];
    [[frameColorButton cell] setBackgroundColor:frameButtonColor];
  }
}
@end
