//
//  SGPreferencesWindowController.m
//  ScreenGrids
//
//  Created by Albert Lee on 4/12/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "SGPreferencesWindowController.h"

@interface SGPreferencesWindowController ()
@end


@implementation SGPreferencesWindowController
#pragma mark -
#pragma mark Init
+ (NSString*)nibName{
  return @"SGPreferencesWindowController";
}

- (void)setupToolbar{  
  [self addView:generalView
          label:@"General" 
          image:[NSImage imageNamed:@"General"]
     identifier:@"prefGeneralIdentifier"];
  [self addView:appearanceView
          label:@"Appearance" 
          image:[NSImage imageNamed:@"Appearance"]
     identifier:@"prefAppearanceIdentifier"];
  [self addView:arragementView
          label:@"Arrangement" 
          image:[NSImage imageNamed:@"Arrangement"]
     identifier:@"prefArrangementIdentifier"];
  [self addView:advancedView
          label:@"Advanced" 
          image:[NSImage imageNamed:@"Advanced"]
     identifier:@"prefAdvancedIdentifier"];
  [self setShiftSlowsAnimation:YES];
  [self setCrossFade:YES];
  [self.window setTitle:@"ScreenGrids Preferences"];
  
  [self dictionaryInit];
  
  [self appearanceTabInit];
  [self arrangementTabInit];
}



- (void)dictionaryInit{
//  [NSUserDefaults resetStandardUserDefaults];
  userDefaults          = [NSUserDefaults standardUserDefaults];
  iBackgroundOption     = [userDefaults integerForKey:kSGBackgroundOption];
  solidButtonColorData  = [userDefaults    dataForKey:kSGBckgroundColor];
  customBgImageData     = [userDefaults    dataForKey:kSGCustomImage];
  iFrameOption          = [userDefaults integerForKey:kSGFrameOption];
  frameButtonColorData  = [userDefaults    dataForKey:kSGFrameColor];
  iArrangementOption    = [userDefaults integerForKey:kSGArrangementOption];
  iTemplateNum          = [userDefaults integerForKey:kSGTemplateNum];
  gridInfo              = [userDefaults  objectForKey:kSGGridInfo];
  
  iVerNum               = [userDefaults integerForKey:kSGVerticalNum];
  iVerFirstSelection    = [userDefaults integerForKey:kSGVerticalFirstPerSelection];
  iVerSecondSelection   = [userDefaults integerForKey:kSGVerticalSecondPerSelection];
  fVerFir               = [userDefaults   floatForKey:kSGVerticalFirstPer];
  fVerSec               = [userDefaults   floatForKey:kSGVerticalSecondPer];
  iHorNum               = [userDefaults integerForKey:kSGHorizontalNum];
  iHorFirstSelection    = [userDefaults integerForKey:kSGHorizontalFirstPerSelection];
  iHorSecondSelection   = [userDefaults integerForKey:kSGHorizontalSecondPerSelection];
  fHorFir               = [userDefaults   floatForKey:kSGHorizontalFirstPer];
  fHorSec               = [userDefaults   floatForKey:kSGHorizontalSecondPer];
  
  if (solidButtonColorData!=nil) {
    solidButtonColor = [NSKeyedUnarchiver unarchiveObjectWithData:solidButtonColorData];
  }
  if (frameButtonColorData!=nil) {
    frameButtonColor = [NSKeyedUnarchiver unarchiveObjectWithData:frameButtonColorData];
  }
}

