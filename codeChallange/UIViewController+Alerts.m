//
//  UIViewController+Alerts.m
//  membership-ios
//
//  Created by Dmitry Krasulya on 12/8/15.
//  Copyright © 2015 Dmitry Krasulya. All rights reserved.
//

#import "UIViewController+Alerts.h"

@implementation UIViewController (Alerts)

-(void)showAlerControllerWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
