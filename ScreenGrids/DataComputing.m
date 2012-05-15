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

+ (NSArray*) arrayCustomGridByVerticalNum:(NSInteger)verNum 
                            withVerFirPer:(NSInteger)verFirPer 
                            withVerSecPer:(NSInteger)verSecPer 
                        withHorizontalNum:(NSInteger)horNum 
                            withHorFirPer:(NSInteger)horFirPer 
                            withHorSecPer:(NSInteger)horSecPer{
//serial vertical point  
  
  NSMutableArray *arrayVer = [NSMutableArray arrayWithObject:[NSNumber numberWithInteger:0]];
  if(verFirPer!=0)
    [arrayVer addObject:[NSNumber numberWithFloat:verFirPer]];
  if (verSecPer<verFirPer && verSecPer>0) {
    [arrayVer addObject:[NSNumber numberWithFloat:verSecPer]];
  }
  else if (verSecPer > verFirPer) {
    [arrayVer insertObject:[NSNumber numberWithFloat:verSecPer] atIndex:1];
  }
  [arrayVer addObject:[NSNumber numberWithFloat:1]];
//serial horizontal point  
  NSMutableArray *arrayHor = [NSMutableArray arrayWithObject:[NSNumber numberWithInteger:0]];
  if(horFirPer!=0)
    [arrayHor addObject:[NSNumber numberWithFloat:horFirPer]];
  if (horSecPer<horFirPer && horSecPer>0) {
    [arrayHor addObject:[NSNumber numberWithFloat:horSecPer]];
  }
  else if (horSecPer > horFirPer) {
    [arrayHor insertObject:[NSNumber numberWithFloat:horSecPer] atIndex:1];
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
@end
