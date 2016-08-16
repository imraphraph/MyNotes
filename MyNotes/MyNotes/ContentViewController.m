//
//  ContentViewController.m
//  MyNotes
//
//  Created by Raphael Lim on 16/08/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

#import "ContentViewController.h"
#import "Note.h"
@interface ContentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.text = self.note.title;
    self.textView.text = self.note.content;
}

- (IBAction)submitButton:(UIButton *)sender {
    //reverse the top, because now you are updating the self.note.title
    self.note.title =self.textField.text;
    self.note.content = self.textView.text;
    
}


@end
