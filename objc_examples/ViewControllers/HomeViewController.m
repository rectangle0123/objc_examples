//
//  ViewController.m
//  objc_examples
//
//  Created by Yoshii Hiroki on 2021/04/29.
//

#import "HomeViewController.h"

@interface HomeViewController () {
    // TableView
    UITableView *tableView;
    // ページ分類
    NSArray *sections;
    // ページタイトル
    NSArray *titles;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // タイトル表示
    NSString *appName = [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"];
    self.title = appName;
    // TableViewDataSourceを初期化する
    sections = @[
        NSLocalizedString(@"page_section_basic", nil),
        NSLocalizedString(@"page_section_others", nil)
    ];
    titles = @[
        @[
            NSLocalizedString(@"page_title_dialog", nil),
            NSLocalizedString(@"page_title_webview", nil),
        ],
        @[
            NSLocalizedString(@"page_title_googlemaps", nil),
        ]
    ];
    // TableViewを作成する
    tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource

// セクションの数を返す
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sections.count;
}

// セクション名を返す
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return sections[section];
}

// セルの数を返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [titles[section] count];
}

// セルを作成して返す
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 標準セルを作成する
    NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = titles[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
