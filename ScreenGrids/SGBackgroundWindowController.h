//
//  SGBackgroundWindowController.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/17/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SGGridInfo.h"
#import "SGCustomGridImageView.h"
@interface SGBackgroundWindowController : NSWindowController{
  NSInteger      iBackgroundOption;
  NSColor        *solidButtonColor;
  NSImage        *customBgImage;
  NSInteger      iFrameOption;
  NSColor        *frameButtonColor;
  NSInteger      iArrangementOption;
  NSInteger      iTemplateNum;
  
  SGCustomGridImageView *gridImageView;
  SGGridInfo *gridInfo;
}
- (void)optionReload;
- (void)initWindow;
@end
