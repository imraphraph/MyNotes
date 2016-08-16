//
//  Note.h
//  MyNotes
//
//  Created by Raphael Lim on 16/08/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//


//added into new Note.h
@interface Note: NSObject

@property NSString *title;
//@property NSString *notesData;
@property NSString *content;

//this takes the data from RootViewController initWithTitle
-(id) initWithTitleAndContent: (NSString *) title content:(NSString *) content;

@end
