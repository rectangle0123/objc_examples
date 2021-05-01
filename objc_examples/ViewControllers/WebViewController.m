//
//  WebViewController.m
//  objc_examples
//
//  Created by Yoshii Hiroki on 2021/05/01.
//

#import "WebViewController.h"

@interface WebViewController () {
    // WebView
    WKWebView *webView;
}

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初期化
    self.title = NSLocalizedString(@"page_title_webview", nil);
    [self.navigationController.navigationBar setTranslucent:NO];

    // WebViewを作成する
    webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    
    // Webページを表示する
    NSURL *url = [NSURL URLWithString:@"https://news.google.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

@end
