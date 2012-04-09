//
//  ALAppDelegate.h
//  ScreenGrids
//
//  Created by Albert Lee on 3/5/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SGMenuViewController.h"
@interface ALAppDelegate : NSObject <NSApplicationDelegate>
{
  SGMenuViewController *mainVC;
}
@property (assign) IBOutlet NSWindow *window;
@end
