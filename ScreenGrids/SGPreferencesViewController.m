//
//  SGPreferencesViewController.m
//  ScreenGrids
//
//  Created by Albert Lee on 4/11/12.
//  Copyright (c) 2012 FileMaker,Inc. All rights reserved.
//

#import "SGPreferencesViewController.h"

@interface SGPreferencesViewController ()

@end

@implementation SGPreferencesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
      [mainWindow center];
    }
    
    return self;
}

- (void)awakeFromNib{
  [mainWindow center];
}
@end
