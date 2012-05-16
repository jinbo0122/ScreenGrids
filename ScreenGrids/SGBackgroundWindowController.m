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
  }
  
  return self;
}

- (void)windowDidLoad
{
  [super windowDidLoad];
  
  // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
  //  self.bgImage = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, 1920, 1020)];
  //  self.bgImage.image = [NSImage imageNamed:@"tempBG.jpg"];
  //  self.bgImage.imageScaling = NSScaleToFit ;
  //  [self.window.contentView addSubview:self.bgImage];
}

@end
