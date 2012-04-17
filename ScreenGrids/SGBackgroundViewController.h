//
//  SGBackgroundViewController.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/11/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SGBackgroundAppearance.h"
@interface SGBackgroundViewController : NSViewController
@property (nonatomic, strong,readwrite) SGBackgroundAppearance *appearance;
@end
