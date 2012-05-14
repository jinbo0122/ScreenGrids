//
//  ALAppDelegate.m
//  ScreenGrids
//
//  Created by Albert Lee on 3/5/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "ALAppDelegate.h"

@implementation ALAppDelegate

@synthesize mainWindow,statusItem,mainMenu,hotKey,backgroundWindow;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  // Insert code here to initialize your application
  [self menuInit];
  [self hotkeyInit]; 
    
  self.mainWindow = [[SGPreferencesWindowController alloc] initWithWindowNibName:@"SGPreferencesWindowController"];
  self.backgroundWindow = [[SGBackgroundWindowController alloc] initWithWindowNibName:@"SGBackgroundWindowController"];
}
#pragma mark -
#pragma mark Initialize
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
  [mainMenu addItemWithTitle:@"Developer's Website" 
                      action:@selector(devWebsite:) 
               keyEquivalent:@""];
  [mainMenu addItemWithTitle:@"Report a Bug" 
                      action:@selector(reportBug:) 
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

- (void) hotkeyInit{
  PTKeyCombo *keyCombo = [[PTKeyCombo alloc] initWithKeyCode:0x01 modifiers:shiftKey + cmdKey];  //ctrl+command+s
  self.hotKey = [[PTHotKey alloc] initWithIdentifier:self keyCombo:keyCombo];
  [self.hotKey setTarget: self];
	[self.hotKey setAction: @selector(activateScreenGrids)];
  [self.hotKey setReleaseAction:@selector(deactivateScreenGrids)];
	
	[[PTHotKeyCenter sharedCenter] registerHotKey: self.hotKey];
}

- (void) gridWindowInit{
  //Grid Window Initialize 
  
  NSRect rectOfBGWindow = [[[DataComputing sizeOfGrids] objectAtIndex:0] rectValue];  
  
  
  [self.backgroundWindow.window setBackgroundColor:[NSColor colorWithCalibratedRed:0 green:1 blue:0 alpha:0.3f]]; 
  [self.backgroundWindow.window setAlphaValue:0.3f];
  [self.backgroundWindow.window setFrame:rectOfBGWindow display:YES animate:NO];
  [self.backgroundWindow.window setIgnoresMouseEvents:YES];
  [self.backgroundWindow showWindow:nil];
}

#pragma mark -
#pragma mark Render ScreenGrids

- (void)activateScreenGrids{

//  NSAppleScript* playPause = [[NSAppleScript alloc] initWithSource:
//                              @"tell application \"Safari\"\n"
//                              @"if it is running then\n"
//                              @"return URL of front document as string\n"
//                              //@"set bounds of window 1 to {(2560 / 3), 0, 2560, 1440}"
//                              @"end if\n"
//                              @"end tell"];
// NSString *str =  [[playPause executeAndReturnError:nil] stringValue];
//  NSLog(@"%@",str);
  [NSApp activateIgnoringOtherApps:YES];
  
  NSLog(@"%f",self.backgroundWindow.window.frame.origin.x);
  NSLog(@"%f",self.backgroundWindow.window.frame.origin.y);
  NSLog(@"%f",self.backgroundWindow.window.frame.size.width);
  NSLog(@"%f",self.backgroundWindow.window.frame.size.height);
  
  NSSize size = [[self.backgroundWindow.window dockTile] size];
  
  NSLog(@"%f",size.width);
  NSLog(@"%f",size.height);
  [self gridWindowInit];

}
- (void)deactivateScreenGrids{
//  NSLog(@"%@",[[NSApp accessibilityAttributeNames] description]);
  [NSApp activateIgnoringOtherApps:YES];
  [self.backgroundWindow close];
  
}
#pragma mark -
#pragma mark Menu Clik Implement

- (IBAction)aboutClick:(id)sender{
  [NSApp activateIgnoringOtherApps:YES];
  [NSApp orderFrontStandardAboutPanel:nil];
}

- (IBAction) devWebsite:(id)sender{
//  [NSApp openURL:[NSURL URLWithString:@"http://weibo.com/leexd22/profile?leftnav=1&wvr=3.6"]];
  [[NSWorkspace sharedWorkspace] openURL:
   [NSURL URLWithString:@"http://weibo.com/leexd22/profile?leftnav=1&wvr=3.6"]];
}

- (IBAction)reportBug:(id)sender{
  NSString *emailString = [NSString stringWithString:@"\
                           tell application \"Mail\"\n activate\n\
                           set newMessage to make new outgoing message with properties {subject:\"Report a bug on ScreenGrids\", content:\"\" & return} \n\
                           tell newMessage\n\
                           set visible to true\n\
                           make new to recipient at end of to recipients with properties {name:\"Alber Lee Studio\", address:\"albert_leee@me.com\"}\n\
                           end tell\n end tell"];
  
  
  
  NSLog(@"%@",emailString);
  NSAppleScript *emailScript = [[NSAppleScript alloc] initWithSource:emailString];
  [emailScript executeAndReturnError:nil];
}

- (IBAction)preferences:(id)sender{
  [NSApp activateIgnoringOtherApps:YES];
  [self.mainWindow showWindow:nil];
}

- (IBAction)quitApp:(id)sender{
  [NSApp terminate:nil];
}

@end
