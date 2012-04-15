//
//  ALAppDelegate.h
//  ScreenGrids
//
//  Created by Albert Lee on 3/5/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JFHotkeyManager.h"
#import "SGPreferencesWindowController.h"
//#import "PTHotKey.h"
@interface ALAppDelegate : NSObject <NSApplicationDelegate>

@property (strong) NSStatusItem *statusItem;
@property (strong) NSMenu *mainMenu;
@property (strong) SGPreferencesWindowController *mainWindow;
@property (strong) JFHotkeyManager *hotkeyManager;
//@property (strong) PTHotKey *hotKey;

-     (void) menuInit; 

- (IBAction) aboutClick:(id)sender;
- (IBAction) preferences:(id)sender;
- (IBAction) quitApp:(id)sender;
@end
