//
//  CCLoginViewController.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCLoginViewController.h"

#import "CCTextField.h"
#import "CCView.h"

#import "CCAuthValidator.h"

#import "CCDashboardViewController.h"
#import "CCDashboardDataSource.h"

@interface CCLoginViewController ()

@property(nonatomic, weak) IBOutlet CCTextField *emailTextField;
@property(nonatomic, weak) IBOutlet CCTextField *passwordTextField;

@property(nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property(nonatomic, weak) IBOutlet CCView *scrollContentView;

@property(nonatomic, assign, getter = isKeyboardVisible) BOOL keyboardVisisble;

@end

@implementation CCLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // [[self emailTextField] setText:@""];
    // [[self passwordTextField] setText:@""];
}

#pragma mark - Actions

- (IBAction)loginButtonDidClicked:(id)theSender
{
    BOOL isValidInput = [self validateTextWithTextFields:@[
                                                              [self emailTextField]
                                                          ]
                                               validator:[self validator]];
    
    if (isValidInput)
    {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CCDashboardViewController* controller = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CCDashboardViewController class])];
        [controller setContentDataSource:[[CCDashboardDataSource alloc] init]];
        
        [[self navigationController] pushViewController:controller animated:YES];
    }
}

#pragma mark - Keyboard

- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    NSValue *kbFrame = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyboardFrame = [kbFrame CGRectValue];
    
    CGRect convertedFrame = [[self view] convertRect:keyboardFrame fromView:[[self view] window]];
    
    CGFloat height = convertedFrame.size.height;
    
    if (![self isKeyboardVisible])
    {
        UIEdgeInsets insets = [[self scrollView] contentInset];
        insets.bottom += height;
        [[self scrollView] setContentInset:insets];
    }
    
    [self setKeyboardVisisble:YES];
    
    [UIView animateWithDuration:animationDuration animations:^
     {
         [[self view] layoutIfNeeded];
     }];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    NSValue *kbFrame = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyboardFrame = [kbFrame CGRectValue];
    
    CGRect convertedFrame = [[self view] convertRect:keyboardFrame fromView:[[self view] window]];
    
    CGFloat height = convertedFrame.size.height;
    
    if ([self isKeyboardVisible])
    {
        UIEdgeInsets insets = [[self scrollView] contentInset];
        insets.bottom -= height;
        [[self scrollView] setContentInset:insets];
    }
    
    [self setKeyboardVisisble:NO];
    
    [UIView animateWithDuration:animationDuration animations:^
     {
         [[self view] layoutIfNeeded];
     }];
}

#pragma mark UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self loginButtonDidClicked:nil];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    UIColor *color = CC_TEXT_FIELD_PLACEHOLDER_TEXT_COLOR;
    [[self emailTextField] setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:CCLocalizedString(@"TextField.Placeholder.Email")
                                                                                    attributes:@{NSForegroundColorAttributeName : color}]];
    [[self passwordTextField] setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:CCLocalizedString(@"TextField.Placeholder.Password")
                                                                                       attributes:@{NSForegroundColorAttributeName : color}]];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UIColor *color = CC_TEXT_FIELD_PLACEHOLDER_TEXT_COLOR;
    [[self emailTextField] setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:CCLocalizedString(@"TextField.Placeholder.Email")
                                                                                    attributes:@{NSForegroundColorAttributeName : color}]];
    [[self passwordTextField] setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:CCLocalizedString(@"TextField.Placeholder.Password")
                                                                                       attributes:@{NSForegroundColorAttributeName : color}]];
}

#pragma mark - CCNavigationBarAppearanceProtocol

- (CCNavigationBarApperanceStyle)preferredNavigationBarAppearanceStyle
{
    return CCNavigationBarApperanceStyleHidden;
}

#pragma mark - dealloc

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark Alert view

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *doneAction = [UIAlertAction actionWithTitle:CCLocalizedString(@"Alert.Ok")
                                                         style:UIAlertActionStyleDefault
                                                       handler:NULL];
    
    [alert addAction:doneAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
