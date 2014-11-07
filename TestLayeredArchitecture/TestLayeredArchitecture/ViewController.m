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
#import "SignUpResponse.h"
#import "Anniversary.h"
#import "SignUpRequest.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *anniversaryCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UserManager *userManager = [[UserManager alloc]init];
    User *user = [userManager getCurrentUser];
    if (user == nil) {
        user = [[User alloc]init];
    }
    [self.nameLabel setText:user.lastName];
    [self.companyNameLabel setText:user.currentCompany.companyName];
    [self.anniversaryCount setText:[NSString stringWithFormat:@"count:%lld",[user.anniversaries count]]];
    
    user.firstName = @"Rahul";
    user.lastName = @"S";
    user.joiningDate = [NSDate date];
    user.age = 25;
    user.isSalaried = YES;
    
    Company *c = user.currentCompany;
    if (c == nil) {
        c = [[Company alloc]init];
    }
    c.companyName = @"Creative Capsule";
    c.address = @"Verna";
    user.currentCompany = c;
    
    Anniversary *birthday = [user.anniversaries objectAtIndex:0];
    //Anniversary *birthday = [[Anniversary alloc]init];
    if (birthday == nil) {
        birthday = [[Anniversary alloc]init];
    }
    birthday.title = @"Birthday";
    birthday.date = [NSDate date];
    
    Anniversary *weddingAnn = [user.anniversaries objectAtIndex:1];
    //Anniversary *weddingAnn = [[Anniversary alloc]init];
    weddingAnn.title = @"Wedding Anniversary";
    weddingAnn.date = [NSDate date];
    
    user.anniversaries = [[NSMutableArray alloc]initWithObjects:birthday,weddingAnn, nil];
    
    [userManager saveUser:user];
    
    
    //[self signUp];
}


-(void) signUp
{
    //Create a request object for signup
    SignUpRequest *signupRequest  = [[SignUpRequest alloc]init];
    signupRequest.uuid = @"0E53A7EE-B308-4BEF-8F09-38D25CDC37E7";
    signupRequest.email = @"prachi@creativecapsule.com";
    
    
    //Call the signup method of the manager class
    UserManager *usermanager = [[UserManager alloc]init];
    [usermanager signupUser:signupRequest withCallback:^(SignUpResponse *response, NSError *error) {
        //return code
        NSLog(@"name %@", response.employee.firstName );
    }];
    

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
