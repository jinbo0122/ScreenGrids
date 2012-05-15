//
//  SGGridInfo.m
//  ScreenGrids
//
//  Created by Albert Lee on 5/14/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "SGGridInfo.h"

@implementation SGGridInfo
@synthesize iGridNum,gridArray;
- (SGGridInfo *)initWithArray:(NSArray*)array{
  SGGridInfo *result = [super init];
  iGridNum = [array count];
  gridArray = array;
  
  if ([result checkGridConsistency]) {
    return result;
  }
  return nil;
}

- (BOOL)checkGridConsistency{
  BOOL result = NO;
  
  CGFloat sum = 0;
  CGFloat height = 0;
  CGFloat width = 0;
  
  for (NSValue *value in gridArray) {
    NSRect rect = [value rectValue];
    CGFloat rectWidth = rect.size.width;
    CGFloat rectHeight = rect.size.height;
    CGFloat rectX = rect.origin.x;
    CGFloat rectY = rect.origin.y;
    
    sum+=rectWidth*rectHeight;
    
    if (rectX == 0) {
      height+=rectHeight;
    }
    if (rectY == 0) {
      width+=rectWidth;
    }
  }
  
  if (sum==1&&height==1&&width==1) {
    result = YES;
  }
  return result;
}

- (NSInteger)mouseInGridNum:(NSPoint)point{
  NSRect gridWindowRect = [[[DataComputing sizeOfGrids] objectAtIndex:0] rectValue];
  NSInteger verPer = (point.y -  gridWindowRect.origin.y)/gridWindowRect.size.height;
  NSInteger horPer = (point.x - gridWindowRect.origin.x)/gridWindowRect.size.width;
  
  for (NSInteger integer = 0;integer<[gridArray count];integer++) {
    NSRect rect = [[gridArray objectAtIndex:integer] rectValue];
    if (verPer>rect.origin.y&&verPer<=(rect.origin.y+rect.size.height)
        &&horPer>rect.origin.x&&horPer<=(rect.origin.x+rect.size.width)) {
      return integer;
    }
  }
  return -1;
}
@end
