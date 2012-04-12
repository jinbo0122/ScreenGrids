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

- (id)initWithWindow:(NSWindow *)window{
  self = [super initWithWindow:window];
  if (self) {
    // Initialization code here.
    [self.window setTitle:@"ScreenGrids Preferences"];
//    [self.window setStyleMask:NSTitledWindowMask |NSResizableWindowMask |NSMiniaturizableWindowMask |NSClosableWindowMask];
//    [self.window setBackingType:NSBackingStoreBuffered];
//    [self.window makeKeyAndOrderFront:self];
  }
  
  return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.


}
@end
