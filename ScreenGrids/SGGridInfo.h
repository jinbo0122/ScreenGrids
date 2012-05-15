//
//  SGGridInfo.h
//  ScreenGrids
//
//  Created by Albert Lee on 5/14/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataComputing.h"
@interface SGGridInfo : NSObject

@property(nonatomic,assign)NSInteger iGridNum;
@property(nonatomic,strong)NSArray *gridArray;

- (BOOL)checkGridConsistency;
- (NSInteger)mouseInGridNum:(NSPoint)point;
@end
