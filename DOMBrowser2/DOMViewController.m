//
//  ViewController.m
//  DOMBrowser2
//
//  Created by Dom on 2/19/15.
//  Copyright (c) 2015 DOM. All rights reserved.
//

#import "DOMViewController.h"

@interface DOMViewController ()


@end

@implementation DOMViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _responseString = [ [ NSMutableString alloc] initWithCapacity:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//This section of the code returns the text field

#pragma mark - UITextField Delegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

//This section relates to NSURL Connection which checks to see if a connection has been established.

#pragma mark - NSURLConnectonDelegate

-(void)connectionDidFinishLoading:(NSURLConnection *) connection{
    
    UIAlertView *uiAlert = [[UIAlertView alloc]initWithTitle:@"Done Senor!" message:@"Data is here!"
                                                    delegate: self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [uiAlert show];
    [_urlContent setText:_responseString];
}


//append new data to string

-(void) connection: (NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    
    NSString *newData = [NSString stringWithUTF8String: [data bytes]];
    [_responseString appendString:newData];
    
}



- (IBAction)loadURL:(id)sender {
    
    [_urlField resignFirstResponder];
    NSString *simpleAddr = [_urlField text];
    
    if (simpleAddr == nil || [simpleAddr isEqualToString:@""]){
        simpleAddr = @"www.nfl.com";
    }
    
    NSURL *url= [NSURL URLWithString: simpleAddr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //If i were to use the webview ,I would add a request to load webview [webView loadRequest: Request];
    
    NSURLConnection *conn =  [NSURLConnection connectionWithRequest:request delegate:self];
    
    if (conn != nil){
        [conn start ];
    }






    
    
    
}

@end