- (void)syncUserSettings{
  solidButtonColorData = [NSKeyedArchiver archivedDataWithRootObject:solidButtonColor];
  frameButtonColorData = [NSKeyedArchiver archivedDataWithRootObject:frameButtonColor];
  
  [userDefaults setInteger:iBackgroundOption    forKey:kSGBackgroundOption];
  [userDefaults  setObject:solidButtonColorData forKey:kSGBckgroundColor];
  [userDefaults  setObject:customBgImageData    forKey:kSGCustomImage];
  [userDefaults setInteger:iFrameOption         forKey:kSGFrameOption];
  [userDefaults  setObject:frameButtonColorData forKey:kSGFrameColor];
  [userDefaults setInteger:iArrangementOption   forKey:kSGArrangementOption];
  [userDefaults setInteger:iTemplateNum         forKey:kSGTemplateNum];
  [userDefaults  setObject:gridInfo             forKey:kSGGridInfo];
  
  [userDefaults setInteger:iVerNum             forKey:kSGVerticalNum];
  [userDefaults setInteger:iVerFirstSelection  forKey:kSGVerticalFirstPerSelection];
  [userDefaults setInteger:iVerSecondSelection forKey:kSGVerticalSecondPerSelection];
  [userDefaults   setFloat:fVerFir             forKey:kSGVerticalFirstPer];
  [userDefaults   setFloat:fVerSec             forKey:kSGVerticalSecondPer];
  [userDefaults setInteger:iHorNum             forKey:kSGHorizontalNum];
  [userDefaults setInteger:iHorFirstSelection  forKey:kSGHorizontalFirstPerSelection];
  [userDefaults setInteger:iHorSecondSelection forKey:kSGHorizontalSecondPerSelection];
  [userDefaults   setFloat:fHorFir             forKey:kSGHorizontalFirstPer];
  [userDefaults   setFloat:fHorSec             forKey:kSGHorizontalSecondPer];


  [userDefaults synchronize];
}

- (void)arrangementTabInit{
  //To be changed for userdefault read setting 
  
  [gridArrangementStyleComboBox selectItemAtIndex:iArrangementOption];
  

  
  [verticalNumComboBox        selectItemAtIndex:iVerNum];
  [horizontalNumComboBox      selectItemAtIndex:iHorNum];
  [verticalProportionFirst    selectItemAtIndex:iVerFirstSelection];
  [verticalProportionSecond   selectItemAtIndex:iVerSecondSelection]; 
  [horizontalProportionFirst  selectItemAtIndex:iHorFirstSelection];
  [horizontalProportionSecond selectItemAtIndex:iHorSecondSelection];
  
  
  customArrangementFrame = [[NSImageView alloc] initWithFrame:NSMakeRect(28, 95, 343, 212)];
  customArrangementFrame.image = [NSImage imageNamed:@"customFrame.png"];
  [customArrangementView addSubview:customArrangementFrame];
  
  customArrangementImageView = [[SGCustomGridImageView alloc] initWithFrame:NSMakeRect(24, 15, 297, 182)];
  customArrangementImageView.image = [NSImage imageNamed:@"customArrangement.png"];
  customArrangementImageView.imageScaling = NSScaleToFit;
  [customArrangementImageView setVerticalNum:iVerNum 
                               withVerFirPer:fVerFir 
                               withVerSecPer:fVerSec 
                           withHorizontalNum:iHorNum 
                               withHorFirPer:fHorFir 
                               withHorSecPer:fHorSec];
  [customArrangementFrame addSubview:customArrangementImageView];
  
  
  templateImageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, 240, 150)];
  [themeTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:iTemplateNum] byExtendingSelection:YES];
  [themeTableView scrollRowToVisible:iTemplateNum];
  templateImageView.image = [NSImage imageNamed:[NSString stringWithFormat:@"template_%ld",iTemplateNum]];
  templateImageView.imageScaling = NSScaleToFit;
  
  [themeStandardView addSubview:templateImageView];
}

