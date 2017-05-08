//
//  PlayerScore.h
//  iHate
//
//  Created by Aditya Narayan on 5/5/17.
//
//

#import <Foundation/Foundation.h>

@interface PlayerScore : NSObject

@property NSString *name;
@property NSNumber *score;

- (instancetype)initWithName: (NSString*) name
                    andScore: (NSNumber*) score;


@end
