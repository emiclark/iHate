//
//  WAMScoreBoardViewController.h
//  
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "GameListViewController.h"
#import "WAMGameViewController.h"

@interface WAMScoreBoardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *audioButton;
@property (weak, nonatomic) IBOutlet UILabel *scoresLabel;
@property (weak, nonatomic) IBOutlet UILabel *topScoresLabel;
@property BOOL soundON;

@property DAO *dao;




@end