- (void)appearanceTabInit{
  //To be changed for userdefault read setting  
  
  [gridFrameStyleComboBox selectItemAtIndex:iFrameOption];
  [gridBackgroundStyleComboBox selectItemAtIndex:iBackgroundOption];
  
  [solidColorBackgroundButton setBordered:NO];
  [[solidColorBackgroundButton cell] setBackgroundColor:(solidButtonColor==nil)?[NSColor whiteColor]:solidButtonColor];
  [solidColorBackgroundButton setAction:@selector(backgroundColorChoose:)];
  
  [customImageBackgroundButton setBordered:NO];
  if(customBgImageData!=nil){
    [[customImageBackgroundButton cell] setImage:[NSKeyedUnarchiver unarchiveObjectWithData:customBgImageData]];
  }
  else {
    [[customImageBackgroundButton cell] setBackgroundColor:[NSColor whiteColor]];
  }
  [customImageBackgroundButton setAction:@selector(customImageChoose:)];
  
  [frameColorButton setBordered:NO];
  [[frameColorButton cell] setBackgroundColor:(frameButtonColor==nil)?[NSColor whiteColor]:frameButtonColor];
  [frameColorButton setAction:@selector(frameColorChoose:)];
  
}
#pragma mark -
#pragma mark -Table View Datasourse
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
  return DEFAULT_TEMPLATE_NUM;
}


#pragma mark -
#pragma mark -Table View Delegate
- (NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
  NSImageView *imageView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, 109, 100)];
  imageView.image = [NSImage imageNamed:[NSString stringWithFormat:@"template_thumb_%ld",row]];
  imageView.imageScaling = NSScaleToFit;
  return imageView;
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification{
  iTemplateNum = [themeTableView selectedRow];
  templateImageView.image = [NSImage imageNamed:[NSString stringWithFormat:@"template_%ld",iTemplateNum]];
  [self syncUserSettings];
  
  
}

#pragma mark -
#pragma mark -Tab View Delegate
- (void)tabView:(NSTabView *)tabView didSelectTabViewItem:(NSTabViewItem *)tabViewItem{
  if ([NSColorPanel sharedColorPanelExists]) {
    [[NSColorPanel sharedColorPanel] close];
  }
}

