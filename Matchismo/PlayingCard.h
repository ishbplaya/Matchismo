//
//  PlayingCard.h
//  Matchismo
//
//  Created by Ishang Bhan on 12/27/2013.
//  Copyright (c) 2013 Ishang Bhan. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;
@end
