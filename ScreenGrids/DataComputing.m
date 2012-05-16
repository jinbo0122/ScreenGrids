//
//  DataComputing.m
//  ScreenGrids
//
//  Created by Albert Lee on 4/9/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "DataComputing.h"

@implementation DataComputing
+ (NSArray*)sizeOfGrids{
  NSRect mainFrame= [[NSScreen mainScreen] frame];
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES);
  NSString *documentDirectory = [paths objectAtIndex:0];
  NSString *finalPath = [documentDirectory stringByAppendingPathComponent:@"Preferences/com.apple.dock.plist"];
  NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile: finalPath];
  NSString *orientation = [dic valueForKey:@"orientation"];
  CGFloat maxDockSize = [[dic valueForKey:@"largesize"] floatValue];
  NSInteger dockAutoHide = [[dic valueForKey:@"autohide"] intValue];
  
  
  CGRect rect;
  if (dockAutoHide==0) {
    CGFloat height = mainFrame.size.height 
    - TOP_BAR_HEIGHT 
    - ([orientation isEqualToString:@"bottom"]?maxDockSize:0);
    CGFloat  width = mainFrame.size.width
    - ([orientation isEqualToString:@"bottom"]?0:maxDockSize);
    CGFloat      x = [orientation isEqualToString:@"left"]?maxDockSize:0;
    CGFloat      y = [orientation isEqualToString:@"bottom"]?maxDockSize:0;//TOP_BAR_HEIGHT;
    rect = CGRectMake(x, y, width, height);
  }
  else {
    rect = CGRectMake(0, 
                      0, 
                      mainFrame.size.width, 
                      mainFrame.size.height-TOP_BAR_HEIGHT);
  }
  NSMutableArray * rectArray = [NSMutableArray arrayWithObject:[NSValue valueWithRect:rect]];
  NSInteger screenCount = [[NSScreen screens] count];
  if (screenCount>1) {
    for (NSInteger integer = 1;integer<screenCount;integer++) {
      [rectArray addObject:[NSValue valueWithRect:[[[NSScreen screens] objectAtIndex:integer] frame]]];
    }
  }
  return rectArray;
}

+ (NSArray*) arrayTemplateByNum:(NSInteger)integer{
  NSMutableArray *array = [NSMutableArray array];
  
  switch (integer) {
    case 0:
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,   0, 0.5, 0.5)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0, 0.5, 0.5, 0.5)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect( 0.5,   0, 0.5, 0.5)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect( 0.5, 0.5, 0.5, 0.5)]];
      break;
    case 1:
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,   0,0.34,0.34)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,0.34,0.34,0.33)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,0.67,0.34,0.33)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34,   0,0.66, 0.5)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34, 0.5,0.66, 0.5)]];
      break;
    case 2:
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,   0,0.34,0.34)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,0.34,0.34,0.33)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,0.67,0.34,0.33)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34,   0,0.33,0.34)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67,   0,0.33,0.34)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34,0.34,0.33,0.33)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34,0.67,0.33,0.33)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67,0.34,0.33,0.33)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67,0.67,0.33,0.33)]];
      break;
    case 3:
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,   0, 0.5,0.67)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,0.67,0.34,0.33)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect( 0.5,   0, 0.5,0.67)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34,0.67,0.33,0.33)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67,0.67,0.33,0.33)]];
      break;
    case 4:
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,   0,0.34,0.34)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,0.34, 0.5,0.66)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34,   0,0.33,0.34)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67,   0,0.33,0.34)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect( 0.5,0.34, 0.5,0.66)]];
      break;
    case 5:
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0,   0,0.67, 0.5)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(   0, 0.5,0.67, 0.5)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67,   0,0.33,0.34)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67,0.34,0.33,0.33)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67,0.67,0.33,0.33)]];
      break;
      
    default:
      array = nil;
      break;
  }
  
  return array;
}
+ (NSArray*) arrayTemplateGridPoints:(NSInteger)integer withRect:(NSRect)rect{
  NSMutableArray *array = [NSMutableArray array];
  CGFloat width = rect.size.width;
  CGFloat height = rect.size.height;
  
  switch (integer) {
    case 0:
      [array addObject:[NSValue valueWithRect:NSMakeRect(        0,0.5*height,    width,0.5*height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.5*width,         0,0.5*width,    height)]];
      break;
    case 1:
      [array addObject:[NSValue valueWithRect:NSMakeRect(         0,0.34*height,0.34*width,0.34*height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(         0,0.67*height,0.34*width,0.67*height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34*width, 0.5*height,     width, 0.5*height)]];      
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34*width,          0,0.34*width,     height)]];
      break;
    case 2:
      [array addObject:[NSValue valueWithRect:NSMakeRect(         0,0.34*height,     width,0.34*height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(         0,0.67*height,     width,0.67*height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34*width,          0,0.34*width,     height)]];      
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67*width,          0,0.67*width,     height)]];
      break;
    case 3:
      [array addObject:[NSValue valueWithRect:NSMakeRect(         0,0.67*height,     width,0.67*height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34*width,0.67*height,0.34*width,     height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67*width,0.67*height,0.67*width,     height)]];      
      [array addObject:[NSValue valueWithRect:NSMakeRect( 0.5*width,          0, 0.5*width,0.67*height)]];
      break;
    case 4:
      [array addObject:[NSValue valueWithRect:NSMakeRect(         0,0.34*height,     width,0.34*height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.34*width,          0,0.34*width,0.34*height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67*width,          0,0.67*width,0.34*height)]];      
      [array addObject:[NSValue valueWithRect:NSMakeRect( 0.5*width,0.34*height, 0.5*width,     height)]];
      break;
    case 5:
      [array addObject:[NSValue valueWithRect:NSMakeRect(         0, 0.5*height,0.67*width, 0.5*height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67*width,          0,0.67*width,     height)]];
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67*width,0.34*height,     width,0.34*height)]];      
      [array addObject:[NSValue valueWithRect:NSMakeRect(0.67*width,0.67*height,     width,0.67*height)]];
      break;
    default:
      array = nil;
      break;
  }
  return array;
}


