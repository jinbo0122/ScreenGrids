//
//  ALAppDelegate.m
//  ScreenGrids
//
//  Created by Albert Lee on 3/5/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "ALAppDelegate.h"

@implementation ALAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  // Insert code here to initialize your application
  mainVC = [[SGMenuViewController alloc] initWithNibName:@"SGMenuViewController" 
                                                  bundle:[NSBundle bundleForClass:[self class]]];
  [self.window.contentView addSubview:mainVC.view];
}

@end
