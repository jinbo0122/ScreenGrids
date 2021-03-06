//
//  ALAppDelegate.h
//  ScreenGrids
//
//  Created by Albert Lee on 3/5/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>
#import "SGPreferencesWindowController.h"
#import "SGBackgroundWindowController.h"
#import "SGGridInfo.h"
#import "PTHotKey.h"
#import "PTHotKeyCenter.h"
#import "DataComputing.h"
#import "SGGridRearrange.h"
@interface ALAppDelegate : NSObject <NSApplicationDelegate>

@property (strong) NSStatusItem *statusItem;
@property (strong) NSMenu *mainMenu;
@property (strong) SGPreferencesWindowController *mainWindow;
@property (strong) SGBackgroundWindowController *backgroundWindow;
@property (strong) PTHotKey *hotKey;
@property (strong) id eventMonitor;

-     (void) menuInit; 
-     (void) hotkeyInit;
-     (void) gridWindowInit;
- (void)beginEventMonitor;
- (void)stopEventMonitor;
- (IBAction)  aboutClick:(id)sender;
- (IBAction)  devWebsite:(id)sender;
- (IBAction)   reportBug:(id)sender;
- (IBAction) preferences:(id)sender;
- (IBAction)     quitApp:(id)sender;
@end
