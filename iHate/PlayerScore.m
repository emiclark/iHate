//
//  PlayerScore.m
//  iHate
//
//  Created by Aditya Narayan on 5/5/17.
//
//

#import "PlayerScore.h"

@implementation PlayerScore
//- (void) processPhoto:(UIImage *)photo
- (instancetype)initWithName: (NSString*) name
                    andScore: (NSNumber*) score
{
    self = [super init];
    if (self) {
        self.name = name;
        self.score = score;
    }
    return self;
}

@end
