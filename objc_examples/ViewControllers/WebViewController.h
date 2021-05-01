//
//  WebViewController.h
//  objc_examples
//
//  Created by Yoshii Hiroki on 2021/05/01.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController <WKUIDelegate, WKNavigationDelegate>

@end

NS_ASSUME_NONNULL_END
