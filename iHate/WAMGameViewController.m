//
//  WAMGameViewController.m
//  iHate
//
//  Created by Emiko Clark on 5/4/17.
//
//

#import "WAMGameViewController.h"

@interface WAMGameViewController ()

@end

@implementation WAMGameViewController


#define MAX_NUM_FOR_HEADS  5
#define MAX_TIME 5

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dao = [DAO sharedDataManager];
    self.dao.currentVictim = self.currentVictim;
    
}

- (void) viewWillAppear:(BOOL)animated   {
    
    [self.timer1 invalidate];
    [self.timer2 invalidate];
    [self.timer3 invalidate];
    
    self.gameTime = MAX_TIME;
    self.currentGameTime = MAX_TIME;
    self.gameFinished = FALSE;
    self.timeLabel.text = [NSString stringWithFormat:@":%d Secs", self.currentGameTime];
    self.scoreLabel.text = @"0";

    
    if(self.currentVictim != nil){
        [self.button1 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button2 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button3 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button4 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button5 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button6 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button7 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button8 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button9 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button10 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button11 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
        [self.button12 setBackgroundImage:self.currentVictim forState:UIControlStateNormal];
    }
    
    
    self.howOftenHeadsPopUp = arc4random_uniform(MAX_NUM_FOR_HEADS);
    
    // begin timer
    
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:self.howOftenHeadsPopUp target:self selector:@selector(activateVictim) userInfo:nil repeats:YES];
    
    self.timer2 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
    self.timer3 = [NSTimer scheduledTimerWithTimeInterval:self.gameTime target:self selector:@selector(finishGame) userInfo:nil repeats:NO];
 
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.timer1 invalidate];
    [self.timer2 invalidate];
    [self.timer3 invalidate];
    
    [super viewWillDisappear: animated];
    
    self.timer1 = nil;
    self.timer2 = nil;
    self.timer3 = nil;
    
}

-(void) updateTime{
    self.currentGameTime--;
    self.timeLabel.text = [NSString stringWithFormat:@":%d Secs", self.currentGameTime];
}

-(void) finishGame {
    
    self.gameFinished = TRUE;

    [self displayMsg:[NSString stringWithFormat:@"Score:%i", self.dao.currentScore]];
    [self.timer1 invalidate];
    [self.timer2 invalidate];
    [self.timer3 invalidate];
    
    // save your score and high score to NSUserDefaults
    int highScore = [[[NSUserDefaults standardUserDefaults] objectForKey:@"highScore"] intValue];

        if (self.dao.currentScore > highScore) {
            highScore = self.dao.currentScore;
        } else if (highScore == 0) {
            highScore = 0;
        }
    // save current score and high score to nsuserdefaults
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:self.dao.currentScore] forKey:@"currentScore"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:highScore] forKey:@"highScore"];

}

- (void) displayMsg:(NSString *)msg
{
    // Initialize the controller for displaying the message
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@" " message:msg  preferredStyle:UIAlertControllerStyleAlert];
    
    // Create an OK button
    UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *theName = alert.textFields[0].text;
        if (theName.length == 0) {
            self.dao.currentName = @"player";
        } else {
            self.dao.currentName = theName;
        }        
        [self performSegueWithIdentifier:@"showResults" sender:self];
    }];
    
    // Add the button to the controller
    [alert addAction:okButton];
    
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Enter your Name";
        textField.keyboardType = UIKeyboardTypeDefault;
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSNumber *score = [[NSNumber alloc]initWithInt:self.dao.currentScore];
    [self.dao patchDataBase:score  andName:self.dao.currentName];
}

-(void) activateVictim {
    
    if(self.gameFinished){
        
        return;
    }
    
    self.howOftenHeadsPopUp = arc4random_uniform(MAX_NUM_FOR_HEADS);
    
    int numberOfHeadsPoppingUp = arc4random_uniform(MAX_NUM_FOR_HEADS);
    NSLog(@"numberOfHeadsPoppingUp: %d,  howOftenHeadsPopUp:%d", numberOfHeadsPoppingUp,self.howOftenHeadsPopUp);
    
    
    switch (numberOfHeadsPoppingUp) {
        case 0:
            [self whichHeads];
            break;
        case 1:
            [self whichHeads];
            [self whichHeads];
            break;
        case 2:
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            break;
        case 3:
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            break;
        case 4:
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            break;
        case 5:
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            break;
        case 6:
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            [self whichHeads];
            break;
        default:
            break;
    }
}

-(void) turnButtonOff: (NSTimer*) timer {
    UIButton *button = timer.userInfo;

    if(!button.hidden){
        button.hidden = YES;
    }
}

