// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import "RELBookDetailController.h"
#import "RELAddBookController.h"
#import <ReadingListModel/ReadingListModel.h>
#import "UIStoryboardSegue+RELAdditions.h"

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RLMStoreController *storeController;
@property (strong, readonly, nonatomic) RLMReadingList *readingList;
@end

@implementation RELReadingListController

@synthesize readingList = _readingList;

- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.storeController.fetchedReadingList;
    }
    return _readingList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Book Detail"]) {
        RELBookDetailController *controller = segue.rel_destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        controller.book = [self.readingList bookAtIndexPath:indexPath];
    } else {
        RELAddBookController *controller = segue.rel_destinationViewController;
        typeof(self) __weak weakSelf = self;
        controller.addBook = ^(RLMBook *book) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            [weakSelf.readingList insertBook:book atIndexPath:indexPath];
            [weakSelf.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        };
    }
}

// MARK: - Unwind segues

- (IBAction)done:(UIStoryboardSegue *)unwindSegue {
    [self.tableView reloadData];
    [self.storeController saveReadingList:self.readingList];
}

- (IBAction)cancel:(UIStoryboardSegue *)unwindSegue {
    
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.readingList.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Book Cell"];
    RLMBook *book = [self.readingList bookAtIndexPath:indexPath];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", book.year, book.author.fullName];
    return cell;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.readingList removeBookAtIndexPath:indexPath];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.storeController saveReadingList:self.readingList];
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.readingList moveBookAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
    [self.storeController saveReadingList:self.readingList];
}

@end
