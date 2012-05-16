//
//  SGPreferencesWindowController.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/12/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DBPrefsWindowController.h"
#import "SGGridInfo.h"
#import "SGCustomGridImageView.h"
#define DEFAULT_TEMPLATE_NUM 6
@interface SGPreferencesWindowController : DBPrefsWindowController<NSTableViewDataSource,NSTableViewDelegate,NSTabViewDelegate,NSComboBoxDelegate>
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
  
  IBOutlet NSTableView  *themeTableView;
  IBOutlet NSView       *themeStandardView;
           NSImageView  *templateImageView;
  NSImageView *customArrangementFrame;
  SGCustomGridImageView *customArrangementImageView; 
  
  IBOutlet NSView     *customArrangementView;
  IBOutlet NSComboBox *verticalNumComboBox;
  IBOutlet NSComboBox *verticalProportionFirst;
  IBOutlet NSComboBox *verticalProportionSecond;
  
  IBOutlet NSComboBox *horizontalNumComboBox;
  IBOutlet NSComboBox *horizontalProportionFirst;
  IBOutlet NSComboBox *horizontalProportionSecond;
  
  IBOutlet NSTabView *appearanceTabView;
  
  
  NSUserDefaults *userDefaults;
  NSInteger      iBackgroundOption;
  NSColor        *solidButtonColor;
  NSData         *solidButtonColorData;
  NSData         *customBgImageData;
  NSInteger      iFrameOption;
  NSColor        *frameButtonColor;
  NSData         *frameButtonColorData;
  NSInteger      iArrangementOption;
  NSInteger      iTemplateNum;
  
  NSInteger iVerNum;
  NSInteger iVerFirstSelection;
  NSInteger iVerSecondSelection;
  CGFloat   fVerFir;
  CGFloat   fVerSec;
  NSInteger iHorNum;
  NSInteger iHorFirstSelection;
  NSInteger iHorSecondSelection;
  CGFloat   fHorFir;
  CGFloat   fHorSec;
  
  SGGridInfo *gridInfo;
  
}

- (void)dictionaryInit;
- (void)arrangementTabInit;
- (void)appearanceTabInit;

- (void)backgroundColorChoose:(id)sender;
- (void)customImageChoose:(id)sender;
- (void)frameColorChoose:(id)sender;

- (void)syncUserSettings;

@end
