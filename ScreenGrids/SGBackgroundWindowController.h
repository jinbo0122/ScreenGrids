//
//  SGBackgroundWindowController.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/17/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SGBackgroundAppearance.h"
@interface SGBackgroundWindowController : NSWindowController
@property (nonatomic, strong,readwrite) SGBackgroundAppearance *appearance;
@end
