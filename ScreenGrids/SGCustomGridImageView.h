//
//  SGCustomGridImageView.h
//  ScreenGrids
//
//  Created by Albert Lee on 5/15/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SGCustomGridImageView : NSImageView
@property(nonatomic, assign) NSInteger iVerNum;
@property(nonatomic, assign) CGFloat   fVerFir;
@property(nonatomic, assign) CGFloat   fVerSec;
@property(nonatomic, assign) NSInteger iHorNum;
@property(nonatomic, assign) CGFloat   fHorFir;
@property(nonatomic, assign) CGFloat   fHorSec;
- (void) setVerticalNum:(NSInteger)verNum 
          withVerFirPer:  (CGFloat)verFirPer 
          withVerSecPer:  (CGFloat)verSecPer 
      withHorizontalNum:(NSInteger)horNum 
          withHorFirPer:  (CGFloat)horFirPer 
          withHorSecPer:  (CGFloat)horSecPer;
@end
