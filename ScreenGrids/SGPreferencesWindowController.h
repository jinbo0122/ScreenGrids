//
//  SGPreferencesWindowController.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/12/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SRRecorderControl.h"
#import "DBPrefsWindowController.h"
@interface SGPreferencesWindowController : NSWindowController
{  
  IBOutlet SRRecorderControl* shortcutRecorder;
}
@end
