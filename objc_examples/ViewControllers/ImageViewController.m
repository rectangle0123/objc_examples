//
//  ImageViewController.m
//  objc_examples
//
//  Created by Yoshii Hiroki on 2021/05/01.
//

#import "ImageViewController.h"

@interface ImageViewController () {
    UIImage *background;
    UIImage *image;
    UIImageView *imageView;
}

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初期化
    self.title = NSLocalizedString(@"page_title_images", nil);
    [self.navigationController.navigationBar setTranslucent:YES];
    
    // 背景画像を表示する
    background = [UIImage imageNamed:@"tablecloth.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:background];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 画像を表示する
    image = [UIImage imageNamed:@"friedegg.png"];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    [self.view addSubview:imageView];
}

// デバイス回転で再描画する
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [imageView setCenter:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2)];
}

@end
