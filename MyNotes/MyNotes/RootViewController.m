//
//  ViewController.m
//  MyNotes
//
//  Created by Raphael Lim on 16/08/2016.
//  Copyright © 2016 Raphael Lim. All rights reserved.
//

#import "RootViewController.h"
#import "Note.h"
#import "ContentViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *notes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property Note *addNewNote;
@property NSMutableArray *subtitle;

@end
@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
   
    Note *noteOne = [[Note alloc] initWithTitleAndContent: @"note1" content:@"111111"];
    Note *noteTwo = [[Note alloc] initWithTitleAndContent: @"note2" content:@"111111"];
    Note *noteThree = [[Note alloc] initWithTitleAndContent: @"note3" content:@"111111"];
  
    self.notes = [[NSMutableArray alloc]initWithObjects: noteOne, noteTwo, noteThree, nil];
    
    
    
}
- (IBAction)editButton:(UIBarButtonItem *)sender {
    
    //if button is pressed it will toggle between edit and non edit mode each time it is pressed.
    if ([self.tableView isEditing]){
        [self.tableView setEditing:NO animated:YES];
    } else {
        [self.tableView setEditing:YES animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.notes.count; //returns the value of content in array

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NoteCell"]; //links to cell "identifier"
    Note *note = [self.notes objectAtIndex:indexPath.row]; //self.notes[x] placed into *note class Note
    cell.textLabel.text = note.title; //this inserts the self.notes which contain noteOne to noteThree into cell.textLabel.text
    cell.detailTextLabel.text = note.content; //displaying subtitle featuring note's "content"
    return cell; //returns cell back to the "function tableView" that is called
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ContentViewController *destination = segue.destinationViewController;
    
    //links the proper row clicked to transfer the proper informaiton
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    destination.contentViewControllerArray = self.notes;
    Note *note = [self.notes objectAtIndex:indexPath.row];
    
    
    if ([segue.identifier isEqualToString:@"addNewNote"]) {
        Note *newNote = [[Note alloc]init]; //create an empty newNote Note type
        [self.notes addObject:newNote]; //add new data to existing array
        destination.note = newNote; //update note property in ContentViewController.h
    }else{
        destination.note = note; //data from above is passed over to property note which is created at ContentViewController.h
    }
}
//if editing style active use this function
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete){
        //editing style active this removes object at index
        [self.notes removeObjectAtIndex:indexPath.row];
        [self.tableView setEditing: NO animated: YES];
        //refreshes tableView
        [self.tableView reloadData];
        
    }

}
//mandatoryto reload tableView after data is passed. Everytime the viewcontroller is loaded it will refresh
- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}


//code below helps to move the different table views assisted by being activated with an editing mode code above.

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.notes exchangeObjectAtIndex: sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
}

@end
