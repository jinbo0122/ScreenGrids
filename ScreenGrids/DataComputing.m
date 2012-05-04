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
@end
