//
//  WAMScoreBoardViewController.m
//  
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import "WAMScoreBoardViewController.h"

@interface WAMScoreBoardViewController ()


@end

@implementation WAMScoreBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dao = [DAO sharedDataManager];
    
    NSString *scores = @"";

    // show your current and high score
    NSInteger highScore = [[[NSUserDefaults standardUserDefaults] objectForKey:@"highScore"] intValue];
    NSInteger currentScore = [[[NSUserDefaults standardUserDefaults] objectForKey:@"currentScore"] intValue];

    scores = [NSString stringWithFormat: @"YOU SCORED %ld\n YOUR HIGH SCORE %ld\n",(long)currentScore, (long)highScore];

    self.topScoresLabel.numberOfLines = 0;
    [self.topScoresLabel sizeToFit];
    self.topScoresLabel.text = scores;
    
    scores = @"TOP 5 SCORES\n";
    // generate winners list for label
    for (NSString *winners in self.dao.winningScores) {
        scores = [scores stringByAppendingString:[NSString stringWithFormat:@"%@\n", winners]];
    }
    
    NSLog(@"COOOOOOOOL: %@", scores);
    
    self.scoresLabel.numberOfLines = 6;
    [self.scoresLabel sizeToFit];
    self.scoresLabel.text = scores;
}


- (IBAction)replayPressed:(id)sender {
    WAMGameViewController *gameVC = [[WAMGameViewController alloc]init];

    gameVC = [[WAMGameViewController alloc] init];
    DAO *dao = [DAO sharedDataManager];
    dao.currentScore = 0;
    gameVC.currentVictim = dao.currentVictim;
    [self dismissViewControllerAnimated:true completion:nil ];
}

- (IBAction)pickAnotherGamePressed:(id)sender {
//    GameListViewController *gameListVC = [[GameListViewController alloc]init];
    
}


- (IBAction)audioButtonTapped:(UIButton *)sender {
    
    if(self.dao.soundON) {
        [self.audioButton setImage:[UIImage imageNamed:@"audioOFF-icon.png"] forState:UIControlStateNormal];
        [self.dao.backgroundMusic pause];
        self.dao.soundON = NO;
        
    } else  {
        [self.audioButton setImage:[UIImage imageNamed:@"audioON-icon.png"] forState:UIControlStateNormal];
        [self.dao.backgroundMusic play];
        self.dao.soundON = YES;
    }
}

@end
