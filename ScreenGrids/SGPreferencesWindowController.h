//
//  SGPreferencesWindowController.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/12/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DBPrefsWindowController.h"
@interface SGPreferencesWindowController : DBPrefsWindowController<NSTableViewDataSource,NSTableViewDelegate>
{  
  DBPrefsWindowController *preferenceControl;
  IBOutlet NSView *generalView;
  IBOutlet NSView *appearanceView;
  IBOutlet NSView *arragementView;
  IBOutlet NSView *advancedView;
  
  IBOutlet NSButton *checkBoxButton;
  
  IBOutlet NSComboBox *gridFrameStyleComboBox;
  IBOutlet NSComboBox *gridBackgroundStyleComboBox;
  IBOutlet NSComboBox *gridArrangementStyleComboBox;
  
  IBOutlet NSButton *solidColorBackgroundButton;
  IBOutlet NSButton *customImageBackgroundButton;
  IBOutlet NSButton *frameColorButton;
  
  IBOutlet NSTableView *themeTableView;
  IBOutlet NSView *themeStandardView;
  
  
  IBOutlet NSView *customArrangementView;
  IBOutlet NSComboBox *verticalNumComboBox;
  IBOutlet NSComboBox *verticalProportionFirst;
  IBOutlet NSComboBox *verticalProportionSecond;
  
  IBOutlet NSComboBox *horizontalNumComboBox;
  IBOutlet NSComboBox *horizontalProportionFirst;
  IBOutlet NSComboBox *horizontalProportionSecond;
}

- (void)arrangementTabInit;
- (void)appearanceTabInit;
@end
