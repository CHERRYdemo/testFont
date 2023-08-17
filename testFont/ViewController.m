//
//  ViewController.m
//  testFont
//
//  Created by Meng on 8/17/23.
//

#import "ViewController.h"
#import "ViewModel.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) ViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self commitInit];
    [self.tableView reloadData];
}

#pragma mark - UI
- (void)commitInit {
    self.textView.layer.borderColor = UIColor.grayColor.CGColor;
    self.textView.layer.borderWidth = 1;
    self.textView.layer.cornerRadius = 10;
    self.textView.clipsToBounds = YES;
        
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (IBAction)offTextView:(id)sender {
    [self.textView resignFirstResponder];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  self.viewModel.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    NSString *fontName = self.viewModel.dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = fontName;
    cell.textLabel.font = [UIFont fontWithName:fontName size:18];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.viewModel.sectionArray[section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self offTextView:nil];
    NSString *fontName = self.viewModel.dataArray[indexPath.section][indexPath.row];
    self.textView.font = [UIFont fontWithName:fontName size:18];
}

#pragma mark - Set Get
- (ViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ViewModel alloc] init];
    }
    return _viewModel;
}

@end
