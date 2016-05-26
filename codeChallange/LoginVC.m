//
//  LoginVCViewController.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "LoginVC.h"
#import "UIViewController+Alerts.h"
#include <CommonCrypto/CommonDigest.h>

static NSUInteger const IterationCount = 5000;

@interface LoginVC ()<UITextFieldDelegate>
{
    __weak IBOutlet UITextField *_loginTextField;
    __weak IBOutlet UITextField *_passwordTextField;
    UITapGestureRecognizer *_recognizer;
}
@end

@implementation LoginVC

//==============================================================================


-(instancetype)init
{
    self = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"LoginVC"] ;
    
    if (self) {
        
    }
    return self;
}


//==============================================================================

- (void)viewDidLoad {
    [super viewDidLoad];
    _recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnView)];
    [self.view addGestureRecognizer:_recognizer];
    // Do any additional setup after loading the view.
}


//==============================================================================

-(void)tapOnView
{
    [self.view endEditing:YES];
}

//==============================================================================


-(IBAction)loginButtonPressed:(id)sender
{
    [self login];
    
}


//==============================================================================

-(void)login{
    NSString *userDataString = [self hashForLoginWithString:[NSString stringWithFormat:@"%@%@",_loginTextField.text,_passwordTextField.text]];
    
    if ([userDataString isEqualToString:[self predifinedUser]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self showAlerControllerWithTitle:@"Can't login" message:@"Invalid username/email or password."];
    }
}

//==============================================================================

- (NSString *)hashForLoginWithString:(NSString *)input
{
    if (input == nil)
    {
        return nil;
    }
    
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(cstr, (CC_LONG)strlen(cstr), digest);
    
    for (int i = 1; i < IterationCount; i++)
    {
        CC_SHA512_CTX context;
        CC_SHA512_Init(&context);
        CC_SHA512_Update(&context, digest, (CC_LONG)CC_SHA512_DIGEST_LENGTH);
        CC_SHA512_Update(&context, cstr, (CC_LONG)strlen(cstr));
        CC_SHA512_Final(digest, &context);
    }
    
    NSString *output = [[NSData dataWithBytes:digest length:CC_SHA512_DIGEST_LENGTH] base64EncodedStringWithOptions:0];
    
    return output;
}


//==============================================================================


-(NSString *)predifinedUser
{
    NSString        *path   = [NSBundle.mainBundle pathForResource:@"PredefinedUser" ofType:@"txt"];
    NSData          *data   = [NSData dataWithContentsOfFile:path];
    return  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

//==============================================================================

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self login];
    return YES;
}



@end
