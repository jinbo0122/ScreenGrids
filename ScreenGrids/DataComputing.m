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
  //  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES);
  //  NSString *documentDirectory = [paths objectAtIndex:0];
  //  NSString *finalPath = [documentDirectory stringByAppendingPathComponent:@"Preferences/com.apple.dock.plist"];
  //  NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile: finalPath];
  //  NSString *orientation = [dic valueForKey:@"orientation"];
  //  CGFloat maxDockSize = [[dic valueForKey:@"largesize"] floatValue];
  //  NSInteger dockAutoHide = [[dic valueForKey:@"autohide"] intValue];
  //  
  //  
  CGRect rect;
  //  if (dockAutoHide==0) {
  //    CGFloat height = mainFrame.size.height 
  //    - TOP_BAR_HEIGHT 
  //    - ([orientation isEqualToString:@"bottom"]?maxDockSize:0);
  //    CGFloat  width = mainFrame.size.width
  //    - ([orientation isEqualToString:@"bottom"]?0:maxDockSize);
  //    CGFloat      x = [orientation isEqualToString:@"left"]?maxDockSize:0;
  //    CGFloat      y = [orientation isEqualToString:@"bottom"]?maxDockSize:0;//TOP_BAR_HEIGHT;
  //    rect = CGRectMake(x, y, width, height);
  //  }
  //  else {
  rect = CGRectMake(0, 
                    0, 
                    mainFrame.size.width, 
                    mainFrame.size.height-TOP_BAR_HEIGHT);
  //  }
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
  
  CGFloat verFirPer = [userDefaults   floatForKey:kSGVerticalFirstPer];
  CGFloat verSecPer = [userDefaults   floatForKey:kSGVerticalSecondPer];
  CGFloat horFirPer = [userDefaults   floatForKey:kSGHorizontalFirstPer];
  CGFloat horSecPer = [userDefaults   floatForKey:kSGHorizontalSecondPer];
  
  NSInteger iVerNum = [userDefaults integerForKey:kSGVerticalNum];
  NSInteger iHorNum = [userDefaults integerForKey:kSGHorizontalNum];
  //serial vertical point  
  
  NSMutableArray *arrayVer = [NSMutableArray arrayWithObject:[NSNumber numberWithInteger:0]];
  if(iVerNum == 0){
  }
  else if (iVerNum == 1) {
    [arrayVer addObject:[NSNumber numberWithFloat:verFirPer]];
  }
  else {
    if(verFirPer!=0)
      [arrayVer addObject:[NSNumber numberWithFloat:verFirPer]];
    if (verFirPer!=verSecPer) {
      if (verSecPer<verFirPer && verSecPer>0) {        
        [arrayVer insertObject:[NSNumber numberWithFloat:verSecPer] atIndex:1];
      }
      else if (verSecPer > verFirPer) {
        [arrayVer addObject:[NSNumber numberWithFloat:verSecPer]];
      }
    }
  }
  [arrayVer addObject:[NSNumber numberWithFloat:1]];
  //serial horizontal point  
  NSMutableArray *arrayHor = [NSMutableArray arrayWithObject:[NSNumber numberWithInteger:0]];
  if(iHorNum == 0){
  }
  else if (iHorNum == 1) {
    [arrayHor addObject:[NSNumber numberWithFloat:horFirPer]];
  }
  else {
    if(horFirPer!=0)
      [arrayHor addObject:[NSNumber numberWithFloat:horFirPer]];
    if (horFirPer!=horSecPer) {
      if (horSecPer<horFirPer && horSecPer>0) {
        [arrayHor insertObject:[NSNumber numberWithFloat:horSecPer] atIndex:1];
      }
      else if (horSecPer > horFirPer) {
        [arrayHor addObject:[NSNumber numberWithFloat:horSecPer]];
      }
    }
  }
  [arrayHor addObject:[NSNumber numberWithFloat:1]];
  
