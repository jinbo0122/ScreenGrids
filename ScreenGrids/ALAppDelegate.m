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
  
//  NSLog(@"%f",self.backgroundWindow.window.frame.origin.x);
//  NSLog(@"%f",self.backgroundWindow.window.frame.origin.y);
//  NSLog(@"%f",self.backgroundWindow.window.frame.size.width);
//  NSLog(@"%f",self.backgroundWindow.window.frame.size.height);
  
//  NSSize size = [[self.backgroundWindow.window dockTile] size];
  
//  NSLog(@"%f",size.width);
//  NSLog(@"%f",size.height);
//  NSPoint point = [NSEvent mouseLocation];
//  NSLog(@"%f ... %f",point.x,point.y);
//  NSLog(@"%lu",[NSEvent pressedMouseButtons]);
  
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
  
  
  
//  NSLog(@"%@",emailString);
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
