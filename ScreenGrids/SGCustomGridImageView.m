//
//  SGCustomGridImageView.m
//  ScreenGrids
//
//  Created by Albert Lee on 5/15/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "SGCustomGridImageView.h"

@implementation SGCustomGridImageView
@synthesize iVerNum,fVerFir,fVerSec,iHorNum,fHorFir,fHorSec;
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
    // Drawing code here.
}

@end
