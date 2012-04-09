//
//  SGMenuViewController.m
//  ScreenGrids
//
//  Created by Albert Lee on 4/6/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "SGMenuViewController.h"

@interface SGMenuViewController ()

@end

@implementation SGMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)awakeFromNib{
  if(statusItem){
    [[NSStatusBar systemStatusBar] removeStatusItem:statusItem];
    statusItem = nil;
  }
  
  statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:30.0f];
  [statusItem setImage:[NSImage imageNamed:@"StatusBar"]];
  [statusItem setAlternateImage:[NSImage imageNamed:@"Statusbar_alternate"]];
  [statusItem setHighlightMode:YES];
  [statusItem setToolTip:@"ScreenGrids"];
  [statusItem setMenu:MainMenu];
}

- (IBAction)aboutClick:(id)sender{
  [NSApp activateIgnoringOtherApps:YES];
  [NSApp orderFrontStandardAboutPanel:nil];
}
- (IBAction)quitApp:(id)sender{
  [NSApp terminate:nil];
}
- (IBAction)preferencesClick:(id)sender{

}
@end
