//
//  ContentViewController.h
//  MyNotes
//
//  Created by Raphael Lim on 16/08/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface ContentViewController : UIViewController
@property NSMutableArray *contentViewControllerArray;
@property Note *note; //importing note

@end
