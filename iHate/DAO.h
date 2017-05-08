//
//  DAO.h
//  iHate
//
//  Created by Alex Laptop on 5/4/17.
//
//

#import <Foundation/Foundation.h>
#import "PlayerScore.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import "Reachability.h"

@import Firebase;

@interface DAO : NSObject
@property(nonatomic, strong) AVAudioPlayer *backgroundMusic;
@property NSString *currentBGSong;
@property BOOL soundON;

@property (strong, nonatomic) UIImage *currentVictim;


@property (strong, nonatomic) NSArray *games;
@property NSDictionary *scoresDict;
@property NSMutableArray *playerScores;
@property NSMutableArray *winningScores;
@property NSString *currentName;
@property int currentScore;
@property (strong, nonatomic) FIRDatabaseReference *ref;

+ (id)sharedDataManager;
- (void) fetchFromDatabase;
- (void) patchDataBase: (NSNumber*) newScore
              andName: (NSString*) newName;
@end
