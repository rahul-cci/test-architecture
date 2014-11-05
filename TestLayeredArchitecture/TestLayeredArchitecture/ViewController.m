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

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UserManager *userManager = [[UserManager alloc]init];
    User *user = [userManager getCurrentInUser];
    [self.nameLabel setText:user.lastName];
    
    user.firstName = @"Creative";
    user.lastName = @"Capsule";
    user.joiningDate = [NSDate date];
    user.age = 25;
    user.isSalaried = YES;
    [userManager saveUser:user];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
