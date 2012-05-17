//
//  SGBackgroundWindowController.m
//  ScreenGrids
//
//  Created by Albert Lee on 4/17/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "SGBackgroundWindowController.h"

@interface SGBackgroundWindowController ()

@end

@implementation SGBackgroundWindowController
- (id)initWithWindow:(NSWindow *)window
{
  self = [super initWithWindow:window];
  if (self) {
    // Initialization code here.
    [self optionReload];
    
  }
  
  return self;
}

- (void)optionReload{
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  
  iBackgroundOption = [userDefaults integerForKey:kSGBackgroundOption];
  iFrameOption = [userDefaults integerForKey:kSGFrameOption];
  NSData *solidButtonColorData = [userDefaults dataForKey:kSGBckgroundColor];
  NSData *frameButtonColorData = [userDefaults dataForKey:kSGFrameColor];
  NSData *customImageData = [userDefaults dataForKey:kSGCustomImage];
  if (solidButtonColorData!=nil) {
    solidButtonColor = [NSKeyedUnarchiver unarchiveObjectWithData:solidButtonColorData];
  }
  else {
    solidButtonColor = [NSColor clearColor];
  }
  if (frameButtonColorData!=nil) {
    frameButtonColor = [NSKeyedUnarchiver unarchiveObjectWithData:frameButtonColorData];
  }
  else {
    frameButtonColor = [NSColor clearColor];
  }
  if (customImageData!=nil) {
    customBgImage = [NSKeyedUnarchiver unarchiveObjectWithData:customImageData];
  }
  
  iArrangementOption = [userDefaults integerForKey:kSGArrangementOption];
  iTemplateNum = [userDefaults integerForKey:kSGTemplateNum];
}

- (void)windowDidLoad
{
  [super windowDidLoad];  
  // Implement this method's initialization
  
}

- (void)windowWillLoad{
  [super windowWillLoad];
}


- (void)initWindow{
  [self optionReload];
  //general init
  NSRect rectOfBGWindow = [[[DataComputing sizeOfGrids] objectAtIndex:0] rectValue]; 
  [self.window setAlphaValue:0.5f];
  [self.window setFrame:rectOfBGWindow display:YES animate:NO];
  [self.window setIgnoresMouseEvents:YES];
  //background init  
  if (iBackgroundOption == 0) {
    [self.window setBackgroundColor:solidButtonColor];
  }
  else {
    NSColor* myColor = [NSColor colorWithPatternImage:customBgImage];
    [self.window setBackgroundColor:myColor];
  }
  
  //grid init
    gridImageView = [[SGCustomGridImageView alloc] initWithFrame:rectOfBGWindow];
    gridImageView.imageScaling = NSScaleToFit;
    gridImageView.iForActualBg = 1;
  
//  NSAccessibilityWindowAttribute;

    [self.window.contentView addSubview:gridImageView];

}


@end
