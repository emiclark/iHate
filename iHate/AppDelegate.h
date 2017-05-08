//
//  AppDelegate.h
//  iHate
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import <UIKit/UIKit.h>
#import "DAO.h"
@import Firebase;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property DAO *dao;

@end

