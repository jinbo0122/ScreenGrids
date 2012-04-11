//
//  SGPreferencesViewController.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/11/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SRRecorderControl.h"
@interface SGPreferencesViewController : NSViewController
{
  IBOutlet NSWindow *mainWindow;
  IBOutlet SRRecorderControl* shortcutRecorder;
  
}
@end
