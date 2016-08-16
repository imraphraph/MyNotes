//
//  Note.m
//  MyNotes
//
//  Created by Raphael Lim on 16/08/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@implementation Note

//execution of code when date is transferred into initWithTitle function
-(id) initWithTitleAndContent:(NSString *)title content:(NSString *)content {
    if (self = [super init]){
        self.title = title;
        self.content = content;
        return self;
    }else{
        return nil;
    }
    

}

@end

