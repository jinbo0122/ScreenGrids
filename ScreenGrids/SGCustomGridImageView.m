//
//  SGCustomGridImageView.m
//  ScreenGrids
//
//  Created by Albert Lee on 5/15/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "SGCustomGridImageView.h"

@implementation SGCustomGridImageView
@synthesize iVerNum,fVerFir,fVerSec,iHorNum,fHorFir,fHorSec,iFrameOption,frameColor,iForActualBg;
- (id)initWithFrame:(NSRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code here.
  }
  
  return self;
}
- (void) setVerticalNum:(NSInteger)verNum 
          withVerFirPer:  (CGFloat)verFirPer 
          withVerSecPer:  (CGFloat)verSecPer 
      withHorizontalNum:(NSInteger)horNum 
          withHorFirPer:  (CGFloat)horFirPer 
          withHorSecPer:  (CGFloat)horSecPer{
  iVerNum = verNum;
  fVerFir = verFirPer;
  fVerSec = verSecPer;
  iHorNum = horNum;
  fHorFir = horFirPer;
  fHorSec = horSecPer;
}

- (void)drawRect:(NSRect)dirtyRect
{
  
  
  CGFloat x = dirtyRect.origin.x;
  CGFloat y = dirtyRect.origin.y;
  CGFloat width = dirtyRect.size.width;
  CGFloat height = dirtyRect.size.height;
  
  //  NSRect rect = [[[DataComputing sizeOfGrids] objectAtIndex:0] rectValue];
  //
  //  if (iForActualBg==1) {
  //    x = rect.origin.x;
  //    y = rect.origin.y;
  //    width = rect.size.width;
  //    height = rect.size.height;
  //  }
  
  [super drawRect:dirtyRect];
  // Drawing code here.
  NSGraphicsContext *context = [NSGraphicsContext currentContext];
  
  [context saveGraphicsState];
  NSBezierPath * gridPath = [NSBezierPath bezierPath];
  // Ignoring clipRect because this isn't a lot of drawing
  if (iForActualBg==0) {
    if (iHorNum>0) {
      [gridPath moveToPoint:NSMakePoint(x, y+fHorFir*height)];
      [gridPath lineToPoint:NSMakePoint(x + width,y+fHorFir*height)];
    }
    if (iHorNum>1) {
      [gridPath moveToPoint:NSMakePoint(x, y+fHorSec*height)];
      [gridPath lineToPoint:NSMakePoint(x + width,y+fHorSec*height)];
    }
    
    if (iVerNum>0) {
      [gridPath moveToPoint:NSMakePoint(x+fVerFir*width, y)];
      [gridPath lineToPoint:NSMakePoint(x+fVerFir*width,y+height)];
    }
    
    if (iVerNum>1) {
      [gridPath moveToPoint:NSMakePoint(x+fVerSec*width, y)];
      [gridPath lineToPoint:NSMakePoint(x+fVerSec*width,y+height)];
    }
  }
  else {
    NSInteger iArrangementOption = [[NSUserDefaults standardUserDefaults] integerForKey:kSGArrangementOption];
    NSInteger iTemplateNum = [[NSUserDefaults standardUserDefaults] integerForKey:kSGTemplateNum];
    if (iArrangementOption==0) {
      NSArray * gridPointsArray = [NSArray arrayWithArray:[DataComputing arrayTemplateGridPoints:iTemplateNum withRect:dirtyRect]];
      for (NSValue *value in gridPointsArray) {
        NSRect rect = [value rectValue];      
        [gridPath moveToPoint:NSMakePoint(rect.origin.x, rect.origin.y)];
        [gridPath lineToPoint:NSMakePoint(rect.size.width,rect.size.height)];
      }
    }
    else {
      NSArray *gridPointsArray = [NSArray arrayWithArray:[DataComputing arrayCustomGridPointsFromFrame:dirtyRect]];
      for (NSValue *value in gridPointsArray) {
        NSRect rect = [value rectValue];      
        [gridPath moveToPoint:NSMakePoint(rect.origin.x, rect.origin.y)];
        [gridPath lineToPoint:NSMakePoint(rect.size.width,rect.size.height)];
      }
    }
  }
  
  frameColor = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] dataForKey:kSGFrameColor]];
  if (frameColor==nil) {
    frameColor = [NSColor redColor];
  }
  [frameColor set];
  iFrameOption = [[NSUserDefaults standardUserDefaults] integerForKey:kSGFrameOption];
  if (iFrameOption == 1) {
    CGFloat dash[2] = {5.0f,2.0f};
    [gridPath setLineDash:dash count:2 phase:0.0];
  }
  [gridPath setLineWidth:3.0];
  [gridPath stroke];
  [context restoreGraphicsState];
}

- (void)reloadGridImage{
  
}
@end
