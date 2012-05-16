//
//  DataComputing.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/9/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScreenGrids-Prefix.pch"
#define TOP_BAR_HEIGHT 20
@interface DataComputing : NSObject
+ (NSArray*) sizeOfGrids;

+ (NSArray*) arrayTemplateByNum:(NSInteger)integer;
+ (NSArray*) arrayTemplateGridPoints:(NSInteger)integer withRect:(NSRect)rect;
+ (NSArray*) arrayCustomGrid;
+ (NSArray*) arrayCustomGridPointsFromFrame:(NSRect)rect;
@end
