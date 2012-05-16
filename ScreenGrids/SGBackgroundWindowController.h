//
//  SGBackgroundWindowController.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/17/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SGGridInfo.h"
@interface SGBackgroundWindowController : NSWindowController{
  NSInteger      iBackgroundOption;
  NSColor        *solidButtonColor;
  NSImageView    *customBgImageView;
  NSInteger      iFrameOption;
  NSColor        *frameButtonColor;
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

@end
