//
//  ViewController.m
//  TestLayeredArchitecture
//
//  Created by Rahul Shettigar on 04/11/14.
//  Copyright (c) 2014 CCI. All rights reserved.
//

#import "ViewController.h"
#import "UserManager.h"
#import "User.h"
#import "SignUpRequest.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UserManager *userManager = [[UserManager alloc]init];
    User *user = [userManager getCurrentInUser];
    if (user == nil) {
        user = [[User alloc]init];
    }
    
    [self.nameLabel setText:user.lastName];
    
    user.firstName = @"Creative";
    user.lastName = @"Capsule Infotech";
    user.joiningDate = [NSDate date];
    user.age = 25;
    user.isSalaried = YES;
    [userManager saveUser:user];
    
    
    [self signUp];
    
}

-(void) signUp
{
    //
    SignUpRequest *signupRequest  = [[SignUpRequest alloc]init];
    signupRequest.uuid = @"0E53A7EE-B308-4BEF-8F09-38D25CDC37E7";
    signupRequest.email = @"prachi@creativecapsule.com";
    
    //
    UserManager *usermanager = [[UserManager alloc]init];
    SignUpResponse *signUpResponse = [usermanager signupUser:signupRequest];
    
    NSLog(@"name %@", signUpResponse.employee.firstName );
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