+ (NSArray*) arrayCustomGrid{
  
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  
  CGFloat verFirPer               = [userDefaults   floatForKey:kSGVerticalFirstPer];
  CGFloat verSecPer               = [userDefaults   floatForKey:kSGVerticalSecondPer];
  CGFloat horFirPer               = [userDefaults   floatForKey:kSGHorizontalFirstPer];
  CGFloat horSecPer               = [userDefaults   floatForKey:kSGHorizontalSecondPer];
  
  
  //serial vertical point  
  
  NSMutableArray *arrayVer = [NSMutableArray arrayWithObject:[NSNumber numberWithInteger:0]];
  if(verFirPer!=0)
    [arrayVer addObject:[NSNumber numberWithFloat:verFirPer]];
  if (verFirPer!=verSecPer) {
    if (verSecPer<verFirPer && verSecPer>0) {
      [arrayVer addObject:[NSNumber numberWithFloat:verSecPer]];
    }
    else if (verSecPer > verFirPer) {
      [arrayVer insertObject:[NSNumber numberWithFloat:verSecPer] atIndex:1];
    }
  }
  [arrayVer addObject:[NSNumber numberWithFloat:1]];
  //serial horizontal point  
  NSMutableArray *arrayHor = [NSMutableArray arrayWithObject:[NSNumber numberWithInteger:0]];
  if(horFirPer!=0)
    [arrayHor addObject:[NSNumber numberWithFloat:horFirPer]];
  if (horFirPer!=horSecPer) {
    if (horSecPer<horFirPer && horSecPer>0) {
      [arrayHor addObject:[NSNumber numberWithFloat:horSecPer]];
    }
    else if (horSecPer > horFirPer) {
      [arrayHor insertObject:[NSNumber numberWithFloat:horSecPer] atIndex:1];
    }
  }
  [arrayHor addObject:[NSNumber numberWithFloat:1]];
  //construct grid array  
  NSMutableArray *array = [NSMutableArray array];
  for(NSInteger integerHor=0; integerHor<[arrayHor count]; integerHor++){
    for(NSInteger integerVer=0; integerVer<[arrayVer count]; integerVer++) {
      
      CGFloat x = [[arrayHor objectAtIndex:integerHor] floatValue];
      CGFloat y = [[arrayVer objectAtIndex:integerVer] floatValue];
      
      if (x==1 || y==1) {
      }
      else {
        CGFloat width  = [[arrayHor objectAtIndex:integerHor+1] floatValue] - x;
        CGFloat height = [[arrayVer objectAtIndex:integerVer+1] floatValue] - y;
        [array addObject:[NSValue valueWithRect:NSMakeRect(x, y, width, height)]];
      }
      
    }
  }
  return array;
}

+ (NSArray*) arrayCustomGridPointsFromFrame:(NSRect)rect{
  NSMutableArray *array = [NSMutableArray array];
  CGFloat x = rect.origin.x;
  CGFloat y = rect.origin.y;
  CGFloat  width = rect.size.width;
  CGFloat height = rect.size.height;
  
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  
  NSInteger iVerNum               = [userDefaults integerForKey:kSGVerticalNum];
  CGFloat fVerFir               = [userDefaults   floatForKey:kSGVerticalFirstPer];
  CGFloat fVerSec               = [userDefaults   floatForKey:kSGVerticalSecondPer];
  NSInteger iHorNum               = [userDefaults integerForKey:kSGHorizontalNum];
  CGFloat fHorFir               = [userDefaults   floatForKey:kSGHorizontalFirstPer];
  CGFloat fHorSec               = [userDefaults   floatForKey:kSGHorizontalSecondPer];

  // Ignoring clipRect because this isn't a lot of drawing
  if (iHorNum>0) {
    [array addObject:[NSValue valueWithRect:NSMakeRect(x, y+fHorFir*height, x, y+fHorFir*height)]];
  }
  if (iHorNum>1) {
    [array addObject:[NSValue valueWithRect:NSMakeRect(x, y+fHorSec*height, x + width, y+fHorSec*height)]];
  }
  
  if (iVerNum>0) {
    [array addObject:[NSValue valueWithRect:NSMakeRect(x+fVerFir*width, y, x+fVerFir*width, y+height)]];
  }
  
  if (iVerNum>1) {
    [array addObject:[NSValue valueWithRect:NSMakeRect(x+fVerSec*width, y, x+fVerSec*width, y+height)]];
  }

  return array;
}
@end
