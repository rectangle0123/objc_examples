//
//  ViewController.m
//  objc_examples
//
//  Created by Yoshii Hiroki on 2021/04/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 60, 200, 30);
    label.text = NSLocalizedString(@"message", nil);
    [self.view addSubview:label];
}


@end
