//
//  SGGridRearrange.m
//  ScreenGrids
//
//  Created by Albert Lee on 5/19/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "SGGridRearrange.h"
#define kAnimationKey @"transitionViewAnimation"
@implementation SGGridRearrange
+ (void)reArrangeWithRect:(NSRect)rect{
  AXValueRef temp;
  CGSize windowSize;
  CGPoint windowPosition;
  CFStringRef windowTitle;
  AXUIElementRef frontMostApp;
  AXUIElementRef frontMostWindow;
  
  if (!amIAuthorized()) {
    printf("Can't use accessibility API!\n");
  }
  
  /* Here we go. Find out which process is front-most */
  frontMostApp = getFrontMostApp();  
  
  /* Get the front most window. We could also get an array of all windows
   * of this process and ask each window if it is front most, but that is
   * quite inefficient if we only need the front most window.
   */
  AXUIElementCopyAttributeValue(frontMostApp, 
                                kAXFocusedWindowAttribute, 
                                (CFTypeRef *)&frontMostWindow);
  
  /* Get the title of the window */
  AXUIElementCopyAttributeValue(frontMostWindow, 
                                kAXTitleAttribute, 
                                (CFTypeRef *)&windowTitle);
  
  /* Get the window size and position */
  AXUIElementCopyAttributeValue(frontMostWindow, 
                                kAXSizeAttribute, 
                                (CFTypeRef *)&temp);
  
  if (temp!=nil&&frontMostWindow!=nil) {
    AXValueGetValue(temp, kAXValueCGSizeType, &windowSize);
    CFRelease(temp);
  }
  
  
  AXUIElementCopyAttributeValue(
                                frontMostWindow, kAXPositionAttribute, (CFTypeRef *)&temp
                                );
  if (temp!=nil&&frontMostWindow!=nil){
    AXValueGetValue(temp, kAXValueCGPointType, &windowPosition);
    CFRelease(temp);
  }
  
  CGFloat getY = [NSScreen mainScreen].frame.size.height;
  
  windowPosition.x = rect.origin.x;
  windowPosition.y = getY - rect.size.height - rect.origin.y;
  windowSize.height = rect.size.height;
  windowSize.width = rect.size.width;
  temp = AXValueCreate(kAXValueCGPointType, &windowPosition);
  if  (temp!=nil&&frontMostWindow!=nil){
    AXUIElementSetAttributeValue(frontMostWindow, kAXPositionAttribute, temp);
  }
  
  temp = AXValueCreate(kAXValueCGSizeType, &windowSize);
  
  //  CATransition *animation = [CATransition animation];
  //  [animation setDelegate:self];
  //  [animation setType:kCATransitionPush];
  //  [animation setSubtype:kCATransitionFromBottom];
  //  [animation setDuration:0.5];
  //  [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  if  (temp!=nil&&frontMostWindow!=nil){
    AXUIElementSetAttributeValue(frontMostWindow, kAXSizeAttribute, temp);
  }
  
  //  [NSApp addAnimation:animation forKey:kAnimationKey];
  if  (temp!=nil){
    CFRelease(temp);
  }
  
  /* Clean up */
  if (frontMostWindow!=nil){
    CFRelease(frontMostWindow);
  }
  if (frontMostApp!=nil){
    CFRelease(frontMostApp);
  }
}

static bool amIAuthorized ()
{
  if (AXAPIEnabled() != 0) {
    return true;
  }
  if (AXIsProcessTrusted() != 0) {
    return true;
  }
  return false;
}

static AXUIElementRef getFrontMostApp ()
{
  pid_t pid;
  ProcessSerialNumber psn;
  
  GetFrontProcess(&psn);
  GetProcessPID(&psn, &pid);
  return AXUIElementCreateApplication(pid);
}
@end
