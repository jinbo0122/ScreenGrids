//
//  SGBackgroundWindowController.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/17/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
//#import "SGBackgroundAppearance.h"
@interface SGBackgroundWindowController : NSWindowController
{
  NSColor *_frameColor;
  NSColor *_bgColor;
  
  NSInteger *_frameStyle;
  NSImageView *_bgImage;
}

//@property (nonatomic, strong,readwrite) SGBackgroundAppearance *appearance;
@property(nonatomic,strong)NSImageView *bgImage;
@end
