//
//  ALAppDelegate.m
//  ScreenGrids
//
//  Created by Albert Lee on 3/5/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "ALAppDelegate.h"

@implementation ALAppDelegate

@synthesize mainWindow,statusItem,mainMenu,hotKey,backgroundWindow,eventMonitor;

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
  [self.backgroundWindow initWindow];
  [self.backgroundWindow showWindow:nil];
}

#pragma mark -
#pragma mark Render ScreenGrids

- (void)activateScreenGrids{

  [NSApp activateIgnoringOtherApps:YES];
  [self gridWindowInit];
  [self beginEventMonitor];
  
}
- (void)deactivateScreenGrids{
  [NSApp activateIgnoringOtherApps:YES];
  [self.backgroundWindow close];
  [self stopEventMonitor];
  
}


-(void)beginEventMonitor{
  eventMonitor = [NSEvent addGlobalMonitorForEventsMatchingMask:(NSLeftMouseUpMask)
                                                        handler:^(NSEvent *incomingEvent) {
                                                          NSLog(@"Got a mouse click event at %@", NSStringFromPoint([incomingEvent locationInWindow]));
                                                          CGWindowID windowID = (CGWindowID)[incomingEvent windowNumber];
                                                          CFArrayRef a = CFArrayCreate(NULL, (void *)&windowID, 1, NULL);
                                                          NSArray *windowInfos = (__bridge NSArray *)CGWindowListCreateDescriptionFromArray(a);
                                                          CFRelease(a);
                                                          if ([windowInfos count] > 0) {
                                                            NSDictionary *windowInfo = [windowInfos objectAtIndex:0];
                                                            NSLog(@"Name:  %@", [windowInfo objectForKey:(NSString *)kCGWindowName]);
                                                            NSLog(@"Owner: %@", [windowInfo objectForKey:(NSString *)kCGWindowOwnerName]);
                                                            NSLog(@"Owner: %@", [windowInfo objectForKey:(NSString *)kCGWindowBounds]);
                                                            //etc.
                                                          } 
                  NSInteger iGrid = [DataComputing mouseInGridNum:[incomingEvent locationInWindow]];
                  if(iGrid==-1){                    
                    [DataComputing showErrorMessage];
                  }
                  else {
                    NSRect rect = [DataComputing rectOfActualGridToTransform:iGrid];
                    NSLog(@"%@",NSStringFromRect(rect));
                  }
                  }];
}


-(void)stopEventMonitor {
  if (eventMonitor) {
    [NSEvent removeMonitor:eventMonitor];
    eventMonitor = nil;
  }
}
#pragma mark -
#pragma mark Menu Clik Implement

- (IBAction)aboutClick:(id)sender{
  [NSApp activateIgnoringOtherApps:YES];
  [NSApp orderFrontStandardAboutPanel:nil];
}

- (IBAction) devWebsite:(id)sender{
  [DataComputing openWebsite];
}

- (IBAction)reportBug:(id)sender{
  [DataComputing reportABug];
}

- (IBAction)preferences:(id)sender{
  [NSApp activateIgnoringOtherApps:YES];
  [self.mainWindow showWindow:nil];
}

- (IBAction)quitApp:(id)sender{
  [NSApp terminate:nil];
}

@end