#pragma mark -
#pragma mark -ComboBox Delegate
- (void)comboBoxWillPopUp:(NSNotification *)notification{
  if ([NSColorPanel sharedColorPanelExists]) {
    [[NSColorPanel sharedColorPanel] close];
  }
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification{
  NSComboBox *comboBox = notification.object;
  if (comboBox == gridBackgroundStyleComboBox) {
    iBackgroundOption = [gridBackgroundStyleComboBox indexOfSelectedItem];
  }
  else if (comboBox == gridFrameStyleComboBox) {
    iFrameOption = [gridFrameStyleComboBox indexOfSelectedItem];
  }
  else if (comboBox == gridArrangementStyleComboBox) {
    iArrangementOption = [gridArrangementStyleComboBox indexOfSelectedItem];
  }
  
  else if(comboBox == verticalNumComboBox){
    iVerNum = [verticalNumComboBox indexOfSelectedItem];
    switch (iVerNum) {
      case 0:
        [verticalProportionFirst  setEnabled:NO];
        [verticalProportionSecond setEnabled:NO];
        
        fVerFir = 0;
        fVerSec = 0;
        
        break;
      case 1:
        [verticalProportionFirst  setEnabled:YES];
        [verticalProportionSecond setEnabled:NO];
        
        fVerFir = [[verticalProportionFirst objectValueOfSelectedItem] floatValue];
        fVerSec = 0;
        break;
      case 2:
        [verticalProportionFirst  setEnabled:YES];
        [verticalProportionSecond setEnabled:YES];
        
        fVerFir = [[verticalProportionFirst objectValueOfSelectedItem] floatValue];
        fVerSec = [[verticalProportionSecond objectValueOfSelectedItem] floatValue];
        break;
      default:
        break;
    }
    
    [customArrangementImageView setIVerNum:iVerNum];
  }
  
  else if(comboBox == horizontalNumComboBox){
    iHorNum = [horizontalNumComboBox indexOfSelectedItem];
    switch (iHorNum) {
      case 0:
        [horizontalProportionFirst  setEnabled:NO];
        [horizontalProportionSecond setEnabled:NO];
        
        fHorFir = 0;
        fHorSec = 0;
        
        break;
      case 1:
        [horizontalProportionFirst  setEnabled:YES];
        [horizontalProportionSecond setEnabled:NO];
        
        fHorFir = [[horizontalProportionFirst objectValueOfSelectedItem] floatValue];
        fHorSec = 0;
        break;
      case 2:
        [horizontalProportionFirst  setEnabled:YES];
        [horizontalProportionSecond setEnabled:YES];
        
        fHorFir = [[horizontalProportionFirst objectValueOfSelectedItem] floatValue];
        fHorSec = [[horizontalProportionSecond objectValueOfSelectedItem] floatValue];
        break;
      default:
        break;
    }
    [customArrangementImageView setIHorNum:iHorNum];
  }
  
  else if (comboBox == verticalProportionFirst) {
    iVerFirstSelection = [verticalProportionFirst indexOfSelectedItem];
    fVerFir = [[verticalProportionFirst objectValueOfSelectedItem] floatValue];
    [customArrangementImageView setFVerFir:fVerFir];
  }
  else if (comboBox == verticalProportionSecond) {
    iVerSecondSelection = [verticalProportionSecond indexOfSelectedItem];
    fVerSec = [[verticalProportionSecond objectValueOfSelectedItem] floatValue];
    [customArrangementImageView setFVerSec:fVerSec];
  }
  else if (comboBox == horizontalProportionFirst) {
    iHorFirstSelection = [horizontalProportionFirst indexOfSelectedItem];
    fHorFir = [[horizontalProportionFirst objectValueOfSelectedItem] floatValue];
    [customArrangementImageView setFHorFir:fHorFir];
  }
  else if (comboBox == horizontalProportionSecond) {
    iHorSecondSelection = [horizontalProportionSecond indexOfSelectedItem];
    fHorSec = [[horizontalProportionSecond objectValueOfSelectedItem] floatValue];
    [customArrangementImageView setFHorSec:fHorSec];
  }
  [customArrangementImageView removeFromSuperview];
  [customArrangementFrame addSubview:customArrangementImageView];
  [self syncUserSettings];
}
#pragma mark -
#pragma mark -Button Actions

- (void)backgroundColorChoose:(id)sender{
  [[NSColorPanel sharedColorPanel] setColor:solidButtonColor];
  [NSApp orderFrontColorPanel:nil];
}

- (void)customImageChoose:(id)sender{
  NSOpenPanel *openDialog = [NSOpenPanel openPanel];
  [openDialog setCanChooseFiles:YES];
  [openDialog setAllowsMultipleSelection:NO];
  [openDialog setCanChooseDirectories:NO];
  [openDialog setResolvesAliases:NO];
  [openDialog setAllowedFileTypes:[NSArray arrayWithObjects:@"jpg",@"png",@"bmp",@"jpeg",nil]];
  if ([openDialog runModal]==NSOKButton) {
    NSURL *selectedFileName = [[openDialog URLs] objectAtIndex:0];
    NSImage *image = [[NSImage alloc] initWithContentsOfURL:selectedFileName];
    [[customImageBackgroundButton cell] setImage:image];
    customBgImageData = [NSKeyedArchiver archivedDataWithRootObject:image];
    [self syncUserSettings];
  }
}

- (void)frameColorChoose:(id)sender{
  [[NSColorPanel sharedColorPanel] setColor:frameButtonColor];
  [NSApp orderFrontColorPanel:nil];
}


- (void)changeColor:(id)sender{
  NSTabViewItem *currentItem = [appearanceTabView selectedTabViewItem];
  if ([currentItem.label isEqualToString:@"Background"]) {
    solidButtonColor = [[NSColorPanel sharedColorPanel] color];
    [[solidColorBackgroundButton cell] setBackgroundColor:solidButtonColor];
  }
  else if([currentItem.label isEqualToString:@"Frame"]){
    frameButtonColor = [[NSColorPanel sharedColorPanel] color];
    [[frameColorButton cell] setBackgroundColor:frameButtonColor];
  }
  [self syncUserSettings];
}

- (void)sendEvent:(NSEvent*)event{
  if (event.type == NSLeftMouseDown ||event.type == NSRightMouseDown) {
    [[NSColorPanel sharedColorPanel] close];
  }
}



@end
