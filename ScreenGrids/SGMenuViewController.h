//
//  SGMenuViewController.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/6/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DataComputing.h"
#import "SGPreferencesViewController.h"
@interface SGMenuViewController : NSViewController
{
  NSStatusItem *statusItem;
  IBOutlet NSMenu *MainMenu;
  SGPreferencesViewController *preferencesControl;
}

- (IBAction) aboutClick:(id)sender;
- (IBAction) quitApp:(id)sender;
- (IBAction) preferencesClick:(id)sender;
@end