- (void) playHitSound {
    SystemSoundID audioEffect;
    NSString *path;
    int whichSound = arc4random_uniform(4);
    
    switch (whichSound) {
        case 0:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplatSound" ofType :@"mp3"];
            break;
        case 1:
            path = [[NSBundle mainBundle] pathForResource : @"squishSound" ofType :@"mp3"];
            break;
        case 2:
            path = [[NSBundle mainBundle] pathForResource : @"boneSound" ofType :@"mp3"];
            break;
        case 3:
            path = [[NSBundle mainBundle] pathForResource : @"squishySound" ofType :@"mp3"];
            break;

            
        default:
            break;
            
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath : path]) {
        NSURL *pathURL = [NSURL fileURLWithPath: path];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) pathURL, &audioEffect);
        AudioServicesPlaySystemSound(audioEffect);
    }
    else {
        NSLog(@"error, file not found: %@", path);
    }
    
}

- (void) showBloodSplat {

    NSString *path;
    int showBloodSplat = arc4random_uniform(10);
    
    
    switch (showBloodSplat) {
        case 0:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplat-1" ofType :@"png"];
            break;
        case 1:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplat-2" ofType :@"png"];
            break;
        case 2:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplat-3" ofType :@"png"];
            break;
        case 3:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplat-4" ofType :@"png"];
            break;
        case 4:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplat-5" ofType :@"png"];
            break;
        case 5:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplat-6" ofType :@"png"];
            break;
        case 6:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplat-7" ofType :@"png"];
            break;
        case 7:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplat-8" ofType :@"png"];
            break;
        case 8:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplat-9" ofType :@"png"];
            break;
        case 9:
            path = [[NSBundle mainBundle] pathForResource : @"bloodSplat-0" ofType :@"png"];
            break;
        default:
            break;
            
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath : path]) {
        //set timer to show bloodSplat
        self.bloodSplats.image = [UIImage imageNamed: path];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showSplat:) userInfo:nil repeats:NO];
    }
    else {
        NSLog(@"error, file not found: %@", path);
    }
    
}


-(void) showSplat:(NSTimer*) timer {
    NSTimer *endIt = timer;
    self.bloodSplats.image = nil;
    [timer invalidate];
    
    NSLog(@"endit:%@",endIt);
    
}


-(void) whichHeads {
    
    int whichHeadsPopUp = arc4random_uniform(12);
    
    switch (whichHeadsPopUp) {
        case 0:
            self.button1.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button1 repeats:NO];
            break;
        case 1:
            self.button2.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button2 repeats:NO];
            break;
        case 2:
            self.button3.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button3 repeats:NO];
            break;
        case 3:
            self.button4.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button4 repeats:NO];
            break;
        case 4:
            self.button5.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button5 repeats:NO];
            break;
        case 5:
            self.button6.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button6 repeats:NO];
            break;
        case 6:
            self.button7.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button7 repeats:NO];
            break;
        case 7:
            self.button8.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button8 repeats:NO];
            break;
        case 8:
            self.button9.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button9 repeats:NO];
            break;
        case 9:
            self.button10.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button10 repeats:NO];
            break;
        case 10:
            self.button11.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button11 repeats:NO];
            break;
        case 11:
            self.button12.hidden = NO;
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(turnButtonOff:) userInfo:self.button12 repeats:NO];
            break;
        default:
            break;
    }
    
}

//MARK: Button Actions

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


- (IBAction)button1Pressed:(id)sender {
    self.button1.hidden = YES;
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self playHitSound];
    [self showBloodSplat];
}

- (IBAction)button2Pressed:(id)sender {
    self.button2.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self showBloodSplat];
}

- (IBAction)button3Pressed:(id)sender {
    self.button3.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self showBloodSplat];
}

- (IBAction)button4Pressed:(id)sender {
    self.button4.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self showBloodSplat];
}

- (IBAction)button5Pressed:(id)sender {
    self.button5.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self showBloodSplat];
}

- (IBAction)button6Pressed:(id)sender {
    self.button6.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self showBloodSplat];

}
- (IBAction)button7Pressed:(id)sender {
    self.button7.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self showBloodSplat];
}

- (IBAction)button8Pressed:(id)sender {
    self.button8.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self showBloodSplat];
}

- (IBAction)button9Pressed:(id)sender {
    self.button9.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self showBloodSplat];
}

- (IBAction)button10Pressed:(id)sender {
    self.button10.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self showBloodSplat];
}

- (IBAction)button11Pressed:(id)sender {
    self.button11.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
}

- (IBAction)button12Pressed:(id)sender {
    self.button12.hidden = YES;
    [self playHitSound];
    self.dao.currentScore = self.dao.currentScore + 10;
    self.scoreLabel.text = [NSString stringWithFormat: @"Score:%i", self.dao.currentScore];
    [self showBloodSplat];
}




@end
