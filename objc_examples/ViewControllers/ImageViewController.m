//
//  ImageViewController.m
//  objc_examples
//
//  Created by Yoshii Hiroki on 2021/05/01.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初期化
    self.title = NSLocalizedString(@"page_title_images", nil);
    [self.navigationController.navigationBar setTranslucent:YES];
    
    // 背景画像を表示する
    UIImage *background = [UIImage imageNamed:@"tablecloth.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:background];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 画像を表示する
    UIImage *image = [UIImage imageNamed:@"friedegg.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    [self.view addSubview:imageView];
}

@end
