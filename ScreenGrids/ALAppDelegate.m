//
//  ALAppDelegate.m
//  ScreenGrids
//
//  Created by Albert Lee on 3/5/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "ALAppDelegate.h"
//#import "PTHotKeyCenter.h"
@implementation ALAppDelegate

@synthesize mainWindow,statusItem,mainMenu,hotkeyManager;//,hotKey;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  // Insert code here to initialize your application
  [self menuInit];
  
  self.hotkeyManager = [[JFHotkeyManager alloc] init];
  [self.hotkeyManager bindKeyRef:49 withModifiers:cmdKey + optionKey + shiftKey target:self action:@selector(activateScreenGrids)];
  [self.hotkeyManager bind:@"ctrl command shift up" target:self action:@selector(activateScreenGrids)];
  
//  PTKeyCombo *keyCombo = [[PTKeyCombo alloc] initWithKeyCode:0 modifiers:4096];
//  self.hotKey = [[PTHotKey alloc] initWithIdentifier:self keyCombo:keyCombo];
//  [self.hotKey setTarget: self];
//	[self.hotKey setAction: @selector(activateScreenGrids)];
//	
//	[[PTHotKeyCenter sharedCenter] registerHotKey: self.hotKey];
  
  self.mainWindow = [[SGPreferencesWindowController alloc] initWithWindowNibName:@"SGPreferencesWindowController"];
  

}

- (void) menuInit{
  if(statusItem){
    [[NSStatusBar systemStatusBar] removeStatusItem:statusItem];
    statusItem = nil;
  }
  
  mainMenu = [[NSMenu alloc] initWithTitle:@"ScreenGrids"];
  
  [mainMenu addItemWithTitle:@"About ScreenGrids" 
                      action:@selector(aboutClick:) 
               keyEquivalent:@""];
  [mainMenu addItem:[NSMenuItem separatorItem]];
  [mainMenu addItemWithTitle:@"Preferences" 
                      action:@selector(preferences:) 
               keyEquivalent:@""];
  [mainMenu addItem:[NSMenuItem separatorItem]];
  [mainMenu addItemWithTitle:@"Quit" 
                      action:@selector(quitApp:) 
               keyEquivalent:@""];
  
  
  statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:30.0f];
  [statusItem setImage:[NSImage imageNamed:@"StatusBar"]];
  [statusItem setAlternateImage:[NSImage imageNamed:@"Statusbar_alternate"]];
  [statusItem setHighlightMode:YES];
  [statusItem setToolTip:@"ScreenGrids"];
  [statusItem setMenu:mainMenu];
}

- (void)activateScreenGrids{
  NSLog(@"keypressed");
}

- (IBAction)aboutClick:(id)sender{
  [NSApp activateIgnoringOtherApps:YES];
  [NSApp orderFrontStandardAboutPanel:nil];
}

- (IBAction)preferences:(id)sender{
  [NSApp activateIgnoringOtherApps:YES];
  [self.mainWindow showWindow:nil];
}

- (IBAction)quitApp:(id)sender{
  [NSApp terminate:nil];
}
@end
