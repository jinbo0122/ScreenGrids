//
//  DataComputing.h
//  ScreenGrids
//
//  Created by Albert Lee on 4/9/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#define TOP_BAR_HEIGHT 20
@interface DataComputing : NSObject
+ (NSArray*) sizeOfGrids;

+ (NSArray*) arrayTemplateByNum:(NSInteger)integer;
+ (NSArray*) arrayCustomGridByVerticalNum:(NSInteger)verNum 
                            withVerFirPer:(NSInteger)verFirPer 
                            withVerSecPer:(NSInteger)verSecPer 
                        withHorizontalNum:(NSInteger)horNum 
                            withHorFirPer:(NSInteger)horFirPer 
                            withHorSecPer:(NSInteger)horSecPer;
@end
