//
//  ViewController.h
//  DOMBrowser2
//
//  Created by Dom on 2/19/15.
//  Copyright (c) 2015 DOM. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DOMViewController : UIViewController  <NSURLConnectionDelegate>

@property (nonatomic, weak) IBOutlet UITextField *urlField;
@property (nonatomic, weak) IBOutlet UITextView *urlContent;
@property (nonatomic, weak) IBOutlet UIButton *goButton;

@property( nonatomic,weak) IBOutlet UIWebView *webpage;

@property (nonatomic, strong) NSMutableString *responseString;


-(IBAction) loadURL:(id) sender;



@end