//  NSLog(@"arrayVer:%@\narrayHor:%@",[arrayVer description],[arrayHor description]);
  //construct grid array  
  NSMutableArray *array = [NSMutableArray array];
  for(NSInteger integerHor=0; integerHor<[arrayHor count]; integerHor++){
    for(NSInteger integerVer=0; integerVer<[arrayVer count]; integerVer++) {
      
      CGFloat x = [[arrayVer objectAtIndex:integerVer] floatValue];
      CGFloat y = [[arrayHor objectAtIndex:integerHor] floatValue];
      
      if (x!=1){
        if (y!=1){
          CGFloat width  = [[arrayVer objectAtIndex:integerVer+1] floatValue] - x;
          CGFloat height = [[arrayHor objectAtIndex:integerHor+1] floatValue] - y;
          [array addObject:[NSValue valueWithRect:NSMakeRect(x, y, width, height)]];
        }
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
    [array addObject:[NSValue valueWithRect:NSMakeRect(x, y+fHorFir*height, x + width, y+fHorFir*height)]];
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


+ (NSInteger)mouseInGridNum:(NSPoint)point{
  NSRect gridWindowRect = [[[DataComputing sizeOfGrids] objectAtIndex:0] rectValue];
  CGFloat verPer = (point.y -  gridWindowRect.origin.y)/gridWindowRect.size.height;
  CGFloat horPer = (point.x - gridWindowRect.origin.x)/gridWindowRect.size.width;
  
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  NSInteger iArrangementOption = [userDefaults integerForKey:kSGArrangementOption];
  NSInteger iTemplatenum = [userDefaults integerForKey:kSGTemplateNum];
  NSArray *array;
  if (iArrangementOption == 0) {
    array = [NSArray arrayWithArray:[DataComputing arrayTemplateByNum:iTemplatenum]];
  }
  else {
    array = [NSArray arrayWithArray:[DataComputing arrayCustomGrid]];
  }
  
  for (NSInteger integer = 0;integer<[array count];integer++) {
    NSRect rect = [[array objectAtIndex:integer] rectValue];
    if (verPer>rect.origin.y&&verPer<=(rect.origin.y+rect.size.height)
        &&horPer>rect.origin.x&&horPer<=(rect.origin.x+rect.size.width)) {
      return integer;
    }
  }
  return -1;
}

+ (NSRect)rectOfActualGridToTransform:(NSInteger)iGrid{
  NSInteger iArrange = [[NSUserDefaults standardUserDefaults] integerForKey:kSGArrangementOption];
  NSArray *array;
  NSRect rect;
  if (iArrange == 0) {
    NSInteger iTemplate = [[NSUserDefaults standardUserDefaults] integerForKey:kSGTemplateNum];
    array = [NSArray arrayWithArray:[DataComputing arrayTemplateByNum:iTemplate]];
  }
  else{
    array = [NSArray arrayWithArray:[DataComputing arrayCustomGrid]];
  }
  rect = [[array objectAtIndex:iGrid] rectValue];
  NSRect rectWhole = [[[DataComputing sizeOfGrids] objectAtIndex:0] rectValue];
  rect = NSMakeRect(rect.origin.x*rectWhole.size.width, 
                    rect.origin.y*rectWhole.size.height, 
                    rect.size.width*rectWhole.size.width, 
                    rect.size.height*rectWhole.size.height);
  return rect;
}



#pragma mark -
#pragma mark system method
+ (void)showErrorMessage{
  NSAlert *alert = [NSAlert alertWithMessageText:@"Oops" 
                                   defaultButton:@"OK" 
                                 alternateButton:nil 
                                     otherButton:nil 
                       informativeTextWithFormat:@"Current Window is not in any grids"];
  [alert runModal];
}

+ (void)reportABug{
  NSString *emailString = [NSString stringWithString:@"\
                           tell application \"Mail\"\n activate\n\
                           set newMessage to make new outgoing message with properties {subject:\"Report a bug on ScreenGrids\", content:\"\" & return} \n\
                           tell newMessage\n\
                           set visible to true\n\
                           make new to recipient at end of to recipients with properties {name:\"Alber Lee Studio\", address:\"albert_leee@me.com\"}\n\
                           end tell\n end tell"];  
  NSAppleScript *emailScript = [[NSAppleScript alloc] initWithSource:emailString];
  [emailScript executeAndReturnError:nil];
}

+ (void)openWebsite{
  [[NSWorkspace sharedWorkspace] openURL:
   [NSURL URLWithString:@"http://weibo.com/leexd22/profile?leftnav=1&wvr=3.6"]];
}
@end
